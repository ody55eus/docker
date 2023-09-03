# IMAGE: docker build . -t ody55eus/publish:latest
FROM debian:bookworm
MAINTAINER Jonathan Pieper <ody55eus@mailbox.org>

# Install system packages
RUN apt-get update --fix-missing && apt-get upgrade -y && \
    apt-get install -y \
    curl git nodejs default-jre cabal-install python3-pip \
    texlive-science texlive-latex-extra texlive-publishers \
    dvipng man-db cm-super graphviz emacs && \
    apt-get --purge remove -y .\*-doc$ && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PlantUML
RUN curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download > /usr/local/bin/plantuml.jar

# Install Pandoc
# see <https://github.com/pandoc/dockerfiles/blob/master/ubuntu/Dockerfile#L33>
ARG pandoc_commit=master
RUN git clone --branch=$pandoc_commit --depth=1 --quiet \
  https://github.com/jgm/pandoc /usr/src/pandoc

# Install Haskell dependencies
COPY cabal.root.config /root/.cabal/config
RUN cabal --version \
  && ghc --version \
  && cabal new-update

WORKDIR /usr/src/pandoc
# Add pandoc-crossref to project
ARG without_crossref=
RUN test -n "$without_crossref" || \
    printf "extra-packages: pandoc-crossref\n" > cabal.project.local;

# Additional projects to compile alongside pandoc
ARG extra_packages="pandoc-crossref" # pandoc-citeproc

RUN cabal new-update \
  && cabal new-build \
      --disable-tests \
      --jobs \
      . $extra_packages

# Cabal's exec stripping doesn't seem to work reliably, let's do it here.
RUN find dist-newstyle \
         -name 'pandoc*' -type f -perm -u+x \
         -exec strip '{}' ';' \
         -exec cp '{}' /usr/local/bin/ ';'

WORKDIR /root
