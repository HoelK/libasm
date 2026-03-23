ASM=nasm
ASMFLAGS=-felf64 -g
SRCS=src/ft_strlen.s \
	 src/ft_strcpy.s \
	 src/ft_strcmp.s \
	 src/ft_write.s \
	 src/ft_read.s \
	 src/ft_strdup.s
OBJS=$(SRCS:.s=.o)
NAME=libasm.a

CC=cc
TESTFLAGS=-fuse-ld=lld -pie -fsanitize=address -L. -lasm
TESTSRCS=tests/test.c
TESTOBJS=$(TESTSRCS:.c=.o)
TESTNAME=test

DEFAULTFLAGS=-Wall -Werror -Wextra -g

all: start $(NAME) test

YELLOW=\e[1;33m
GREEN=\e[1;32m
RED=\e[1;31m
DEFAULT=\033[0m

start:
	@printf "$(YELLOW)==============LIBASM===============$(DEFAULT)\n"

test: $(NAME) $(TESTOBJS)
	@printf "$(GREEN)[LIBASM] Building test...$(DEFAULT)\n"
	@$(CC) $(TESTOBJS) -o $(TESTNAME) $(DEFAULTFLAGS) $(TESTFLAGS)
	@printf "$(GREEN)[LIBASM] Build Complete !$(DEFAULT)\n"

$(NAME): $(OBJS)
	@printf "$(GREEN)[LIBASM] Building library...$(DEFAULT)\n"
	@ar rcs $(NAME) $(OBJS)
	@printf "$(GREEN)[LIBASM] Build Complete !$(DEFAULT)\n"

%.o: %.c
	@printf "\e[1;33m===============TESTER===============$(DEFAULT)\n"
	@printf "$(GREEN)[LIBASM] Compiling $^$(DEFAULT)\n"
	@$(CC) $(DEFAULTFLAGS) -I./header -c $^ -o $@

%.o: %.s
	@printf "$(GREEN)[LIBASM] Compiling $^$(DEFAULT)\n"
	@$(ASM) $(ASMFLAGS) $^ -o $@

clean:
	@printf "$(RED)[DELETING RESIDUAL FILES]$(DEFAULT)\n"
	@rm -f $(OBJS) $(TESTOBJS)

fclean: clean
	@printf "$(RED)[DELETING EXECUTABLES]$(DEFAULT)\n"
	@rm -f $(NAME) $(TESTNAME)

re: fclean all
