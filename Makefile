ASM=nasm
ASMFLAGS=-f elf64 -g
SRCS=src/ft_strlen.s src/ft_strcpy.s src/ft_strcmp.s
OBJS=$(SRCS:.s=.o)
NAME=libasm.a

CC=cc
TESTFLAGS=-fsanitize=address -g -L. -lasm
TESTSRCS=tests/test.c
TESTOBJS=$(TESTSRCS:.c=.o)
TESTNAME=test

DEFAULTFLAGS=-Wall -Werror -Wextra

all: $(NAME) test

test: $(NAME) $(TESTOBJS)
	$(CC) $(TESTOBJS) -o $(TESTNAME) $(DEFAULTFLAGS) $(TESTFLAGS)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(DEFAULTFLAGS) -c $^ -o $@

%.o: %.s
	$(ASM) $(ASMFLAGS) $^ -o $@

clean:
	rm -f $(OBJS) $(TESTOBJS)

fclean: clean
	rm -f $(NAME) $(TESTNAME)

re: fclean all
