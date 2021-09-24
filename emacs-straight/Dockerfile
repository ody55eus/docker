# IMAGE: docker build . -t ody55eus/emacs-straight:latest
FROM ody55eus/publish
MAINTAINER Jonathan Pieper <jpieper@mailbox.org>

COPY emacs-straight/straight.el ~/.emacs.d/init.el
RUN emacs --quick --script ~/.emacs.d/init.el
