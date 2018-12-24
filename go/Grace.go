package main

import (
	"fmt"
	"io/ioutil"
)

func main() {
	str := `package main

import (
	"fmt"
	"io/ioutil"
)

func main() {
	str := %c%s%c
	data := fmt.Sprintf(str, 96, str, 96)
	ioutil.WriteFile("Grace_kid.go", []byte(data), 0644)
}
`
	data := fmt.Sprintf(str, 96, str, 96)
	ioutil.WriteFile("Grace_kid.go", []byte(data), 0644)
}
