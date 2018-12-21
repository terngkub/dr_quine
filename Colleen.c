#include <stdio.h>

/*
 * Comment
 */

void	print_source(void)
{
	char	*str = "#include <stdio.h>%c%c/*%c * Comment%c */%c%cvoid%cprint_source(void)%c{%c%cchar%c*str = %c%s%c;%c%cprintf(str, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);%c}%c%cint%cmain(void)%c{%c%c/*%c%c * Comment%c%c */%c%cprint_source();%c%creturn (0);%c}%c";
	printf(str, 10, 10, 10, 10, 10, 10, 9, 10, 10, 9, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);
}

int	main(void)
{
	/*
	 * Comment
	 */
	print_source();
	return (0);
}
