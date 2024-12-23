#---------------------------------------------#
# 	NIBIR'S NIX OS CONFIGURATION          #
#---------------------------------------------#


{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Kernel = Latest
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Bluetooth :(
  hardware = {
  	bluetooth = {
	    enable = true;
	    powerOnBoot = true;
	    settings = {
		    General = {
		      Enable = "Source,Sink,Media,Socket";
		      Experimental = true;
		    };
      };
    };
  };

  services.blueman.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  

  
  # Cachix, Optimization settings and garbage collection automation
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      };
  gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Virtualization / Containers
  virtualisation.libvirtd.enable = false;
  virtualisation.podman = {
    enable = false;
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = false;
  };

  # OpenGL
  hardware.graphics = {
    enable = true;
  };


  # For Electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nibir = {
    isNormalUser = true;
    description = "Nibir Biswas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.kdeconnect-kde
      kdePackages.qtstyleplugin-kvantum
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install Neovim
  programs.neovim.enable = true;

  # Install Fish Shell
  programs.fish.enable = true;

  # Make Fish Default
  programs.bash = {
  interactiveShellInit = ''
	  if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
          then
            shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
            exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
   	 fi
       '';
    };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	#--TUI--#
	git
	curl
	wget
	eza
	zoxide
	nitch
	fastfetch
	unzip
	nix-search-cli
	pipx
	python312Packages.argcomplete
	python312Packages.pip
	python312Packages.jupyterlab-widgets
	python312Packages.jupyter-console
	python312Packages.jupyterlab-server
	python312Packages.jupyterlab-execute-time
	python312Packages.jupyter-collaboration
	python312Packages.jupyter-docprovider
	python312Packages.jupyter-collaboration-ui
	python312Packages.jupyterlab-lsp
	python312Packages.jupyterlab-git
	python312Packages.notebook-shim
	python312Packages.jupyter-core
	vscode-extensions.ms-toolsai.jupyter
	python312Full
	fzf
	libgcc
	gcc_multi
	yazi
	ncmpcpp
	starship
	spicetify-cli
	bottom
	jq
	wl-clipboard

	#--APPS--#
	libreoffice-qt6-fresh
	obsidian
	brave
	vesktop
	qbittorrent
	vlc
	mpv
	vscode
	kitty
	gimp-with-plugins
	kdePackages.kdenlive
	obs-studio
	xfce.thunar
	xfce.thunar-volman
	xfce.thunar-archive-plugin
	xfce.thunar-media-tags-plugin

	#--FONTS--#
	nerd-fonts.caskaydia-cove
	nerd-fonts.jetbrains-mono
	nerd-fonts.fira-mono
	nerd-fonts.caskaydia-mono

	#--OTHERS--#
	dwt1-shell-color-scripts
	qogir-kde
	bibata-cursors
	dracula-theme
	python312Packages.catppuccin
	pywal
	python312Packages.pywal
	kde-gruvbox
	tokyonight-gtk-theme
	lightly-qt
	themechanger
	ayu-theme-gtk
	kvmarwaita
	catppuccin-kvantum
	gruvbox-kvantum
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
