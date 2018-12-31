#define _GNU_SOURCE 1
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int i = 5;
	if (i <= 0) return (0);
	char *sully = strrchr(__FILE__, 'S');
	if (sully && strcmp(sully, "Sully.c") != 0) i--;
	char *file_name;
	char *compile;
	char *run;
	asprintf(&file_name, "Sully_%d.c", i);
	asprintf(&compile, "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", i, i);
	asprintf(&run, "./Sully_%d", i);
	FILE *fp = fopen(file_name, "w");
	char *str = "#define _GNU_SOURCE 1%c#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%c%cint main(void)%c{%c%cint i = %d;%c%cif (i <= 0) return (0);%c%cchar *sully = strrchr(__FILE__, 'S');%c%cif (sully && strcmp(sully, %cSully.c%c) != 0) i--;%c%cchar *file_name;%c%cchar *compile;%c%cchar *run;%c%casprintf(&file_name, %cSully_%cd.c%c, i);%c%casprintf(&compile, %cclang -Wall -Wextra -Werror Sully_%cd.c -o Sully_%cd%c, i, i);%c%casprintf(&run, %c./Sully_%cd%c, i);%c%cFILE *fp = fopen(file_name, %cw%c);%c%cchar *str = %c%s%c;%c%cfprintf(fp, str, 10, 10, 10, 10, 10, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 37, 34, 10, 9, 34, 37, 37, 34, 10, 9, 34, 37, 34, 10, 9, 34, 34, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);%c%cfclose(fp);%c%csystem(compile);%c%csystem(run);%c%cfree(file_name);%c%cfree(compile);%c%cfree(run);%c}%c";
	fprintf(fp, str, 10, 10, 10, 10, 10, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 37, 34, 10, 9, 34, 37, 37, 34, 10, 9, 34, 37, 34, 10, 9, 34, 34, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10);
	fclose(fp);
	system(compile);
	system(run);
	free(file_name);
	free(compile);
	free(run);
}
