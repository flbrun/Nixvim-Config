{
  description = "Florian’s custom Nixvim configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
    let
      systems = nixpkgs.lib.systems.flakeExposed;
    in
    {

      packages = nixpkgs.lib.genAttrs systems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          nixvimPkgs = nixvim.legacyPackages.${system};
        in
        {
          default = nixvimPkgs.makeNixvimWithModule {
            inherit pkgs;
            module = {
              imports = [ ./config ];
            };
          };
        }
      );

      nixvimModule = {
        programs.nixvim = {
          enable = true;
          defaultEditor = true;
          imports = [ ./config ];
        };
      };

    };
}
