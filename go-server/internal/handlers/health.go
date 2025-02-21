package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/nchhillar2004/wecode/go-server/config"
	"github.com/nchhillar2004/wecode/go-server/internal/db"
)

type HealthResponse struct {
    GolangAPI string `json:"golang_api"`
    JavaAPI   string `json:"java_api"`
    Database  string `json:"database"`
    Overall   string `json:"overall"`
}

func checkJavaAPI() bool {
    url := config.AppConfig.JavaAPIURL
    client := http.Client{Timeout: 2 * time.Second}
    res, err := client.Get(url)
    if err != nil || res.StatusCode != http.StatusOK {
        fmt.Println("Java API is NOT running")
        return false
    }

    fmt.Println("Java API is running")
    return true
}

func checkGolangAPI() bool {
    return true
}

func HealthHandler(w http.ResponseWriter, r *http.Request){
    goStatus := checkGolangAPI()
    javaStatus := checkJavaAPI()
    databaseStatus := db.DBConnect() == nil

    health := HealthResponse{
        GolangAPI: getStatusText(goStatus),
        JavaAPI: getStatusText(javaStatus),
        Database: getStatusText(databaseStatus),
        Overall: getOverallStatus(goStatus, javaStatus, databaseStatus),
    }

    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusOK)
    json.NewEncoder(w).Encode(health)
}

func getStatusText(status bool) string {
    if status {
        return "Running"
    }else {
        return "Down"
    }
}

func getOverallStatus(goAPI, javaAPI, db bool) string {
    if goAPI && javaAPI && db {
        return "All systems are running"
    }
    return "Issues detected"
}
