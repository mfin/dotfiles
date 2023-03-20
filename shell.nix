{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "dev";
  nativeBuildInputs = with pkgs; [
    git
    nixFlakes
    home-manager
    go-task
  ];
}
