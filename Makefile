##
## EPITECH PROJECT, 2024
## 104neutrinos
## File description:
## Compiles better than me
##

CC = ghc

NAME =	106bombyx

SRC =	$(wildcard *.hs)

$(NAME) :
	$(CC) -o $(NAME) $(SRC)

all : $(NAME)

clean :
	rm -rf *.hi
	rm -rf *.o
	rm -rf *~

fclean : clean
	rm -rf $(NAME)

re : fclean all
