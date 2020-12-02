{ config, lib, pkgs, ... }: with lib; let 
    cfg = config.services.insync-headless;
    package = cfg.package;
    enabled = cfg.enable;
in {
    options = {
        services.insync-headless = {
            enable = mkEnableOption "Insync Headless";
            package = mkOption {
                type = types.package;
                example = literalExample "pkgs.insync-headless";
                default = pkgs.callPackage ./default.nix {};
                description = "
                    Which insync-headless derivation to use.
                ";
            };
        };
    };
    config = mkIf enabled {
        systemd.user.services.insync-headless = {
            Unit.Description = "Insync Headless";
            Install.WantedBy = [ "graphical-session.target" ];
            Service = {
                ExecStart = ''${package}/bin/insync-headless start --no-daemon'';
                ExecStop = ''${package}/bin/insync-headless stop'';
            };
        };
        home.packages = [package];
    };
}
