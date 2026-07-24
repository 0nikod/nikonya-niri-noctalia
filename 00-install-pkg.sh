#!/bin/bash

PKGFILE="${1:-pkglist}"

if [[ ! -f "$PKGFILE" ]]; then
    echo "错误：文件 '$PKGFILE' 不存在。" >&2
    exit 1
fi

mapfile -t packages < <(grep -vE '^\s*#' "$PKGFILE" | grep -vE '^\s*$')

if [[ ${#packages[@]} -eq 0 ]]; then
    echo "没有需要安装的包。"
    exit 0
fi

echo "将安装以下软件包："
printf "  %s\n" "${packages[@]}"

# 使用 sudo 执行安装（如果已是 root 则直接运行）
if [[ $EUID -ne 0 ]]; then
    echo "使用 sudo 执行 pacman..."
    sudo pacman -S --needed "${packages[@]}"
else
    pacman -S --needed "${packages[@]}"
fi
