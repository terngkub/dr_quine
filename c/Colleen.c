#include <stdio.h>

/*
	Comment
*/

void print_source(void)
{
	char *str = "#include <stdio.h>%c%c/*%c%cComment%c*/%c%cvoid print_source(void)%c{%c%cchar *str = %c%s%c;%c%cprintf(str, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 10);%c}%c%cint main(void)%c{%c/*%c%cComment%c*/%c%cprint_source();%c}%c";
	printf(str, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 10);
}

int main(void)
{
/*
	Comment
*/
	print_source();
}
