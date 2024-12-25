# Hello 👋, Welcome to my NIXOS repo ❄️ ~
### This is a NixOS guide written by a newbie for a newbie

## 🔰 Contents in this repo consists 🔰
- configuration.nix ❄️
- neovim config 📝
- kitty config 😺 
- fish config 🐠 


## Configuration.nix
the configuration is written by me totally.
#### Changes it does ~
- It sets your *Default Shell*

from **bash -> fish**

- Desktop Environment is *KDE Plasma* & it's kind of bloatfree with *thunar* as the file manager 🗄️ (because it's the best)
- enables neovim systemwide
- gives you the latest kernel available
- fonts included
- TUI applications which are usually neccessary
- apps are categorized ✅
- applications curated for a Data Scientist using python and jupyter notebook 🐍


## Neovim 📝
This is a lazyvim config but I added changes in the colorscheme sections
#### colorscheme.lua
the file colorscheme.lua is inside ~/.config/nvim/lua/plugins/colorscheme.lua


*Included Colors* ~
- Dracula 🟣
- Gruvbox 🟡

 You just need to set the colorscheme *name* and restart neovim

**example:**
 here's the colorcheme.lua
 return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },
  
  -- add Gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

 ☝️ **colorscheme = "place_your_colorscheme_name"**

 few more options so that you don't need to dig the internet ~~
 - Everforest: "neanias/everforest-nvim"
 - Kanagawa: "rebelot/kanagawa.nvim"
 
 #### *Important*
 **You need the "gcc_multi" package for LazyVim to work properly (nvim.treesetter)

## Fish 🐠 
My fish config is very much vanila! just starship as the prompt and few aliases
**Important Aliases**
- ls = this will give better ls results with icons and colors (hidden files are also visible, if you don't want hidden files then remove '-a' flag from the alias)
- n = open neovim
- config = opens the configuration nix of **your NixOS** /etc/nixos/configuration.nix
- rebuild = alias for sudo nixos-rebuild switch
•• Starship ••
- for **Minimal Prompt** run ``starship preset nerd-font-symbols -o ~/.config/starship.toml``
- for **Gruvbox Prompt** run ``starship preset gruvbox-rainbow -o ~/.config/starship.toml``


**Ignore my Obsidian**


# Now if you want to recreate!!
#### Remember I am not using flakes so it is going to be a little bit manual

1. First read the configuration.nix and compare it with yours and add only what you like
2. If you chose to go with my fish config then use rebuild to apply it
3. **!! DO NOT COPY MY configuration.nix BLINDLY !!**
4. If you are using bash then use
`` sudo nixos-rebuild switch ``
5. move the folders fish, nvim, kitty -> ~/.config
6. my personal obsidian folder goes into ~/Documents
7. GTK themes can be installed from https://search.nixos.org/packages
*but I tried it, it is kind of bloated, use gnome-look.org to download GTK themes and icons*
place the files in ~/.local/share/icons and ~/.local/share/themes

8. As it is kde plasma you can also download those from the settings itself.


### That's it, if you want to know more or face issues open an issue.
