!include /usr/share/ublue-os/just/bling.just

# Install all flatpaks defined in recipe.yml
setup-flatpaks:
  #!/usr/bin/env bash
  echo 'Installing flatpaks from the ublue recipe ...'
  flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
  for pkg in $flatpaks; do \
      echo "Installing: ${pkg}" && \
      flatpak install --user --noninteractive flathub $pkg; \
  done

# Include some of your custom scripts here!
setup-cachyos:
  #!/usr/bin/env bash
  echo 'Installing cachyos kernel ...'
  rpm-ostree override remove kernel-devel-matched kernel-devel kernel-headers kernel --install kernel-cachyos-bore
  rpm-ostree install uksmd
