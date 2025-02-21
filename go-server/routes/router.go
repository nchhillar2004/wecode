package routes

import (
	"net/http"

	"github.com/nchhillar2004/wecode/go-server/internal/handlers"
)

func RegisterRoutes(mux *http.ServeMux) {
    mux.HandleFunc("/health", handlers.HealthHandler)
}
