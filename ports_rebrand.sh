#!/bin/ksh

#########################
# Name: ports_rebrand.sh
# Main: jadedctrl
# Lisc: ISC
# Desc: Editing OBSD ports
#       tree for use with
#       LBSD.
#########################

# Usage: ports_deblob.sh

. ./libdeblob.sh

PATCH_DIR=/tmp/ports_rebrand/

if [ -e $PATCH_DIR ]
then
        self_destruct_sequence $PATCH_DIR
	mkdir $PATCH_DIR
else
        mkdir $PATCH_DIR
fi

if test -z $1
then
        SRC_DIR=/usr/ports/
else
        SRC_DIR=$1
fi

rep "\${MACHINE-ARCH}-openbsd" "\${MACHINE-ARCH}-libertybsd" infrastructure/mk/perl.port.mk

# List of ports that require an OBSD build_alias env var
archiverslist="archivers/libzip archivers/gcab archivers/gcpio archivers/gshar+gunshar archivers/gtar archivers/libarchive archivers/libmspack archivers/libtar archivers/lzo archivers/xz"
archiverslist="$archiverslsit archivers/lzop archivers/par2cmdline"
audiolist="audio/freealut"
converterslist="converters/libiconv"
dabataseslist="databases/db/v3 databases/db/v4 databases/openldap databases/sqlite3 databases/gdbm"
devellist="devel/autoconf/2.13 devel/autoconf/2.52 devel/autoconf/2.54 devel/autoconf/2.56 devel/autoconf/2.57 devel/autoconf/2.58 devel/autoconf/2.59 devel/autoconf/2.60"
devellist="$devellist devel/autoconf/2.61 devel/autoconf/2.62 devel/autoconf/2.63 devel/autoconf/2.64 devel/autoconf/2.65 devel/autoconf/2.66 devel/autoconf/2.67 devel/autoconf/2.68"
devellist="$devllist devel/autoconf/2.69 devel/automake/1.4 devel/automake/1.8 devel/automake/1.9 devel/automake/1.10 devel/automake/1.11 devel/automake/1.12 devel/automake/1.13"
devellist="$devellist devel/automake/1.14 devel/automake/1.15 devel/libtool devel/libidn devel/gmake devel/llvm devel/sdl2-image devel/sdl2 devel/apr devel/apr-util devel/t1lib"
devellist="$devellist devel/bison devel/gettext devel/gettext-tools devel/libsigsegv devel/ffcall"
editorslist="editors/nano"
gameslist="games/xscorch"
geolist="geo/spatialindex"
langlist="lang/ghc lang/clisp"
maillist="mail/mutt mail/alpine"
netlist="net/openvpn"
printlist="print/libpaper"
securitylist="security/cyrus-sasl2 security/libmcrypt"
shellslist="shells/bash"
sysutilslist="sysutils/e2fsprogs"
textproclist="textproc/groff"
wwwlist="www/lynx www/apache-httpd"

portlist="$archiverslist $audiolist $databaseslist $devellist $editorslist $gameslist $geolist $langlist $maillist $netlist $securitylist $sysutilslist $textproclist $wwwlist"

# Add the build_alias env variable to listed ports
for port in $portlist
do
	rep ".include <bsd.port.mk>" "CONFIGURE_ENV +=        build_alias=\"\${ARCH}-unknown-openbsd6.1\"" $port/Makefile
	lineadd  "CONFIGURE_ENV +=        build_alias=\"\${ARCH}-unknown-openbsd6.1\"" ".include <bsd.port.mk>" $port/Makefile
done


# Port-specific changes
rep ".include <bsd.port.mk>" "CONFIGURE_ENV +=        build_alias=\"\${ARCH}-unknown-openbsd\"" lang/ghc/Makefile
lineadd  "CONFIGURE_ENV +=        build_alias=\"\${ARCH}-unknown-openbsd\"" ".include <bsd.port.mk>" lang/ghc/Makefile
lineadd "pre-configure:" "        cp -r \${FILESDIR}/Platform/LibertyBSD.cmake \${WRKSRC}/Modules/Platform/LibertyBSD.cmake" devel/cmake/Makefile
dircp files/ports/files/Platform devel/cmake/files/Platform


# Misc. infrastructure edits
lineadd "*:OpenBSD:*:*)" "*:LibertyBSD:*:*)" infrastructure/db/config.guess
lineadd "*:OpenBSD:*:*)" "        exit ;;" infrastructure/db/config.guess
lineadd "*:OpenBSD:*:*)" "        echo \${UNAME_MACHINE_ARCH}-unknown-openbsd\${UNAME_RELEASE}" infrastructure/db/config.guess
lineadd "*:OpenBSD:*:*)" "        UNAME_MACHINE_ARCH=\`arch | sed 's/^.*BSD\.//'\`" infrastructure/db/config.guess

# Problem childs:
# * lang/python/2.7	"configure: error: cannot run C compiled programs."	It configures just fine (using same args as used when configuring in ports) manually, but not using port.
apply
