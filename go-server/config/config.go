package config

import (
	"encoding/json"
	"fmt"
	"os"
)

type Config struct {
    AppName    string `json:"name"`
    JavaAPIURL string `json:"java_api_url"`
}

var AppConfig Config

func LoadConfig() error {
    file, err := os.Open("config.json")
    if err != nil {
        return fmt.Errorf("Error loading config.json: %v", err)
    }
    defer file.Close()

    decoder := json.NewDecoder(file)
    err = decoder.Decode(&AppConfig)
    if err != nil {
        return fmt.Errorf("Failed to parse config.json: %v", err)
    }

    fmt.Println("Config loaded successfully")
    return nil
}
