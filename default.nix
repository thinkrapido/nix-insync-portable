{fetchurl,stdenv,buildFHSUserEnv,dpkg,writeScript,tree,lib}:
let
  package = stdenv.mkDerivation rec {

    pname = "insync-headless";
    version = "3.0.4.10602";

    src = 
      if stdenv.hostPlatform.system == "x86_64-linux" then
          fetchurl {
              url = "https://cdn.insynchq.com/builds/linux/insync_3.8.6.50504-mantic_amd64.deb";
              sha256 = "13yjqnwfa4vs3ks6i1jdc3p16dj1jw553ra482hn8kfck169zx21";
          }
      else
        throw "${pname}-${version} is not supported on ${stdenv.hostPlatform.system}";

    unpackCmd = "${dpkg}/bin/dpkg-deb -x $curSrc .";

    installPhase = ''
      mkdir -p $out
      cp -r . $out/
    '';

    meta = with lib; {
      homepage = "https://www.insynchq.com";
      description = "Google Drive & OneDrive Syncing on Linux, Windows & Mac";
      platforms = [ "x86_64-linux" ];
      license = licenses.unfree;
    };
  };
in
  # putting it in a fhs is sadly necessary, because the insync binary checks the path it is installed at.
  # this was found out by tinywrkb (https://forums.insynchq.com/t/flatpak-related-issues/16016/11)
  buildFHSUserEnv rec {
    name = "insync-headless";
    targetPkgs = pkgs: [
      package
      pkgs.zlib
    ];
    runScript = writeScript "${name}-wrapper" ''
      exec /usr/bin/insync-headless $@
    '';
  }
