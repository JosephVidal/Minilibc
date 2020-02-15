##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

.PHONY: test

SRC			=	src/memcpy.asm	\
				src/memmove.asm	\
				src/memset.asm	\
				src/strchr.asm	\
				src/strcmp.asm	\
				src/strlen.asm	\
				src/strncmp.asm	\
				src/strstr.asm	\

CC			=	gcc

LD			=	ld

LDFLAGS		=	-shared

ASFLAGS		=	-f elf64 -Ox

OBJ			=	$(SRC:.asm=.o)

NAME		=	libasm.so

%.o : %.asm ## Compile asm files
	nasm $(ASFLAGS) $< -o $@

all :	$(NAME) ## Build

$(NAME) :	$(OBJ) ## Linking
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

debeug : ASFLAGS += -g ## Build with debeug symbols
debeug : all

debeug_mac : LDFLAGS = -dynamic -dylib -arch x86_64 -macosx_version_min 10.6 -no_pie -e _start ## Debeug for mac
debeug_mac : ASFLAGS = -f macho64 -Ox -g
debeug_mac : all

mac : LDFLAGS = -dynamic -dylib -arch x86_64 -macosx_version_min 10.6 -no_pie -e _start ## Build for mac
mac : ASFLAGS = -f macho64 -Ox
mac : all

clean : ## Clean project
	rm -f *~
	rm -f *#*
	rm -f $(OBJ)
	rm -f tests/*.o

fclean : clean ## Restart to zero
	make fclean -C tests
	rm -f $(NAME)
	rm -f tests/*.o
	rm -f *.out

re :	fclean all ## Restart to zero and build

tests_run: all
	make re -C tests

help : ## Display help
	@grep -E '^[a-zA-Z_-]+ :.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker_test: fclean ## Run a docker for testing
	docker run --rm -v $(PWD):/project -it epitech zsh -c "cd project && make tests_run"