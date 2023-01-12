{
  description = "Script to refresh the Quantum Go DNS server";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
  inputs.pbddns.url = github:skoobasteeve/porkbun-dynamic-dns-python/ddns-no-delete-unless-change;
  inputs.pbddns.flake = false;

  outputs = { self, nixpkgs, pbddns }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation rec {
        name = "qgo-dns-refresher";
        src = self;
        inherit pbddns;
        py3 = python3.withPackages (p: [p.requests]);
        buildInputs = [ py3 refreshDns ];
        refreshDns = pkgs.writeShellScriptBin "porkbun-ddns" ''
          ${py3}/bin/python3 ${pbddns}/porkbun-ddns.py $1 quantumgo.net
          ${py3}/bin/python3 ${pbddns}/porkbun-ddns.py $1 quantumgo.net test
        '';
        # buildPhase = "gcc -o hello ./hello.c";
        installPhase = ''
          mkdir -p $out/bin
          install -t $out/bin $refreshDns/bin/porkbun-ddns
        '';
      };

  };
}

