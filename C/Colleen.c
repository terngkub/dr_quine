#include <stdio.h>

/*
	Comment
*/

void print_source(void)
{
	char *str = "#include <stdio.h>%3$c%3$c/*%3$c%2$cComment%3$c*/%3$c%3$cvoid print_source(void)%3$c{%3$c%2$cchar *str = %4$c%1$s%4$c;%3$c%2$cprintf(str, str, 9, 10, 34);%3$c}%3$c%3$cint main(void)%3$c{%3$c/*%3$c%2$cComment%3$c*/%3$c%2$cprint_source();%3$c}%3$c";
	printf(str, str, 9, 10, 34);
}

int main(void)
{
/*
	Comment
*/
	print_source();
}
