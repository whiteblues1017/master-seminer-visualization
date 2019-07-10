# master-seminer-visualization

## Directory Hierarchy
```aidl
master-seminer-visualization
├── Makefile
├── README.md
├── dataset
├── dockerfiles
│   └── Dockerfile
├── hierarchy.py
├── notebooks
├── requirements
│   ├── base.txt
│   └── jupyter.txt
└── src

```
## Docker Install
1. 以下のサイトよりDockerアカウントを作成後、インストールする
   - [https://hub.docker.com/editions/community/docker-ce-desktop-mac]()
2. ターミナルで以下のコマンドを打つとversionが表示されます
```aidl
$ docker --version
Docker version 18.09, build c97c6d6
```

参考：[https://qiita.com/kurkuru/items/127fa99ef5b2f0288b81]()

## Setup
1. Build Docker Image
2. Run jupyterlab on Docker

### 1. Build Docker Image
```bash
# jupyter 用
$ make build-jupyter
```

### 2. Run jupyterlab on Docker
```bash
$ make run-jupyter
```
※ 実行後に表示されるtokenを http://127.0.0.1:8880/ アクセス時に入力

## 7/10以前に準備をしてくれた方へ
./master-seminer-visualization 下で以下のコマンドを打ってください
```aidl
$ git pull origin master
```