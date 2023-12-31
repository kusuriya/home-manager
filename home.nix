{ config, pkgs, inputs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "kusuriya";
  home.homeDirectory = "/home/kusuriya";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    neovim
    obsidian
    parsec-bin
    kate
    fortune
    htop
    vivaldi
    unzip
    unrar
    p7zip
    gnupg
    wget
    curl
    netcat
    rclone
    rsync
    slack
    zoom-us
    youtube-dl
    plantuml
    mosh
    nix-prefetch-git
    jq
    inkscape
    cider
    libreoffice
    coreutils
    wl-clipboard
    fluffychat
    element-desktop
    discord
    signal-desktop
    appimage-run
    gparted
    helvum
    transmission-qt
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
    vscode
    distrobox
    kicad
    weechat
    mpv
    thunderbird
    virt-manager
    virt-viewer
    intel-gpu-tools
    yt-dlp
  ];
  services = {
    syncthing = {
      enable = true;
    };
    ssh-agent.enable = true;
    kdeconnect.enable = true;
    emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
    };
  };
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_USE_XINPUT2 = "1";
    XCURSOR_SIZE = "64";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
  };

  programs = {
    thefuck.enable = true;
    home-manager.enable = true;
    emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      extraConfig = ''
      (setq standard-indent 2)
      '';
      };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      history = {
        size = 10000;
        path = ".config/zsh/history";
	expireDuplicatesFirst = true;
	ignoreAllDups = true;
      };
      enableAutosuggestions = true;
      enableCompletion = true;
      enableVteIntegration = true;
      autocd = true;
      dotDir = ".config/zsh";
      shellAliases = {
        vi = "nvim";
	vim = "nvim";
	ll = "ls -c -l";
	ls = "ls -c";
	update = "sudo nixos-rebuild switch";
      };
      oh-my-zsh = {
        enable = true;
	plugins = [
	  "git"
	];
        theme = "gentoo";
      };
    };
    git = {
      enable = true;
      userName = "Jason Barbier";
      userEmail = "jason@corrupted.io";
    };
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
  };
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
  home.pointerCursor = {
    size = 64;
    name = "vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    x11.enable = true;
  };

}
