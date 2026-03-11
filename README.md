# omarchy-kali-vm

Provides an accessible "click-to-install" Kali Linux VM using a dockerized QEMU environment to minimize dependencies. Can integrate into walker menus alongside Omarchy's default Windows VM.

## Summary
Adds first-class Kali VM support to Omarchy via `omarchy-kali-vm`. Uses [`qemux/qemu`](https://github.com/qemus/qemu), a containerized QEMU environment, to minimize dependencies. The only external dependency required is `virt-viewer` for the SPICE display. Clipboard integration and desktop resizing are available out of the box.

The implementation intentionally follows the Windows VM design pattern, but adapts it for Kali’s prebuilt QEMU images.

Includes:
- VM installation and lifecycle script.
- Menu entry points for install/remove.
- Hyprland window rules so the SPICE viewer behaves like a native Omarchy app.

Control flow is straightforward:
1. The user selects Kali from the install menu, which runs `omarchy-kali-vm install`.
2. The script gathers VM resources and guest credentials from the user, writes the Kali compose config, and prepares local storage under `~/.kali`.
3. It downloads the latest weekly Kali QEMU archive, verifies it cryptographically, extracts the QCOW2, and patches the image offline with the configured user/session changes. If something goes wrong with the weekly image, the script falls back to the latest current/stable Kali QEMU archive.
4. It starts the VM through the `qemux/qemu` container, waits for the SPICE socket, and opens `remote-viewer`.
5. Later launches reuse the same compose/storage setup and just start the VM and connect over SPICE.
6. Removal is exposed through the remove menu and tears down the Kali VM state from the same entrypoint.

While patching the QCOW2 image, SPICE agent support is wired in so resize events propagate properly. XFCE was given a small autoresize helper that polls `xrandr`, applies the preferred mode when the display changes, and restarts the user-session `spice-vdagent` if needed. That extra guest-side step was necessary because XFCE was not reliably applying the new SPICE-provided resolution on its own, which in turn caused mouse alignment to break after resizes.

### Context
I had spent weeks convincing a security friend of mine to try out omarchy. And I did it: they went through the whole install and were *so* excited for the new system. But ultimately they decided to swap back to a "Spyware Microslop GUI-fest" (their words) because of bugs experienced and tinkering required getting a Kali VM working on Hyprland. Accessible Kali is an absolute must for them. This one's for you, Criz.


## Scope
The package does not edit `~/.local/share/omarchy` and does not clean up user dotfiles automatically on install or uninstall.

- Base package: launcher command, desktop entries, icon, packaged Hyprland and Omarchy menu snippets, and documentation.
- User runtime data: `~/.config/kali`, `~/.kali`, and `~/Kali`.
- Optional Omarchy integration: user-run helpers that add or remove Omarchy menu and Hyprland sourcing under `~/.config`.


## Package Name And Release Strategy

- Package name: `omarchy-kali-vm`
- Upstream release model: normal tagged releases from the standalone upstream repository
- Initial AUR target: `v0.1.0`
- Omarchy dependency model: `omarchy` remains optional. Desktop entries work without Omarchy; Omarchy-specific menu and Hyprland integration is opt-in.

## Commands

- `omarchy-kali-vm install`
- `omarchy-kali-vm launch`
- `omarchy-kali-vm stop`
- `omarchy-kali-vm status`
- `omarchy-kali-vm remove`
- `omarchy-kali-vm-integrate-os`
- `omarchy-kali-vm-unintegrate-os`

For Omarchy users, `omarchy-kali-vm-integrate-os` enables the packaged Hyprland window rules for a smoother `remote-viewer` experience and adds fuller Omarchy menu integration for install and removal flows.

## Cleanup Boundaries

- Remove Kali VM data: `omarchy-kali-vm remove`
- Remove optional Omarchy integration: `omarchy-kali-vm-unintegrate-os`
- Remove the package: `yay -R omarchy-kali-vm`

Additional details live in [docs/cleanup.md](/home/t/repos/omarchy-kali-vm/docs/cleanup.md) and [docs/integration.md](/home/t/repos/omarchy-kali-vm/docs/integration.md).
