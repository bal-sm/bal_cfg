{ pkgs, ... }:

{
  programs.vscode = {
    # <https://nixos.wiki/wiki/Visual_Studio_Code>
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ ]);
    # package = pkgs.vscode.fhsWithPackages (ps: with ps; [ python312 poetry ruff pre-commit ]);
    # pake fhs: biar stable, gak rumit link-link binary gitu
  };
}
