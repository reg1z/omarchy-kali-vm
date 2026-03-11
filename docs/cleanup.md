# Cleanup Boundaries

The project keeps package ownership, VM runtime data, and Omarchy-specific user integration separate on purpose.

## Package Removal

Removing the package only removes package-owned files installed by pacman:

- launcher binaries in `/usr/bin`
- desktop entries in `/usr/share/applications`
- icon assets in `/usr/share/icons`
- packaged snippets and docs in `/usr/share/omarchy-kali-vm`

Package removal does not remove `~/.config/kali`, `~/.kali`, `~/Kali`, or any optional Omarchy integration markers under `~/.config`.

## VM Data Removal

Run `omarchy-kali-vm remove` when you want to delete the Kali VM runtime data created for your user. This removes:

- `~/.config/kali`
- `~/.kali`
- `~/Kali`

It does not uninstall the package and does not remove Omarchy integration markers.

## Omarchy Integration Removal

Run `omarchy-kali-vm-unintegrate-os` when you want to remove Omarchy menu and Hyprland integration that was previously added by this project. The helper removes only its own marked blocks and its own copied snippets under `~/.config/omarchy-kali-vm`.
