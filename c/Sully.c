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
asprintf(&file_name, "Sully_%d.c", i);
asprintf(&compile, "clang -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i);
FILE *fp;
if ((fp = fopen(file_name, "w")) == NULL) return (EXIT_FAILURE);
char *str = "#include <libgen.h>%3$c#include <stdio.h>%3$c#include <stdlib.h>%3$c#include <string.h>%3$c%3$cint main(void)%3$c{%3$cint i = %2$d;%3$cif (i <= 0) return (0);%3$cchar *sully = basename(__FILE__);%3$cif (sully && strcmp(sully, %4$cSully.c%4$c) != 0) i--;%3$cchar *file_name;%3$cchar *compile;%3$casprintf(&file_name, %4$cSully_%5$cd.c%4$c, i);%3$casprintf(&compile, %4$cclang -Wall -Wextra -Werror Sully_%5$c1$d.c -o Sully_%5$c1$d && ./Sully_%5$c1$d%4$c, i);%3$cFILE *fp;%3$cif ((fp = fopen(file_name, %4$cw%4$c)) == NULL) return (EXIT_FAILURE);%3$cchar *str = %4$c%1$s%4$c;%3$cfprintf(fp, str, str, i, 10, 34, 37);%3$cfclose(fp);%3$csystem(compile);%3$cfree(file_name);%3$cfree(compile);%3$c}%3$c";
fprintf(fp, str, str, i, 10, 34, 37);
fclose(fp);
system(compile);
free(file_name);
free(compile);
}
