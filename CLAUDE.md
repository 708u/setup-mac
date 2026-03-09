# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS環境セットアップ用のAnsible playbookリポジトリ。`playbook.yml`がエントリポイントで、localhost(127.0.0.1)に対してローカル接続で実行される。

## Commands

```bash
make init      # Homebrew・Ansible・Galaxy rolesのインストール
make deploy    # 全設定のデプロイ（sudoパスワード要求あり）
```

特定のroleだけ実行する場合はタグを使う:
```bash
ansible-playbook playbook.yml --tags homebrew
ansible-playbook playbook.yml --tags font
```

## Architecture

- `playbook.yml` — メインplaybook。dotfiles用の変数定義とroleの実行順序を管理
- `requirements.yml` — Galaxy dependency (`geerlingguy.dotfiles`)
- `roles/` — 各設定カテゴリごとのAnsible role:
  - `dotfiles` — Homebrew zshへのシェル変更、karabiner設定のコピー
  - `font` — Fira Code、HackGen Nerd、源真ゴシックのインストール
  - `homebrew` — サードパーティtapの登録(`homebrew_tap`)とCLIツール一括インストール（タグ: `homebrew`）
  - `homebrew_cask` — GUIアプリ一括インストール
  - `mac_app_store` — Mac App Store経由のアプリインストール（`mas`使用）
  - `mac_os` — macOSシステム設定（`osx_defaults`でDock、Finder、トラックパッド等を設定）

## Conventions

- パッケージの追加・削除は対応するroleの`tasks/main.yml`のリストを編集する
- サードパーティtapのパッケージを追加する場合は、`homebrew/tasks/main.yml`のtapリストにも追加が必要
- Apple Silicon (arm64) 前提: Homebrewパスは`/opt/homebrew/bin/`
- dotfilesは別リポジトリ(`708u/dotfiles`)で管理され、`geerlingguy.dotfiles` roleでシンボリンクされる
