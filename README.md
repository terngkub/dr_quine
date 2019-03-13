# dr_quine
École 42 assignment in C - quine in C, NASM macho64 and Golang

### About the project
* This is an individual project at [École 42](https://42.fr).
* The project objective is to create quines (self-replicated programs) in C and Assembly. I also did it in Golang as extra bonus.
	* Colleen will output its source code.
	* Grace will create a new file with the same source code as itself.
	* For Sully, there is an integer in the file. Sully will run and create another file with the integer minus one. Then the child will be compiled and run to create another one until the number reach zero.


### How to run the program
* Run Makefile to create an executable file.
  ```
  make
  ```
* The command to run the program is
  ```
  ./Colleen
  ```
  ```
  ./Grace
  ```
  ```
  ./Sully
  ```
  