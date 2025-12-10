# Fcitx5 configuration

{ config, pkgs, lib, ... }:

let
  themeName = "Plasma";
  themePath = ./themes/${themeName};

  # 設定すべきファイル一覧
  themeFiles = [
    "theme.conf"
    "arrow.png"
    "highlight.png"
    "line.png"
    "mask.png"
    "next.png"
    "panel.png"
    "radio.png"
  ];

  # 1ファイル用のhome.fileエントリを生成する関数
  mkFile = name: {
    name = ".local/share/fcitx5/themes/${themeName}/${name}";
    value = {
      source = "${themePath}/${name}";
      force = true;
    };
  };

  # attrset に変換（home.file が要求する形式）
  themeAttrs = builtins.listToAttrs (map mkFile themeFiles);

in
{
  home.file = themeAttrs;
}
