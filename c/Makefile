CC = clang
CFLAGS = -Wall -Wextra -Werror
EXES = Colleen Grace Sully
OBJS = $(addsuffix .o, $(EXES))

all : Colleen Grace Sully

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(EXES) : % : %.o
	$(CC) $(CFLAGS) $^ -o $@

clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(EXES)

re : fclean all

.PHONY : all clean fclean re