{ config, pkgs, ... }:

{
  home.file.code-settings = {
    source = ./code/settings.json;
    target = ".vscode-server/data/Machine/settings.json";
  };
}
