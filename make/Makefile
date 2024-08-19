#
#
#

.PHONY: start fin

# .DEFAULT_GOAL = one

fin: two # `fin` is always executed, 'cause it's the first directive in the Makefile
	@echo fin

# touch `one` to make it later then `two`, so `two` will be executed
two: one
	@echo two
# "compile" `two`; this makes `two` later than `one`
	$(shell touch two)

one: start # `one` is always executed 'cause the `start` phony is always later
	@echo one

start:
	@echo start

