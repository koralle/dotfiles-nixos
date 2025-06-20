# CLAUDE.md

このファイルは、このリポジトリでコードを扱う際にClaude Code (claude.ai/code) にガイダンスを提供します。

## よく使うコマンド

### システム管理
- `just switch` - NixOS設定変更を適用（`sudo nixos-rebuild switch --flake .#koralle`と同等）
- `just tailscale-up` - エグジットノード広告でTailscaleを開始
- `nix fmt` - nixfmt-rfc-styleを使用してNixファイルをフォーマット

### 開発
- `nix develop` - 開発シェルに入る（shell.nixが存在する場合）
- `nix flake check` - flake設定を検証
- `nix flake update` - flake inputsを更新

## アーキテクチャ概要

これは、FlakesとHome Managerを使用して宣言的なシステムとユーザー環境管理を行うNixOS dotfilesリポジトリです。

### 主要コンポーネント

**Flake構造 (`flake.nix`)**:
- nixpkgs-unstable、home-manager、NUR、neovim-nightly-overlayを使用
- "koralle"ホスト用のnixosConfigurationを定義
- Home ManagerをNixOSモジュールとして統合

**システム設定 (`hosts/desktop/`)**:
- `configuration.nix` - メインNixOSシステム設定
- `hardware-configuration.nix` - ハードウェア固有設定（自動生成）

**ユーザー設定 (`users/koralle/`)**:
- `home.nix` - ユーザーパッケージと設定のHome Manager設定
- `.config/` - アプリケーション固有の設定ファイル（dotfiles）

### 設定パターン

**システムレベル** (`hosts/desktop/configuration.nix`):
- 日本語ロケール（Asia/Tokyoタイムゾーン、ja_JP.UTF-8）
- GNOME デスクトップとGDM（Wayland有効）
- 日本語入力用のFcitx5 + Mozc
- NVIDIAドライバーサポート
- エグジットノード機能付きTailscale VPN
- Fail2banセキュリティ付きSSH

**ユーザーレベル** (`users/koralle/home.nix`):
- モダンなCLIツール（ripgrep、bat、fd、eza、zoxide）
- ターミナル環境（wezterm、ghostty、zellij）
- 開発ツール（ランタイム管理用mise、starshipプロンプト）
- nightly overlayを使用したNeovim

**Neovim設定** (`users/koralle/.config/nvim/`):
- lazy.nvim経由のプラグイン管理（`lua/configs/lazy.lua`）
- ファジーファインダー用ddu.vim（`lua/plugins/ddu/`）
- 補完用ddc.vim（`lua/plugins/ddc/`）
- `after/lsp/`と`ftplugin/`のLSP設定
- ファイルタイプ別の言語固有設定

### 開発ワークフロー

変更を加える場合:
1. 関連する`.nix`ファイルを編集
2. `just switch`を実行して変更を適用
3. システム変更にはsudoが必要で、システム全体に影響
4. Home Manager変更はユーザー環境のみに影響

この設定は、モダンなツールと宣言的システム管理を備えた日本人開発者環境向けに設計されています。