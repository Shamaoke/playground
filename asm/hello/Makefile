#
# ::: hello :::
#

MAKEFLAGS += --silent

.PHONY: start fin
# .DEFAULT_GOAL = fin

RED    = \\x1b\\x5b38;5;1\\x6d
GREEN  = \\x1b\\x5b38;5;2\\x6d
YELLOW = \\x1b\\x5b38;5;3\\x6d
BLUE   = \\x1b\\x5b38;5;4\\x6d
END    = \\x1b\\x5b0\\x6d

fin: hello hello32
	@echo -e "$(GREEN)Finished!$(END)"

hello32: hello32.o
	@echo -n -e "$(GREEN)Linking $(END)$(YELLOW)hello32.o$(END)$(GREEN)...$(END) "
	# ld -m elf_i386 --output=hello32 hello32.o
	ld.lld -m elf_i386 --output=hello32 hello32.o
	@echo -e "$(GREEN)Done!$(END)"

hello: hello.o
	@echo -n -e "$(GREEN)Linking $(END)$(YELLOW)hello.o$(END)$(GREEN)...$(END) "
	# ld --output=hello hello.o
	ld.lld --output=hello hello.o
	@echo -e "$(GREEN)Done!$(END)"

hello32.o: hello32.asm
	@echo -n -e "$(GREEN)Compiling $(END)$(YELLOW)hello32.asm$(END)$(GREEN)...$(END) "
	yasm --oformat=elf32 \
	     --dformat=dwarf2 \
	     --parser=nasm \
	     --list=hello32.lst \
	     --objfile=hello32.o \
	       hello32.asm
	@echo -e "$(GREEN)Done!$(END)"

hello.o: hello.asm
	@echo -n -e "$(GREEN)Compiling $(END)$(YELLOW)hello.asm$(END)$(GREEN)...$(END) "
	yasm --oformat=elf64 \
	     --dformat=dwarf2 \
	     --parser=nasm \
	     --list=hello.lst \
	     --objfile=hello.o \
	       hello.asm
	@echo -e "$(GREEN)Done!$(END)"

hello32.asm: start
	@echo -e "$(BLUE)From hello32.asm$(END)"

hello.asm: start
	@echo -e "$(BLUE)From hello.asm$(END)"

start:
	@echo -e "$(GREEN)Starting...$(END)"

