{
  description = "A flake for the HackReason Project";
  # Provides abstraction to boiler-code when specifying multi-platform outputs.
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ ciao ];
          shellHook = ''
            export PATH="/home/emiller/.ciao/build/bin:$PATH"
          '';
        };
      });
}
