mkdir output
apt update
apt install -y \
              make \
              clang \
              libseccomp-dev \
              libcap-dev \
              libc6-dev \
              binutils git build-essential zlib1g-dev liblzma-dev libssl-dev  automake  libtool libtool-bin bison flex gettext autoconf  autopoint libsqlite3-0 sqlite3 libsqlite3-dev libpsl-dev wget texi2html texinfo dh-package-notes docbook-xml docbook-xsl gettext itstool libacl1-dev libattr1-dev libaudit-dev libbsd-dev libcrypt-dev libltdl-dev libpam0g-dev libselinux-dev libsemanage-dev libxml2-utils pkgconf quilt xsltproc musl-tools
git clone https://github.com/file/file
cd file
autoreconf -vif
./configure --disable-nss --enable-static --disable-shared --disable-liblastlog2
make -j8
strip src/file
cp src/file ../output/
cd ..
git clone https://github.com/curl/curl
cd curl
autoreconf -fi
./configure --disable-nss --enable-static --without-shared --with-ssl
make -j8
strip src/curl
cp src/curl ../output/
tar -cvf $(uname -m).tar output/.