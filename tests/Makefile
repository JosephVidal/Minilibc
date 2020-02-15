##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

CC	    =	gcc

SRC		=	tests.c

NAME	=	unit_tests

OBJ	    =   $(SRC:.c=.o)

all:    $(NAME)

$(NAME) : $(OBJ)
	$(CC) -o $(NAME) $(OBJ)
	./unit_tests > 1
	LD_PRELOAD=../libasm.so ./unit_tests > 2
	diff 1 2

clean:
	rm -f *~
	rm -f 1 2
	rm -f *#*
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all
