#include <stdio.h>
#define FILE_NAME "Grace_kid.c"
#define WRITE "w"
#define FUNC int main(void) {FILE *fp; char *str = "#include <stdio.h>%c#define FILE_NAME %cGrace_kid.c%c%c#define WRITE %cw%c%c#define FUNC int main(void) {FILE *fp; char *str = %c%s%c; fp = fopen(FILE_NAME, WRITE); fprintf(fp, str, 10, 34, 34, 10, 34, 34, 10, 34, str, 34, 10, 10, 10, 9, 10, 10); fclose(fp);}%cFUNC;%c/*%c%cComment%c*/%c"; fp = fopen(FILE_NAME, WRITE); fprintf(fp, str, 10, 34, 34, 10, 34, 34, 10, 34, str, 34, 10, 10, 10, 9, 10, 10); fclose(fp);}
FUNC;
/*
	Comment
*/
