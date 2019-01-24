#include <stdio.h>

/*
	Comment
*/

void print_source(void)
{
	char *str = "#include <stdio.h>%1$c%1$c/*%1$c%2$cComment%1$c*/%1$c%1$cvoid print_source(void)%1$c{%1$c%2$cchar *str = %3$c%4$s%3$c;%1$c%2$cprintf(str, 10, 9, 34, str);%1$c}%1$c%1$cint main(void)%1$c{%1$c/*%1$c%2$cComment%1$c*/%1$c%2$cprint_source();%1$c}%1$c";
	printf(str, 10, 9, 34, str);
}

int main(void)
{
/*
	Comment
*/
	print_source();
}
