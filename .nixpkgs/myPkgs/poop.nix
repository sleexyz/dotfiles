{ stdenv, fetchurl, cmake, pkgconfig
, libjack2, libsndfile, fftw, curl, gcc
, libXt, qt5, readline
, useSCEL ? false, emacs
}:

let optional = stdenv.lib.optional;
ljack2 = libjack2.override { gcc = gcc; };
in

stdenv.mkDerivation rec {
  name = "supercollider-3.7.2";
  version = "3.7.2";

  meta = {
    description = "Programming language for real time audio synthesis";
    homepage = "http://github.com/supercollider";
    license = stdenv.lib.licenses.gpl3Plus;
    platforms = stdenv.lib.platforms.linux;
  };

  src = fetchurl {
    url = "https://github.com/supercollider/supercollider/releases/download/Version-${version}/SuperCollider-${version}-Source-linux.tar.bz2";
    sha256 = "11khrv6jchs0vv0lv43am8lp0x1rr3h6l2xj9dmwrxcpdayfbalg";
  };

  # QGtkStyle unavailable
  patchPhase = ''
    substituteInPlace editors/sc-ide/widgets/code_editor/autocompleter.cpp \
      --replace Q_WS_X11 Q_GTK_STYLE
  '';

  cmakeFlags = ''
    -DSC_WII=OFF
    -DSC_EL=${if useSCEL then "ON" else "OFF"}
  '';

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [
    gcc ljack2 libsndfile fftw curl libXt qt5 readline ]
    ++ optional useSCEL emacs;
}
