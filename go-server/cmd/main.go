package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/nchhillar2004/wecode/go-server/config"
	"github.com/nchhillar2004/wecode/go-server/routes"
)

func main(){
    text := `   ___  ___      _                
  / __|/ _ \ ___| |__ _ _ _  __ _ 
 | (_ | (_) |___| / _' | ' \/ _' |
  \___|\___/    |_\__,_|_||_\__, |
                            |___/ `

    fmt.Println(text)

    err := config.LoadConfig()
    if err != nil {
        log.Fatal(err)
    }

    mux := http.NewServeMux()
    routes.RegisterRoutes(mux)

    port := ":8000"
    fmt.Println("Golang server running on http://localhost" + port)
    log.Fatal(http.ListenAndServe(port, mux))
}
