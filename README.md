# KiCad Environment using Docker

Docker を用いた KiCad 環境。  
複数の KiCad バージョンが共存できるようになる。

## 動作環境

- X11-Window System をもつ Linux 環境
- Docker がインストールされていること

## 環境構築

使用するバージョンを選択する

```sh
## Build KiCad 4
./build_kicad-4.sh

## Build KiCad 5
./build_kicad-5.sh
```

sudo なしで docker を実行できるようにする

```sh
sudo gpasswd -a $USER docker
# 一度ログアウトしてログインし直すと反映される
```

## 実行

プロジェクトディレクトリに移動してスクリプトを実行

```sh
## Navigate To KiCad Project
cd xxx

## Open KiCad 4 or 5 Project
./path/to/run_kicad-4.sh xxx.pro
```

なお、新規プロジェクトを作成する場合は引数なしで実行する。

## エイリアス

.bashrc や .zshrc に以下のエイリアスを設定しておくと単に `kicad4` などで実行できるようになる

```sh
## KiCad Env using Docker
## build: https://github.com/kerikun11/kicad-docker-env
alias kicad4='docker run --rm --interactive --tty \
    --network host \
    --volume $(pwd):/workspace \
    --workdir /workspace \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --env DISPLAY \
    --volume $HOME/.Xauthority:$HOME/.Xauthority:ro \
    --group-add video \
    --tmpfs $HOME \
    kicad:4 \
    kicad "$@"'
alias kicad5='docker run --rm --interactive --tty \
    --network host \
    --volume $(pwd):/workspace \
    --workdir /workspace \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --env DISPLAY \
    --volume $HOME/.Xauthority:$HOME/.Xauthority:ro \
    --group-add video \
    --tmpfs $HOME \
    kicad:5 \
    kicad "$@"'
```

## 注意

グローバルライブラリなどは使用せず、プロジェクト固有のライブラリを使用すること
（実行ごとにリセットされてしまうため）
