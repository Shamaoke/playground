#
# ::: Rabbits :::
#

MAKEFLAGS += --silent

.PHONY: start exec fin
# If a .PHONY directive is a recipe, then its modification time is always ealier
# than its dependency. That is it's always executed.
#
# In the present file, in the recipe `exec: rabbit.beam`, the `rabbit.beam`
# directive will be alwyas triggered, since, no matter what modification time
# the `rabbit.beam` file has, the `exec` directive is always ealier.
#
# If a .PHONY directive is a dependency, then its modification time is always
# later than than a recipe. That is the recipe is always executed.
#
# In the present file, in the recipe `rabbit.erl: start`, the `start` directive
# will be always triggered, since, no matter what modification time the `rabbit.erl`
# file has, the `start` dependency modification time is always later.
#

# .DEFAULT_GOAL = fin

RED    = \\x1b\\x5b38;5;1\\x6d
GREEN  = \\x1b\\x5b38;5;2\\x6d
YELLOW = \\x1b\\x5b38;5;3\\x6d
BLUE   = \\x1b\\x5b38;5;4\\x6d
END    = \\x1b\\x5b0\\x6d

fin: exec
	@echo -e "$(BLUE)fin$(END)"
	@echo -e "$(GREEN)Finished!$(END)"

exec: rabbit.beam
	@echo -e "$(BLUE)exec$(END)"
	@echo -e "$(GREEN)Executing $(END)$(YELLOW)rabbit.beam$(END)$(GREEN)...$(END)"
	erl -noshell -s rabbit -s init stop
	@echo -e "$(GREEN)Done!$(END)"

rabbit.beam: rabbit.erl
	@echo -e "$(BLUE)rabbit.beam$(END)"
	@echo -e "$(GREEN)Dialyzing $(END)$(YELLOW)rabbit.erl$(END)$(GREEN)...$(END)"
	dialyzer --plt .dialyzer/cache.plt rabbit.erl
	@echo -e "$(GREEN)Done!$(END)"
	
	@echo -n -e "$(GREEN)Compiling $(END)$(YELLOW)rabbit.erl$(END)$(GREEN)...$(END)"
	erlc rabbit.erl
	@echo -e "$(GREEN) Done!$(END)"

rabbit.erl: start
	@echo -e "$(BLUE)rabbit.erl$(END)"

start:
	@echo -e "$(BLUE)start$(END)"
	@echo -e "$(GREEN)Starting...$(END)"

# vim: textwidth=80 colorcolumn=80:
