# IMAGE: docker build . -t ody55eus/emacs-straight:latest
FROM ody55eus/publish
MAINTAINER Jonathan Pieper <jpieper@mailbox.org>

RUN mkdir -p /root/.emacs.d
COPY emacs-straight/straight.el /root/.emacs.d/init.el
RUN emacs --quick --script /root/.emacs.d/init.el
