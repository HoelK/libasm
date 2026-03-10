ASM=nasm
ASMFLAGS=-f elf64 -g
SRCS=src/ft_strlen.s \
	 src/ft_strcpy.s \
	 src/ft_strcmp.s \
	 src/ft_write.s \
	 src/ft_read.s \
	 src/ft_strdup.s
OBJS=$(SRCS:.s=.o)
NAME=libasm.a

CC=cc
TESTFLAGS=-fsanitize=address -L. -lasm
TESTSRCS=tests/test.c
TESTOBJS=$(TESTSRCS:.c=.o)
TESTNAME=test

DEFAULTFLAGS=-Wall -Werror -Wextra -g

all: start $(NAME) test
	
start:
	@echo "\e[1;33m===============LIBASM===============\e[1;30"

test: $(NAME) $(TESTOBJS)
	@echo "\e[1;32m [LIBASM] Building test...\e[1;30"
	@$(CC) $(TESTOBJS) -o $(TESTNAME) $(DEFAULTFLAGS) $(TESTFLAGS)
	@echo "\e[1;32m [LIBASM] Build Complete !\e[1;30"

$(NAME): $(OBJS)
	@echo "\e[1;32m [LIBASM] Building library...\e[1;30"
	@ar rcs $(NAME) $(OBJS)
	@echo "\e[1;32m [LIBASM] Build Complete !\e[1;30"

%.o: %.c
	@echo "\e[1;33m===============TESTER===============\e[1;30"
	@echo "\e[1;32m [LIBASM] Compiling $^\e[1;30"
	@$(CC) $(DEFAULTFLAGS) -I./header -c $^ -o $@

%.o: %.s
	@echo "\e[1;32m [LIBASM] Compiling $^\e[1;30"
	@$(ASM) $(ASMFLAGS) $^ -o $@

clean:
	@echo "\e[31m [DELETING RESIDUAL FILES]\e[1;30"
	@rm -f $(OBJS) $(TESTOBJS)

fclean: clean
	@echo "\e[31m [DELETING EXECUTABLES]\e[1;30"
	@rm -f $(NAME) $(TESTNAME)

re: fclean all
