ASMC = nasm
ASMFLAGS = -f macho64
CC = gcc
CFLAGS = -Wall -Wextra -Werror
EXES = Colleen Grace Sully
OBJS = $(addsuffix .o, $(EXES))

all : Colleen Grace Sully

%.o : %.s
	$(ASMC) $(ASMFLAGS) $< -o $@

$(EXES) : % : %.o
	$(CC) $(CFLAGS) $^ -o $@

clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(EXES)

re : fclean all

.PHONY : all clean fclean re