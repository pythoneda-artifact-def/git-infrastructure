# flake.nix
#
# This file packages pythoneda-artifact/git-infrastructure as a Nix flake.
#
# Copyright (C) 2023-today rydnr's pythoneda-artifact-def/git-infrastructure
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
  description = "Nix flake for pythoneda-artifact/git-infrastructure";
  inputs = rec {
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    pythoneda-shared-artifact-code-events = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      inputs.pythoneda-shared-pythonlang-domain.follows =
        "pythoneda-shared-pythonlang-domain";
      url = "github:pythoneda-shared-artifact-def/code-events/0.0.91";
    };
    pythoneda-shared-artifact-code-events-infrastructure = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      inputs.pythoneda-shared-pythonlang-domain.follows =
        "pythoneda-shared-pythonlang-domain";
      inputs.pythoneda-shared-pythonlang-infrastructure.follows =
        "pythoneda-shared-pythonlang-infrastructure";
      url =
        "github:pythoneda-shared-artifact-def/code-events-infrastructure/0.0.96";
    };
    pythoneda-shared-artifact-events = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      inputs.pythoneda-shared-pythonlang-domain.follows =
        "pythoneda-shared-pythonlang-domain";
      url = "github:pythoneda-shared-artifact-def/events/0.0.100";
    };
    pythoneda-shared-artifact-events-infrastructure = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-artifact-events.follows =
        "pythoneda-shared-artifact-events";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      inputs.pythoneda-shared-pythonlang-domain.follows =
        "pythoneda-shared-pythonlang-domain";
      inputs.pythoneda-shared-pythonlang-infrastructure.follows =
        "pythoneda-shared-pythonlang-infrastructure";
      url = "github:pythoneda-shared-artifact-def/events-infrastructure/0.0.91";
    };
    pythoneda-shared-pythonlang-banner = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:pythoneda-shared-pythonlang-def/banner/0.0.85";
    };
    pythoneda-shared-pythonlang-domain = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      url = "github:pythoneda-shared-pythonlang-def/domain/0.0.131";
    };
    pythoneda-shared-pythonlang-infrastructure = {
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pythoneda-shared-pythonlang-banner.follows =
        "pythoneda-shared-pythonlang-banner";
      inputs.pythoneda-shared-pythonlang-domain.follows =
        "pythoneda-shared-pythonlang-domain";
      url = "github:pythoneda-shared-pythonlang-def/infrastructure/0.0.104";
    };
  };
  outputs = inputs:
    with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        org = "pythoneda-artifact";
        repo = "git-infrastructure";
        version = "0.0.10";
        sha256 = "0wdv1bhjqlpv05vkmqkni2xnw3fm97a7b2vwyd86n4qj30a4ky9n";
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
        nixpkgsVersion = builtins.readFile "${nixpkgs}/.version";
        nixpkgsRelease =
          builtins.replaceStrings [ "\n" ] [ "" ] "nixpkgs-${nixpkgsVersion}";
        shared = import "${pythoneda-shared-pythonlang-banner}/nix/shared.nix";
        pkgs = import nixpkgs { inherit system; };
        pythoneda-artifact-git-infrastructure-for = { python
          , pythoneda-shared-artifact-code-events
          , pythoneda-shared-artifact-code-events-infrastructure
          , pythoneda-shared-artifact-events
          , pythoneda-shared-artifact-events-infrastructure
          , pythoneda-shared-pythonlang-domain
          , pythoneda-shared-pythonlang-infrastructure }:
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
            pyprojectTomlTemplate = ./templates/pyproject.toml.template;
            pyprojectToml = pkgs.substituteAll {
              authors = builtins.concatStringsSep ","
                (map (item: ''"${item}"'') maintainers);
              desc = description;
              inherit homepage pname pythonMajorMinorVersion package
                version;
              dbusNext = python.pkgs.dbus-next.version;
              pythonedaSharedArtifactCodeEvents =
                pythoneda-shared-artifact-code-events.version;
              pythonedaSharedArtifactCodeEventsInfrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.version;
              pythonedaSharedArtifactEvents =
                pythoneda-shared-artifact-events.version;
              pythonedaSharedArtifactEventsInfrastructure =
                pythoneda-shared-artifact-events-infrastructure.version;
              pythonedaSharedPythonlangDomain =
                pythoneda-shared-pythonlang-domain.version;
              pythonedaSharedPythonlangInfrastructure =
                pythoneda-shared-pythonlang-infrastructure.version;
              src = pyprojectTomlTemplate;
            };
            src = pkgs.fetchFromGitHub {
              owner = org;
              rev = version;
              inherit repo sha256;
            };

            format = "pyproject";

            nativeBuildInputs = with python.pkgs; [ pip poetry-core ];
            propagatedBuildInputs = with python.pkgs; [
              dbus-next
              pythoneda-shared-artifact-code-events
              pythoneda-shared-artifact-code-events-infrastructure
              pythoneda-shared-artifact-events
              pythoneda-shared-artifact-events-infrastructure
              pythoneda-shared-pythonlang-domain
              pythoneda-shared-pythonlang-infrastructure
            ];

            # pythonImportsCheck = [ pythonpackage ];

            unpackPhase = ''
              command cp -r ${src}/* .
              command chmod -R +w .
              command cp ${pyprojectToml} ./pyproject.toml
            '';

            postInstall = with python.pkgs; ''
              for f in $(command find . -name '__init__.py'); do
                if [[ ! -e $out/lib/python${pythonMajorMinorVersion}/site-packages/$f ]]; then
                  command cp $f $out/lib/python${pythonMajorMinorVersion}/site-packages/$f;
                fi
              done
              command mkdir -p $out/dist $out/deps/flakes $out/deps/nixpkgs
              command cp dist/${wheelName} $out/dist
              for dep in ${pythoneda-shared-artifact-code-events} ${pythoneda-shared-artifact-code-events-infrastructure} ${pythoneda-shared-artifact-events} ${pythoneda-shared-artifact-events-infrastructure} ${pythoneda-shared-pythonlang-domain} ${pythoneda-shared-pythonlang-infrastructure}; do
                command cp -r $dep/dist/* $out/deps || true
                if [ -e $dep/deps ]; then
                  command cp -r $dep/deps/* $out/deps || true
                fi
                METADATA=$dep/lib/python${pythonMajorMinorVersion}/site-packages/*.dist-info/METADATA
                NAME="$(command grep -m 1 '^Name: ' $METADATA | command cut -d ' ' -f 2)"
                VERSION="$(command grep -m 1 '^Version: ' $METADATA | command cut -d ' ' -f 2)"
                command ln -s $dep $out/deps/flakes/$NAME-$VERSION || true
              done
              for nixpkgsDep in ${dbus-next}; do
                METADATA=$nixpkgsDep/lib/python${pythonMajorMinorVersion}/site-packages/*.dist-info/METADATA
                NAME="$(command grep -m 1 '^Name: ' $METADATA | command cut -d ' ' -f 2)"
                VERSION="$(command grep -m 1 '^Version: ' $METADATA | command cut -d ' ' -f 2)"
                command ln -s $nixpkgsDep $out/deps/nixpkgs/$NAME-$VERSION || true
              done
            '';

            meta = with pkgs.lib; {
              inherit description homepage license maintainers;
            };
          };
      in rec {
        defaultPackage = packages.default;
        devShells = rec {
          default = pythoneda-artifact-git-infrastructure-python312;
          pythoneda-artifact-git-infrastructure-python39 = shared.devShell-for {
            banner = "${
                pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python39
              }/bin/banner.sh";
            extra-namespaces = "";
            nixpkgs-release = nixpkgsRelease;
            package = packages.pythoneda-artifact-git-infrastructure-python39;
            python = pkgs.python39;
            pythoneda-shared-pythonlang-banner =
              pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python39;
            pythoneda-shared-pythonlang-domain =
              pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python39;
            inherit archRole layer org pkgs repo space;
          };
          pythoneda-artifact-git-infrastructure-python310 =
            shared.devShell-for {
              banner = "${
                  pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python310
                }/bin/banner.sh";
              extra-namespaces = "";
              nixpkgs-release = nixpkgsRelease;
              package =
                packages.pythoneda-artifact-git-infrastructure-python310;
              python = pkgs.python310;
              pythoneda-shared-pythonlang-banner =
                pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python310;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python310;
              inherit archRole layer org pkgs repo space;
            };
          pythoneda-artifact-git-infrastructure-python311 =
            shared.devShell-for {
              banner = "${
                  pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python311
                }/bin/banner.sh";
              extra-namespaces = "";
              nixpkgs-release = nixpkgsRelease;
              package =
                packages.pythoneda-artifact-git-infrastructure-python311;
              python = pkgs.python311;
              pythoneda-shared-pythonlang-banner =
                pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python311;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python311;
              inherit archRole layer org pkgs repo space;
            };
          pythoneda-artifact-git-infrastructure-python312 =
            shared.devShell-for {
              banner = "${
                  pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python312
                }/bin/banner.sh";
              extra-namespaces = "";
              nixpkgs-release = nixpkgsRelease;
              package =
                packages.pythoneda-artifact-git-infrastructure-python312;
              python = pkgs.python312;
              pythoneda-shared-pythonlang-banner =
                pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python312;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python312;
              inherit archRole layer org pkgs repo space;
            };
          pythoneda-artifact-git-infrastructure-python313 =
            shared.devShell-for {
              banner = "${
                  pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python313
                }/bin/banner.sh";
              extra-namespaces = "";
              nixpkgs-release = nixpkgsRelease;
              package =
                packages.pythoneda-artifact-git-infrastructure-python313;
              python = pkgs.python313;
              pythoneda-shared-pythonlang-banner =
                pythoneda-shared-pythonlang-banner.packages.${system}.pythoneda-shared-pythonlang-banner-python313;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python313;
              inherit archRole layer org pkgs repo space;
            };
        };
        packages = rec {
          default = pythoneda-artifact-git-infrastructure-python312;
          pythoneda-artifact-git-infrastructure-python39 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python39;
              pythoneda-shared-artifact-code-events =
                pythoneda-shared-artifact-code-events.packages.${system}.pythoneda-shared-artifact-code-events-python39;
              pythoneda-shared-artifact-code-events-infrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.packages.${system}.pythoneda-shared-artifact-code-events-infrastructure-python39;
              pythoneda-shared-artifact-events =
                pythoneda-shared-artifact-events.packages.${system}.pythoneda-shared-artifact-events-python39;
              pythoneda-shared-artifact-events-infrastructure =
                pythoneda-shared-artifact-events-infrastructure.packages.${system}.pythoneda-shared-artifact-events-infrastructure-python39;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python39;
              pythoneda-shared-pythonlang-infrastructure =
                pythoneda-shared-pythonlang-infrastructure.packages.${system}.pythoneda-shared-pythonlang-infrastructure-python39;
            };
          pythoneda-artifact-git-infrastructure-python310 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python310;
              pythoneda-shared-artifact-code-events =
                pythoneda-shared-artifact-code-events.packages.${system}.pythoneda-shared-artifact-code-events-python310;
              pythoneda-shared-artifact-code-events-infrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.packages.${system}.pythoneda-shared-artifact-code-events-infrastructure-python310;
              pythoneda-shared-artifact-events =
                pythoneda-shared-artifact-events.packages.${system}.pythoneda-shared-artifact-events-python310;
              pythoneda-shared-artifact-events-infrastructure =
                pythoneda-shared-artifact-events-infrastructure.packages.${system}.pythoneda-shared-artifact-events-infrastructure-python310;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python310;
              pythoneda-shared-pythonlang-infrastructure =
                pythoneda-shared-pythonlang-infrastructure.packages.${system}.pythoneda-shared-pythonlang-infrastructure-python310;
            };
          pythoneda-artifact-git-infrastructure-python311 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python311;
              pythoneda-shared-artifact-code-events =
                pythoneda-shared-artifact-code-events.packages.${system}.pythoneda-shared-artifact-code-events-python311;
              pythoneda-shared-artifact-code-events-infrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.packages.${system}.pythoneda-shared-artifact-code-events-infrastructure-python311;
              pythoneda-shared-artifact-events =
                pythoneda-shared-artifact-events.packages.${system}.pythoneda-shared-artifact-events-python311;
              pythoneda-shared-artifact-events-infrastructure =
                pythoneda-shared-artifact-events-infrastructure.packages.${system}.pythoneda-shared-artifact-events-infrastructure-python311;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python311;
              pythoneda-shared-pythonlang-infrastructure =
                pythoneda-shared-pythonlang-infrastructure.packages.${system}.pythoneda-shared-pythonlang-infrastructure-python311;
            };
          pythoneda-artifact-git-infrastructure-python312 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python312;
              pythoneda-shared-artifact-code-events =
                pythoneda-shared-artifact-code-events.packages.${system}.pythoneda-shared-artifact-code-events-python312;
              pythoneda-shared-artifact-code-events-infrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.packages.${system}.pythoneda-shared-artifact-code-events-infrastructure-python312;
              pythoneda-shared-artifact-events =
                pythoneda-shared-artifact-events.packages.${system}.pythoneda-shared-artifact-events-python312;
              pythoneda-shared-artifact-events-infrastructure =
                pythoneda-shared-artifact-events-infrastructure.packages.${system}.pythoneda-shared-artifact-events-infrastructure-python312;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python312;
              pythoneda-shared-pythonlang-infrastructure =
                pythoneda-shared-pythonlang-infrastructure.packages.${system}.pythoneda-shared-pythonlang-infrastructure-python312;
            };
          pythoneda-artifact-git-infrastructure-python313 =
            pythoneda-artifact-git-infrastructure-for {
              python = pkgs.python313;
              pythoneda-shared-artifact-code-events =
                pythoneda-shared-artifact-code-events.packages.${system}.pythoneda-shared-artifact-code-events-python313;
              pythoneda-shared-artifact-code-events-infrastructure =
                pythoneda-shared-artifact-code-events-infrastructure.packages.${system}.pythoneda-shared-artifact-code-events-infrastructure-python313;
              pythoneda-shared-artifact-events =
                pythoneda-shared-artifact-events.packages.${system}.pythoneda-shared-artifact-events-python313;
              pythoneda-shared-artifact-events-infrastructure =
                pythoneda-shared-artifact-events-infrastructure.packages.${system}.pythoneda-shared-artifact-events-infrastructure-python313;
              pythoneda-shared-pythonlang-domain =
                pythoneda-shared-pythonlang-domain.packages.${system}.pythoneda-shared-pythonlang-domain-python313;
              pythoneda-shared-pythonlang-infrastructure =
                pythoneda-shared-pythonlang-infrastructure.packages.${system}.pythoneda-shared-pythonlang-infrastructure-python313;
            };
        };
      });
}
