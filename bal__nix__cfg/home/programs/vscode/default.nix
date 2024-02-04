{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs; # biar stable, gak rumit link-link binary gitu
  };
}
