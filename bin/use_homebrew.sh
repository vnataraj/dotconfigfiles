brews="antlr,gettext,libpng,osxfuse,ruby,bash,git,libtiff,perl,sshfs,cairo,glib,libyaml,phantomjs,tmux,cloog,gmp,maven,pixman,unrar,cmake,isl,mobile-shell,pkg-config,vim,coreutils,jpeg,mpfr,protobuf,wget,fontconfig,libevent,mysql,r,xz,freetype,libffi,node,readline,gcc,libmp,copen,ssl,reattach-to-user-namespace"

for $brew in $brews do
  brew install $brew
done
