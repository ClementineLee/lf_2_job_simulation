{
  description = "Phoenix development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs {
      system = "aarch64-darwin";
    };
  in {
    devShells.aarch64-darwin.default = pkgs.mkShell {
      packages = with pkgs; [
        #Have Packages be up to date with floating Channel
	      beamPackages.elixir
        #postgresql
        git
      ];
	shellHook = '' 

      export ZSH_NIX_SHELL_THEME=1
  		export MIX_HOME="$PWD/.mix"
  		export HEX_HOME="$PWD/.hex"
      export DB_PW=$(cat ./_password/db_pw)

		  if ! mix archive | grep phx_new >/dev/null; then
		    mix archive.install hex phx_new --force
 	    fi

      exec zsh
	'';
    };
  };
}
