# Desktop Entries Vs Optional Omarchy Integration

## Desktop Entries Only

The package installs three desktop entries:

- `Kali`
- `Install Kali VM`
- `Remove Kali VM`

For most users this is enough. The `Kali` launcher starts the VM directly and opens `remote-viewer` without spawning a terminal window first. Walker can discover these entries through its normal desktop application provider without any extra configuration.

## Optional Omarchy Integration

Omarchy users can run `omarchy-kali-vm-integrate-os` to add two user-owned integrations:

- An Omarchy menu extension under `~/.config/omarchy/extensions/menu.sh` that adds `Kali` entries to the Omarchy Install and Remove menus.
- A Hyprland `source = ...` block in `~/.config/hypr/hyprland.conf` that loads the packaged Kali VM window rules from `~/.config/omarchy-kali-vm/hypr/omarchy-kali-vm.conf`.

This optional integration gives the smoothest Omarchy experience:

- Hyprland window rules make the `remote-viewer` window behave correctly for the Kali session.
- Omarchy menu integration gives you direct Install and Remove entries alongside the existing system flows.

The helper is idempotent. Re-running it does not duplicate menu entries or Hyprland sources.

Run `omarchy-kali-vm-unintegrate-os` to remove only the markers and files managed by this project.
