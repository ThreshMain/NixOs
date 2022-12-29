{ pkgs, config, ... }:

{
  programs.firejail.enable = true;
  security.apparmor.enable = true;

  imports = [ ./ranger.nix ];

  environment.systemPackages = with pkgs; [
    # Wire guard VPN
    wireguard-tools

    # pee sponge vipe etc..
    moreutils

    # Compression statistics
    compsize

    # Commands
    delta # diff
    cloc # line counter
    pv # pipe monitor
    tmux # term multiplexor
    tealdeer
    tree
    most
    sshfs
    openssh
    openssl
    gnumake
    nmap
    traceroute
    gcc
    glibc
    patchelf
    killall
    thefuck
    nix-diff
    nix-index
    nix-direnv
    nix-output-monitor
    pciutils
    unzip
    zip
    unrar-wrapper
    direnv
    ripgrep
    jq
    bc
    mat2 # meta data stripper
    onionshare

    # Utilities
    coreutils
    netcat-gnu
    usbutils
    dhcp

    # man page
    man
    man-pages

    # multimedia manipulation
    ffmpeg
    imagemagick

    # Utilities
    mitmproxy # https proxy
    wget
    curl
    git
    gh # github tui
    stable.cmake
    gnupg
    lsof
    whois
    dnsutils
    file
    fd
    config.boot.kernelPackages.perf
    perf-tools
    bintools-unwrapped # gcc-unwrapped
    gdb
    radare2

    # Java
    jdk
    jdk8
    jdk11
    jprofiler
    visualvm

    # Languages
    php
    nodejs
    nodePackages.npm
    yarn

    # C# mrkda jazyk
    dotnet-sdk
    mono
    msbuild

    # Python
    python27Full

    (python3.withPackages
      (e: [ e.matplotlib e.pygments e.numpy e.tkinter e.pandas ]))

    # RUST
    cargo
    rustc
    pkg-config
    dbus

    # C++ intepreter
    cling

    # Clang
    clang_14
    lldb_14
    libclang
    clang_multi
    clang-tools_14
    clang-manpages
    clang-analyzer

  ];

  # man pages
  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

}
