package main

import "fmt"

/*
	Comment
*/

func printSource() {
	str := `package main

import "fmt"

/*
	Comment
*/

func printSource() {
	str := %c%s%c
	fmt.Printf(str, 96, str, 96)
}

func main() {
	/*
		Comment
	*/
	printSource()
}
`
	fmt.Printf(str, 96, str, 96)
}

func main() {
	/*
		Comment
	*/
	printSource()
}
