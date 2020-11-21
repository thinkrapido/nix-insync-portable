{fetchurl,stdenv,autoPatchelfHook,dpkg,lib,makeWrapper}:
stdenv.mkDerivation rec {

  pname = "insync-headless";
  version = "3.0.4.10602";

  src = 
    if stdenv.hostPlatform.system == "x86_64-linux" then
        fetchurl {
            url = "https://d2t3ff60b2tol4.cloudfront.net/builds/insync-headless_3.0.4.10602-buster_amd64.deb";
            sha256 = "0ja6jzd2q3na6z22jhh5r1md12imr3y85mbigbr52xav4lw2y18j";
        }
    else
      throw "${pname}-${version} is not supported on ${stdenv.hostPlatform.system}";

  unpackCmd = "${dpkg}/bin/dpkg-deb -x $curSrc .";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    makeWrapper
  ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out/
    makeWrapper $out/lib/insync/insync-headless $out/bin/insync-headless --set LC_TIME C
  '';

  meta = with lib; {
    homepage = "https://www.insynchq.com";
    description = "Google Drive & OneDrive Syncing on Linux, Windows & Mac";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfree;
  };
}
