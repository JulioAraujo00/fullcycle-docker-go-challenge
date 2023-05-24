package main

import (
	"fmt"
	"net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprint(w, "FullCycle Rock's!")
    })

    panic(http.ListenAndServe(":8080", nil))
}