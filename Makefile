##
## Makefile for libasm in /home/bouca-_d/rendu/asm_minilibc
## 
## Made by Dany Bouca Nova
## Login   <bouca-_d@epitech.net>
## 
## Started on  Sun Mar 22 18:04:00 2015 Dany Bouca Nova
## Last update Sun Mar 22 22:09:58 2015 Dany Bouca Nova
##

RM = rm -f

NASM = nasm
NASMFLAGS = -f elf64

CC = gcc
CFLAGS = -shared -fPIC

OBJ = $(SRC:.S=.o)

NAME = libasm.so

SRC =	memmove.S		\
	strstr.S		\
	strspn.S		\
	strcspn.S		\
	bzero.S			\
	strcmp.S		\
	rindex.S		\
	memset.S		\
	strchr.S		\
	strcasecmp.S		\
	strncmp.S		\
	strlen.S		\
	strpbrk.S		\
	index.S			\

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

%.o:	%.S
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
