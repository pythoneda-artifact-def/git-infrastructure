# git-infrastructure/flake.nix
#
# This file packages pythoneda-artifact/git-infrastructure as a Nix flake.
#
# Copyright (C) 2023-today rydnr's pythoneda-artifact/git-infrastructure-artifact
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
{
  description = "Infrastructure layer of pythoneda-artifact/git";
  inputs = rec {
    nixos.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
    pythoneda-artifact-git = {
      url = "github:pythoneda-artifact/git-artifact/0.0.1a4?dir=git";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-artifact-changes-shared.follows =
        "pythoneda-shared-artifact-changes-shared";
      inputs.pythoneda-shared-code-requests-events.follows =
        "pythoneda-shared-code-requests-events";
      inputs.pythoneda-shared-code-requests-shared.follows =
        "pythoneda-shared-code-requests-shared";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-artifact-changes-events = {
      url =
        "github:pythoneda-shared-artifact-changes/events-artifact/0.0.1a17?dir=events";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-artifact-changes-shared.follows =
        "pythoneda-shared-artifact-changes-shared";
      inputs.pythoneda-shared-code-requests-events.follows =
        "pythoneda-shared-code-requests-events";
      inputs.pythoneda-shared-code-requests-shared.follows =
        "pythoneda-shared-code-requests-shared";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-artifact-changes-shared = {
      url =
        "github:pythoneda-shared-artifact-changes/shared-artifact/0.0.1a11?dir=shared";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-code-requests-events = {
      url =
        "github:pythoneda-shared-code-requests/events-artifact/0.0.1a7?dir=events";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-artifact-changes-shared.follows =
        "pythoneda-shared-artifact-changes-shared";
      inputs.pythoneda-shared-code-requests-shared.follows =
        "pythoneda-shared-code-requests-shared";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-code-requests-jupyter = {
      url =
        "github:pythoneda-shared-code-requests/jupyter-artifact/0.0.1a6?dir=jupyter";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-code-requests-shared.follows =
        "pythoneda-shared-code-requests-shared";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-code-requests-nix-flake = {
      url =
        "github:pythoneda-shared-code-requests/nix-flake-artifact/0.0.1a6?dir=nix-flake";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-code-requests-shared.follows =
        "pythoneda-shared-code-requests-shared";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-code-requests-shared = {
      url =
        "github:pythoneda-shared-code-requests/shared-artifact/0.0.1a7?dir=shared";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-git-shared = {
      url = "github:pythoneda-shared-git/shared-artifact/0.0.1a15?dir=shared";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
    pythoneda-shared-pythoneda-banner = {
      url = "github:pythoneda-shared-pythoneda/banner/0.0.1a16";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
    };
    pythoneda-shared-pythoneda-domain = {
      url =
        "github:pythoneda-shared-pythoneda/domain-artifact/0.0.1a38?dir=domain";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
    };
    pythoneda-shared-pythoneda-infrastructure = {
      url =
        "github:pythoneda-shared-pythoneda/infrastructure-artifact/0.0.1a24?dir=infrastructure";
      inputs.nixos.follows = "nixos";
      inputs.flake-utils.follows = "flake-utils";
      inputs.pythoneda-shared-pythoneda-banner.follows =
        "pythoneda-shared-pythoneda-banner";
      inputs.pythoneda-shared-pythoneda-domain.follows =
        "pythoneda-shared-pythoneda-domain";
    };
  };
  outputs = inputs:
    with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        org = "pythoneda-artifact";
        repo = "git-infrastructure";
        version = "0.0.1a3";
        sha256 = "sha256-Z4e1r/bYPH4NOdqPS5DKDV1C28NbUqECe4jyEQn0K2w=";
        pname = "${org}-${repo}";
        pythonpackage = builtins.replaceStrings [ "-" ] [ "." ] pname;
        package = builtins.replaceStrings [ "." ] [ "/" ] pythonpackage;
        description = "Infrastructure layer of pythoneda-artifact/git";
        license = pkgs.lib.licenses.gpl3;
        homepage = "https://github.com/${org}/${repo}";
        maintainers = with pkgs.lib.maintainers;
          [ "rydnr <github@acm-sl.org>" ];
        archRole = "B";
        space = "D";
        layer = "I";
        nixosVersion = builtins.readFile "${nixos}/.version";
        nixpkgsRelease =
          builtins.replaceStrings [ "\n" ] [ "" ] "nixos-${nixosVersion}";
        shared = import "${pythoneda-shared-pythoneda-banner}/nix/shared.nix";
        pkgs = import nixos { inherit system; };
        pythoneda-artifact-git-infrastructure-for = { python
          , pythoneda-artifact-git, pythoneda-shared-artifact-changes-events
          , pythoneda-shared-artifact-changes-shared
          , pythoneda-shared-code-requests-events
          , pythoneda-shared-code-requests-jupyter
          , pythoneda-shared-code-requests-nix-flake
          , pythoneda-shared-code-requests-shared, pythoneda-shared-git-shared
          , pythoneda-shared-pythoneda-banner, pythoneda-shared-pythoneda-domain
          , pythoneda-shared-pythoneda-infrastructure }:
          let
            pnameWithUnderscores =
              builtins.replaceStrings [ "-" ] [ "_" ] pname;
            pythonVersionParts = builtins.splitVersion python.version;
            pythonMajorVersion = builtins.head pythonVersionParts;
            pythonMajorMinorVersion =
              "${pythonMajorVersion}.${builtins.elemAt pythonVersionParts 1}";
            wheelName =
              "${pnameWithUnderscores}-${version}-py${pythonMajorVersion}-none-any.whl";
          in python.pkgs.buildPythonPackage rec {
            inherit pname version;
            projectDir = ./.;
            pyprojectTemplateFile = ./pyprojecttoml.template;
            pyprojectTemplate = pkgs.substituteAll {
              authors = builtins.concatStringsSep ","
                (map (item: ''"${item}"'') maintainers);
              desc = description;
              inherit homepage pname pythonMajorMinorVersion pythonpackage
                version;
              package = builtins.replaceStrings [ "." ] [ "/" ] pythonpackage;
              pythonedaArtifactGit = pythoneda-artifact-git.version;
              pythonedaSharedArtifactChangesEvents =
                pythoneda-shared-artifact-changes-events.version;
              pythonedaSharedArtifactChangesShared =
                pythoneda-shared-artifact-changes-shared.version;
              pythonedaSharedCodeRequestsEvents =
                pythoneda-shared-code-requests-events.version;
              pythonedaSharedCodeRequestsJupyter =
                pythoneda-shared-code-requests-jupyter.version;
              pythonedaSharedCodeRequestsNixFlake =
                pythoneda-shared-code-requests-nix-flake.version;
              pythonedaSharedCodeRequestsShared =
                pythoneda-shared-code-requests-shared.version;
              pythonedaSharedGitShared = pythoneda-shared-git-shared.version;
              pythonedaSharedPythonedaBanner =
                pythoneda-shared-pythoneda-banner.version;
              pythonedaSharedPythonedaDomain =
                pythoneda-shared-pythoneda-domain.version;
              pythonedaSharedPythonedaInfrastructure =
                pythoneda-shared-pythoneda-infrastructure.version;
              src = pyprojectTemplateFile;
            };
            src = pkgs.fetchFromGitHub {
              owner = org;
              rev = version;
              inherit repo sha256;
            };

            format = "pyproject";

            nativeBuildInputs = with python.pkgs; [ pip pkgs.jq poetry-core ];
            propagatedBuildInputs = with python.pkgs; [
              pythoneda-artifact-git
              pythoneda-shared-artifact-changes-events
              pythoneda-shared-artifact-changes-shared
              pythoneda-shared-code-requests-events
              pythoneda-shared-code-requests-jupyter
              pythoneda-shared-code-requests-nix-flake
              pythoneda-shared-code-requests-shared
              pythoneda-shared-git-shared
              pythoneda-shared-pythoneda-banner
              pythoneda-shared-pythoneda-domain
              pythoneda-shared-pythoneda-infrastructure
            ];

            # pythonImportsCheck = [ pythonpackage ];

            unpackPhase = ''
              cp -r ${src} .
              sourceRoot=$(ls | grep -v env-vars)
              chmod +w $sourceRoot
              cp ${pyprojectTemplate} $sourceRoot/pyproject.toml
            '';

            postInstall = ''
              pushd /build/$sourceRoot
              for f in $(find . -name '__init__.py'); do
                if [[ ! -e $out/lib/python${pythonMajorMinorVersion}/site-packages/$f ]]; then
                  cp $f $out/lib/python${pythonMajorMinorVersion}/site-packages/$f;
                fi
              done
              popd
              mkdir $out/dist $out/bin
              cp dist/${wheelName} $out/dist
              jq ".url = \"$out/dist/${wheelName}\"" $out/lib/python${pythonMajorMinorVersion}/site-packages/${pnameWithUnderscores}-${version}.dist-info/direct_url.json > temp.json && mv temp.json $out/lib/python${pythonMajorMinorVersion}/site-packages/${pnameWithUnderscores}-${version}.dist-info/direct_url.json
            '';

            meta = with pkgs.lib; {
              inherit description homepage license maintainers;
            };
          };
      in rec {
        defaultPackage = packages.default;
        devShells = rec {
          default = pythoneda-artifact-git-infrastructure-default;
          pythoneda-artifact-git-infrastructure-default =
            pythoneda-artifact-git-infrastructure-python310;
          pythoneda-artifact-git-infrastructure-python38 = shared.devShell-for {
            package = packages.pythoneda-artifact-git-infrastructure-python38;
            python = pkgs.python38;
            pythoneda-shared-pythoneda-banner =
              pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python38;
            pythoneda-shared-pythoneda-domain =
              pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python38;
            inherit archRole layer nixpkgsRelease org pkgs repo space;
          };
          pythoneda-artifact-git-infrastructure-python39 = shared.devShell-for {
            package = packages.pythoneda-artifact-git-infrastructure-python39;
            python = pkgs.python39;
            pythoneda-shared-pythoneda-banner =
              pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python39;
            pythoneda-shared-pythoneda-domain =
              pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python39;
            inherit archRole layer nixpkgsRelease org pkgs repo space;
          };
          pythoneda-artifact-git-infrastructure-python310 =
            shared.devShell-for {
              package =
                packages.pythoneda-artifact-git-infrastructure-python310;
              python = pkgs.python310;
              pythoneda-shared-pythoneda-banner =
                pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python310;
              pythoneda-shared-pythoneda-domain =
                pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python310;
              inherit archRole layer nixpkgsRelease org pkgs repo space;
            };
        };
        packages = rec {
          default = pythoneda-artifact-git-infrastructure-default;
          pythoneda-artifact-git-infrastructure-default =
            pythoneda-artifact-git-infrastructure-python310;
          pythoneda-artifact-git-infrastructure-python38 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python38;
              pythoneda-artifact-git =
                pythoneda-artifact-git.packages.${system}.pythoneda-artifact-git-python38;
              pythoneda-shared-artifact-changes-events =
                pythoneda-shared-artifact-changes-events.packages.${system}.pythoneda-shared-artifact-changes-events-python38;
              pythoneda-shared-artifact-changes-shared =
                pythoneda-shared-artifact-changes-shared.packages.${system}.pythoneda-shared-artifact-changes-shared-python38;
              pythoneda-shared-code-requests-events =
                pythoneda-shared-code-requests-events.packages.${system}.pythoneda-shared-code-requests-events-python38;
              pythoneda-shared-code-requests-jupyter =
                pythoneda-shared-code-requests-jupyter.packages.${system}.pythoneda-shared-code-requests-jupyter-python38;
              pythoneda-shared-code-requests-nix-flake =
                pythoneda-shared-code-requests-nix-flake.packages.${system}.pythoneda-shared-code-requests-nix-flake-python38;
              pythoneda-shared-code-requests-shared =
                pythoneda-shared-code-requests-shared.packages.${system}.pythoneda-shared-code-requests-shared-python38;
              pythoneda-shared-git-shared =
                pythoneda-shared-git-shared.packages.${system}.pythoneda-shared-git-shared-python38;
              pythoneda-shared-pythoneda-banner =
                pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python38;
              pythoneda-shared-pythoneda-domain =
                pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python38;
              pythoneda-shared-pythoneda-infrastructure =
                pythoneda-shared-pythoneda-infrastructure.packages.${system}.pythoneda-shared-pythoneda-infrastructure-python38;
            };
          pythoneda-artifact-git-infrastructure-python39 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python39;
              pythoneda-artifact-git =
                pythoneda-artifact-git.packages.${system}.pythoneda-artifact-git-python39;
              pythoneda-shared-artifact-changes-events =
                pythoneda-shared-artifact-changes-events.packages.${system}.pythoneda-shared-artifact-changes-events-python39;
              pythoneda-shared-artifact-changes-shared =
                pythoneda-shared-artifact-changes-shared.packages.${system}.pythoneda-shared-artifact-changes-shared-python39;
              pythoneda-shared-code-requests-events =
                pythoneda-shared-code-requests-events.packages.${system}.pythoneda-shared-code-requests-events-python39;
              pythoneda-shared-code-requests-jupyter =
                pythoneda-shared-code-requests-jupyter.packages.${system}.pythoneda-shared-code-requests-jupyter-python39;
              pythoneda-shared-code-requests-nix-flake =
                pythoneda-shared-code-requests-nix-flake.packages.${system}.pythoneda-shared-code-requests-nix-flake-python39;
              pythoneda-shared-code-requests-shared =
                pythoneda-shared-code-requests-shared.packages.${system}.pythoneda-shared-code-requests-shared-python39;
              pythoneda-shared-git-shared =
                pythoneda-shared-git-shared.packages.${system}.pythoneda-shared-git-shared-python39;
              pythoneda-shared-pythoneda-banner =
                pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python39;
              pythoneda-shared-pythoneda-domain =
                pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python39;
              pythoneda-shared-pythoneda-infrastructure =
                pythoneda-shared-pythoneda-infrastructure.packages.${system}.pythoneda-shared-pythoneda-infrastructure-python39;
            };
          pythoneda-artifact-git-infrastructure-python310 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python310;
              pythoneda-artifact-git =
                pythoneda-artifact-git.packages.${system}.pythoneda-artifact-git-python310;
              pythoneda-shared-artifact-changes-events =
                pythoneda-shared-artifact-changes-events.packages.${system}.pythoneda-shared-artifact-changes-events-python310;
              pythoneda-shared-artifact-changes-shared =
                pythoneda-shared-artifact-changes-shared.packages.${system}.pythoneda-shared-artifact-changes-shared-python310;
              pythoneda-shared-code-requests-events =
                pythoneda-shared-code-requests-events.packages.${system}.pythoneda-shared-code-requests-events-python310;
              pythoneda-shared-code-requests-jupyter =
                pythoneda-shared-code-requests-jupyter.packages.${system}.pythoneda-shared-code-requests-jupyter-python310;
              pythoneda-shared-code-requests-nix-flake =
                pythoneda-shared-code-requests-nix-flake.packages.${system}.pythoneda-shared-code-requests-nix-flake-python310;
              pythoneda-shared-code-requests-shared =
                pythoneda-shared-code-requests-shared.packages.${system}.pythoneda-shared-code-requests-shared-python310;
              pythoneda-shared-git-shared =
                pythoneda-shared-git-shared.packages.${system}.pythoneda-shared-git-shared-python310;
              pythoneda-shared-pythoneda-banner =
                pythoneda-shared-pythoneda-banner.packages.${system}.pythoneda-shared-pythoneda-banner-python310;
              pythoneda-shared-pythoneda-domain =
                pythoneda-shared-pythoneda-domain.packages.${system}.pythoneda-shared-pythoneda-domain-python310;
              pythoneda-shared-pythoneda-infrastructure =
                pythoneda-shared-pythoneda-infrastructure.packages.${system}.pythoneda-shared-pythoneda-infrastructure-python310;
            };
        };
      });
}
