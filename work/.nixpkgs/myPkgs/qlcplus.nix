{ stdenv, fetchurl, pkgconfig, qt5, libftdi1, alsaLib, libudev, libusb}:

stdenv.mkDerivation rec {
  name = "qlcplus-${version}";
  version = "4.10.3";

  src = fetchurl {
    url = "http://www.qlcplus.org/downloads/${version}/qlcplus_${version}.tar.gz";
    sha256 = "1mrhlqvbgs8qnj7qik70a3gywvmck1malygqi0hm403j5w6f2bgb";
  };

  buildInputs = [ libudev qt5.qtbase libftdi1 alsaLib libusb qt5.qtmultimedia qt5.qtscript ];
  nativeBuildInputs = [ pkgconfig qt5.qmakeHook qt5.makeQtWrapper ];

  qmakeFlags = "QMAKE_CXXFLAGS+=-Wno-error=unused-variable";
  
  makeFlags = [ "PREFIX=$(out)" ];
  installFlags = [ "INSTALL_ROOT=$(out)" ];

  postInstall = ''
    mv $out/usr/bin $out/bin
    wrapQtProgram $out/bin/qlcplus \
      --prefix LD_LIBRARY_PATH : $out/usr/lib
  '';

  meta = {
    description = "The open DMX lighting desk software for controlling professional lighting fixtures";
    homepage = http://www.qlcplus.org;
    license = stdenv.lib.licenses.apache;
    maintainers = with stdenv.lib.maintainers; [ sleexyz ];
    platforms = with stdenv.lib.platforms; linux;
  };
}
