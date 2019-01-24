#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int i = 5;
	if (i <= 0) return (0);
	char *sully = basename(__FILE__);
	if (sully && strcmp(sully, "Sully.c") != 0) i--;
	char *file_name;
	char *compile;
	char *run;
	asprintf(&file_name, "Sully_%d.c", i);
	asprintf(&compile, "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", i, i);
	asprintf(&run, "./Sully_%d", i);
	FILE *fp;
	if ((fp = fopen(file_name, "w")) == NULL) return (EXIT_FAILURE);
	char *str = "#include <libgen.h>%4$c#include <stdio.h>%4$c#include <stdlib.h>%4$c#include <string.h>%4$c%4$cint main(void)%4$c{%4$c%3$cint i = %2$d;%4$c%3$cif (i <= 0) return (0);%4$c%3$cchar *sully = basename(__FILE__);%4$c%3$cif (sully && strcmp(sully, %5$cSully.c%5$c) != 0) i--;%4$c%3$cchar *file_name;%4$c%3$cchar *compile;%4$c%3$cchar *run;%4$c%3$casprintf(&file_name, %5$cSully_%6$cd.c%5$c, i);%4$c%3$casprintf(&compile, %5$cclang -Wall -Wextra -Werror Sully_%6$cd.c -o Sully_%6$cd%5$c, i, i);%4$c%3$casprintf(&run, %5$c./Sully_%6$cd%5$c, i);%4$c%3$cFILE *fp;%4$c%3$cif ((fp = fopen(file_name, %5$cw%5$c)) == NULL) return (EXIT_FAILURE);%4$c%3$cchar *str = %5$c%1$s%5$c;%4$c%3$cfprintf(fp, str, str, i, 9, 10, 34, 37);%4$c%3$cfclose(fp);%4$c%3$csystem(compile);%4$c%3$csystem(run);%4$c%3$cfree(file_name);%4$c%3$cfree(compile);%4$c%3$cfree(run);%4$c}%4$c";
	fprintf(fp, str, str, i, 9, 10, 34, 37);
	fclose(fp);
	system(compile);
	system(run);
	free(file_name);
	free(compile);
	free(run);
}
