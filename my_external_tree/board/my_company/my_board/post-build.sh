#!/bin/sh

set -e

BOARD_DIR=$(dirname "$0")

# Detect boot strategy BIOS
    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
    # Copy grub 1st stage to binaries, required for genimage
    cp -f "$TARGET_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"

# sed -i -e '1 s/^/set default="0"\nset timeout="0"\n\n/;' "$TARGET_DIR/boot/grub/grub.cfg"

# if I set BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC="/mnt/ramdisk/my_external_tree/board/my_company/my_board/grub-bios.cfg"
# in
# pc_x86_bios_defconfig
# I get error while loading grub2:
# no menuentry definition.
