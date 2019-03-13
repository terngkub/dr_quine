package main

import (
	"fmt"
	"io/ioutil"
	"os/exec"
	"runtime"
	"strconv"
	"strings"
)

func main() {
	i := 5
	if i <= 0 {
		return
	}
	_, path, _, _ := runtime.Caller(0)
	split := strings.Split(path, "/")
	sully := split[len(split)-1]
	if sully != "Sully.go" {
		i--
	}
	filename := "Sully_" + strconv.Itoa(i) + ".go"
	str := `package main

import (
	"fmt"
	"io/ioutil"
	"os/exec"
	"runtime"
	"strconv"
	"strings"
)

func main() {
	i := %d
	if i <= 0 {
		return
	}
	_, path, _, _ := runtime.Caller(0)
	split := strings.Split(path, "/")
	sully := split[len(split)-1]
	if sully != "Sully.go" {
		i--
	}
	filename := "Sully_" + strconv.Itoa(i) + ".go"
	str := %c%s%c
	data := fmt.Sprintf(str, i, 96, str, 96)
	ioutil.WriteFile(filename, []byte(data), 0644)
	exec.Command("go", "build", filename).Run()
	exec.Command("./Sully_" + strconv.Itoa(i)).Run()
}
`
	data := fmt.Sprintf(str, i, 96, str, 96)
	ioutil.WriteFile(filename, []byte(data), 0644)
	exec.Command("go", "build", filename).Run()
	exec.Command("./Sully_" + strconv.Itoa(i)).Run()
}
