#!/bin/bash
brews="antlr	gettext	libpng	osxfuse	ruby	bash	git	libtiff	perl	sshfs	cairo	glib	libyaml	tmux	unrar	cmake	pkg-config	vim	coreutils	jpeg	mpfr	protobuf	wget	fontconfig	libevent	r	xz	freetype	libffi	node	readline	gcc	libmp	copen	ssl	reattach-to-user-namespace"

for bre in $brews 
do
  brew install "$bre"
done

