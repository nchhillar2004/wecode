package db

import (
	"database/sql"
	"fmt"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
)

func DBConnect() error {
    err := godotenv.Load()
    if err != nil {
        fmt.Printf("Error loading .env: %v\n", err)
    }

    user := os.Getenv("DATABASE_USER")
    password := os.Getenv("DATABASE_PASSWORD")
    const database = "wecode_db"
    const host = "@tcp(127.0.0.1:3306)/"
    dataSourceName := user + ":" + password + host + database
    db, err := sql.Open("mysql", dataSourceName)
    if err != nil {
        fmt.Printf("Error connecting to database: %v\n", err)
        return err
    }
    defer db.Close()

    fmt.Println("MySQL Database connected.")
    return nil
}
