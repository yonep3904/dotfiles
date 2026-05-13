{ config, pkgs, lib, ... }:

{
  networking = {
    # hostname = "nix-os"; # Define your hostname. But set in configuration.nix
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
      allowedUDPPorts = [];
    };

    networkmanager.plugins = with pkgs; [
      networkmanager-openvpn
    ];

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  environment.systemPackages = with pkgs; [
    openvpn
  ];

  security.pki.certificates = [
    # 社内 / 学内 CA がある場合はここに追加
    # (例)
    # ./company-ca.pem
  ];

  environment.variables = {
    SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
    SSL_CERT_DIR  = "/etc/ssl/certs";
  };
}
