# Welcome to WeCode

For source code visit [github.com/nchhillar2004/wecode](https://github.com/nchhillar2004/wecode).

## Use this project

* `git clone https://github.com/nchhillar2004/wecode.git` - Clone the repository from GitHub
* `cd wecode` - Open the project
  - `cd app && npm i` - Install dependencies
* `chmod +x run.sh` - Make the script executable (run this in root dir)
* `./run.sh` - Run the project

## Project layout
    app/              # Preact frontend
        node_modules  
        public
        src           # frontend source code
    config/           # global config files
    core/             # Java spring boot backend (core)
        src           # backend source code
        target
    docs/             # docs using mkdocs
        docs
    go-server/        # golang server for performance critical tasks
        cmd           # main.go entry point for go-server
        internal      # business logic
        go.sum        # manage go dependencies

For more information view specific docs:
 [app](/app),
 [core](/core),
 [go-server](/go-server),
