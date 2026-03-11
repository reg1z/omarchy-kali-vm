#!/bin/bash

show_install_menu() {
  case $(menu "Install" "󰣇  Package\n󰣇  AUR\n  Web App\n  TUI\n  Service\n  Style\n󰵮  Development\n  Editor\n  Terminal\n󱚤  AI\n  Kali\n󰍲  Windows\n  Gaming") in
  *Package*) terminal omarchy-pkg-install ;;
  *AUR*) terminal omarchy-pkg-aur-install ;;
  *Web*) present_terminal omarchy-webapp-install ;;
  *TUI*) present_terminal omarchy-tui-install ;;
  *Service*) show_install_service_menu ;;
  *Style*) show_install_style_menu ;;
  *Development*) show_install_development_menu ;;
  *Editor*) show_install_editor_menu ;;
  *Terminal*) show_install_terminal_menu ;;
  *AI*) show_install_ai_menu ;;
  *Kali*) present_terminal "omarchy-kali-vm install" ;;
  *Windows*) present_terminal "omarchy-windows-vm install" ;;
  *Gaming*) show_install_gaming_menu ;;
  *) show_main_menu ;;
  esac
}

show_remove_menu() {
  case $(menu "Remove" "󰣇  Package\n  Web App\n  TUI\n󰵮  Development\n󰏓  Preinstalls\n  Dictation\n󰸌  Theme\n  Kali\n󰍲  Windows\n󰈷  Fingerprint\n  Fido2") in
  *Package*) terminal omarchy-pkg-remove ;;
  *Web*) present_terminal omarchy-webapp-remove ;;
  *TUI*) present_terminal omarchy-tui-remove ;;
  *Development*) show_remove_development_menu ;;
  *Preinstalls*) present_terminal omarchy-remove-preinstalls ;;
  *Dictation*) present_terminal omarchy-voxtype-remove ;;
  *Theme*) present_terminal omarchy-theme-remove ;;
  *Kali*) present_terminal "omarchy-kali-vm remove" ;;
  *Windows*) present_terminal "omarchy-windows-vm remove" ;;
  *Fingerprint*) present_terminal "omarchy-setup-fingerprint --remove" ;;
  *Fido2*) present_terminal "omarchy-setup-fido2 --remove" ;;
  *) show_main_menu ;;
  esac
}
