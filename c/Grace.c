#include <stdio.h>
#define FILE_NAME "Grace_kid.c"
#define WRITE "w"
#define FUNC int main(void) {FILE *fp; char *str = "#include <stdio.h>%3$c#define FILE_NAME %4$cGrace_kid.c%4$c%3$c#define WRITE %4$cw%4$c%3$c#define FUNC int main(void) {FILE *fp; char *str = %4$c%1$s%4$c; fp = fopen(FILE_NAME, WRITE); fprintf(fp, str, str, 9, 10, 34); fclose(fp);}%3$cFUNC;%3$c/*%3$c%2$cComment%3$c*/%3$c"; fp = fopen(FILE_NAME, WRITE); fprintf(fp, str, str, 9, 10, 34); fclose(fp);}
FUNC;
/*
	Comment
*/
