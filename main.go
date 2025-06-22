package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/hello", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello, World!",
		})
	})
	r.GET("/hello/:name", func(c *gin.Context) {
		name := c.Param("name")
		c.JSON(200, gin.H{
			"message": "Hello " + name,
		})
	})
	r.GET("/hello/:name/:age", func(c *gin.Context) {
		name := c.Param("name")
		age := c.Param("age")
		c.JSON(200, gin.H{
			"message": "Hello " + name + ", you are " + age + " years old",
		})
	})
	fmt.Println("Server is running on port 5000")
	// Run the server on port 5000
	err := r.Run(":5000")
	if err != nil {
		fmt.Println("Error starting server:", err)
		return
	}
}
