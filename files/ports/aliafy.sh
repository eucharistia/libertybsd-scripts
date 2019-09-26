#!/bin/ksh

########################################################
# aliafy.sh
# List of ports that require an OBSD build_alias env var
########################################################

astrolist="gcal wcslib"

archiverslist="libzip gcab gcpio gshar+gunshar gtar libarchive libmspack libtar lzo xz zziplib gcab lzop par2cmdline"

audiolist="freealut akode twolame audacious pulseaudio jack libcue audacious-plugins ardour soundtouch gstreamer1/mm"
audiolist="$audiolist easytag freealut gmpc-plugins gsound libbs2b libcannberra mikmod mpdscribble umurmur libao libogg"
audiolist="$audiolist flac libvorbis libsndfile libsamplerate"

cadlist="qucs"

chineselist="libchewing"

commslist="fldigi gnokii"

converterslist="libiconv p5-Convert-Color"

databaseslist="db/v3 db/v4 openldap sqlite3 gdbm yasm iodbc mariadb apache-couchdb libzdb mdbtools libpqxx pgadmin3"

devellist="autoconf/2.13 autoconf/2.52 autoconf/2.54 autoconf/2.56 autoconf/2.57 autoconf/2.58 autoconf/2.59 autoconf/2.60"
devellist="$devellist autoconf/2.61 autoconf/2.62 autoconf/2.63 autoconf/2.64 autoconf/2.65 autoconf/2.66 autoconf/2.67"
devellist="$devellist autoconf/2.68 autoconf/2.69 automake/1.4 automake/1.8 automake/1.9 automake/1.10 automake/1.11 automake/1.12"
devellist="$devellist automake/1.13 automake/1.14 automake/1.15 libtool libidn gmake llvm sdl2-image sdl2 apr apr-util t1lib"
devellist="$devellist bison gettext gettext-tools libsigsegv ffcall gobject-introspection yasm sdl cppunit json-glib libsoup"
devellist="$devellist libsigc++-2 glib2mm atk2mm libnotify npth check pangomm scons readline sdl-mixer libconfuse libconfig"
devellist="$devellist libgdata autogen boehm-gc commoncpp ccrtp cflow cgdb cil libffi pcre glib2 atk libuv harfbuzz pango libusb1"
devellist="$devellist libdaemon libidn2 nspr mozjs17"

editorslist="nano"

gameslist="xscorch"

graphicslist="cairo gd ImageMagick djvulibre png jpeg tiff gdk-pixbuff2 lcms2 colord"

geolist="spatialindex geoclue2"

langlist="ghc clisp gawk guile ghc errlang/16 ocaml"

maillist="mutt alpine"

mathlist="graphviz"

misclist="findutils"

multimedialist="xvidcore libmp4v2"

netlist="openvpn librest quvi/scripts quvi/libquvi quvi uhttpmock telepathy/telepathy-glib curl avahi"

printlist="libpaper texlive/base texlive/texmf psutils lilypond cups"

securitylist="cyrus-sasl2 libmcrypt libtasn1 p11-kit pinentry gpgme libnettle"

shellslist="bash"

sysutilslist="e2fsprogs polkit consolekit freeipmi coreutils polkit"

textproclist="groff jq rapto raptorr tre libxslt icu4c"

wwwlist="lynx apache-httpd webkit nghttpd2"

x11list="gnome/at-spi2-core gnome/at-spi2-atk gnome/py-atspi gnome/libsecret gnome/gcr xkbcommon gtk2mm gnome/libgnomecanvasmm"

x11list="$x11list gtk3mm dbus-python gnome/yelp gnome/libgnome gnome/libgnomeui kde/art3 gnome/libgweather"

astrolist="$(echo "$astrolist" | sed -E 's`( |^)`\1astro/`g')"
archiverslist="$(echo "$archiverslist" | sed -E 's`( |^)`\1archivers/`g')"
audiolist="$(echo "$audiolist" | sed -E 's`( |^)`\1audio/`g')"
cadlist="$(echo "$cadlist" | sed -E 's`( |^)`\1cad/`g')"
chineselist="$(echo "$chineselist" | sed -E 's`( |^)`\1chinese/`g')"
commslist="$(echo "$commslist" | sed -E 's`( |^)`\1comms/`g')"
converterslist="$(echo "$converterslist" | sed -E 's`( |^)`\1converters/`g')"
databaseslist="$(echo "$databaseslist" | sed -E 's`( |^)`\1databases/`g')"
devellist="$(echo "$devellist" | sed -E 's`( |^)`\1devel/`g')"
editorslist="$(echo "$editorslist" | sed -E 's`( |^)`\1editors/`g')"
gameslist="$(echo "$gameslist" | sed -E 's`( |^)`\1games/`g')"
graphicslist="$(echo "$graphicslist" | sed -E 's`( |^)`\1graphics/`g')"
geolist="$(echo "$geolist" | sed -E 's`( |^)`\1geo/`g')"
langlist="$(echo "$langlist" | sed -E 's`( |^)`\1lang/`g')"
maillist="$(echo "$maillist" | sed -E 's`( |^)`\1mail/`g')"
mathllist="$(echo "$mathlist" | sed -E 's`( |^)`\1math/`g')"
misclist="$(echo "$misclist" | sed -E 's`( |^)`\1misc/`g')"
multimedialist="$(echo "$multimedialist" | sed -E 's`( |^)`\1multimedia/`g')"
netlist="$(echo "$netlist" | sed -E 's`( |^)`\1net/`g')"
printlist="$(echo "$printlist" | sed -E 's`( |^)`\1print/`g')"
securitylist="$(echo "$securitylist" | sed -E 's`( |^)`\1security/`g')"
shellslist="$(echo "$shellslist" | sed -E 's`( |^)`\1shells/`g')"
sysutils="$(echo "$sysutilslist" | sed -E 's`( |^)`\1sysutils/`g')"
textproclist="$(echo "$textproclist" | sed -E 's`( |^)`\1textproc/`g')"
wwwlist="$(echo "$wwwlist" | sed -E 's`( |^)`\1www/`g')"
x11list="$(echo "$x11list" | sed -E 's`( |^)`\1x11/`g')"

portlist="$archiverslist $audiolist $converterslist $databaseslist $devellist $editorslist $gameslist $graphicslist $geolist"
portlist="$portlist $langlist $maillist $mathlist $multimedialist $netlist $printlist $securitylist $shellslist $sysutilslist"
portlist="$portlist $textproclist $wwwlist $x11list"
echo $astrolist