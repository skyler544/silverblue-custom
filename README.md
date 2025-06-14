# silverblue-custom

This is a custom Fedora Silverblue image based on [Bluefin-DX](https://projectbluefin.io/) with personalized modifications. It removes unnecessary components and adds development-focused tools while maintaining the Universal Blue foundation.

## Customizations

### Removed Packages
- **Bluefin branding**: plymouth themes, backgrounds, CLI logos, faces
- **Cockpit components**: Full web-based system management interface
- **GNOME extensions**: AppIndicator, Blur My Shell, Dash to Dock, GSConnect, Logo Menu, Tailscale Quick Settings
- **Yaru theme**: Complete Ubuntu-style theme package
- **Other**: GNOME Tour, Tailscale VPN, default emoji fonts

### Added Packages
- **Emacs**: Full-featured text editor and development environment
- **Development tools**:
  - `stow` - Symlink farm manager for dotfiles
  - `wl-clipboard` - Wayland clipboard utilities
- **Document viewing**:
  - `zathura` - Minimalist document viewer
  - `zathura-pdf-mupdf` - PDF support for Zathura
- **Typography**:
  - `google-noto-emoji-fonts` - Emoji font support
  - `terminus-fonts-console` - Console fonts
- **Theming**: Papirus icon theme (regular, dark, and light variants)

### Custom Tools
- **`mg` command**: A lightweight Emacs wrapper that launches Emacs in terminal mode with:
  - Minimal configuration (no init files)
  - Modus themes (vivendi for dark terminals, operandi for light)
  - Sensible defaults for quick editing
  - No backup files or lock files

## Container Signing

This container image is cryptographically signed for security and authenticity verification. You can verify the signature using cosign.

## Upstream Documentation

- **Base Image**: [Bluefin-DX Documentation](https://docs.projectbluefin.io/)
- **Universal Blue Project**: [Universal Blue Documentation](https://universal-blue.org/)
- **Original Template**: [image-template repository](https://github.com/ublue-os/image-template)
- **bootc**: [bootc documentation](https://containers.github.io/bootc/)
- **Fedora Silverblue**: [Fedora Silverblue documentation](https://docs.fedoraproject.org/en-US/fedora-silverblue/)
