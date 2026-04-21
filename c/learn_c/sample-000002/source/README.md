
# Working with the stack #

A sample program created to practice debugging techniques.

The program intended for learning how to work with the stack in a debugger.

Compile with the following command:

````
gcc -O0 -g3 -o main ../source/main.c
````

where

````
-g3 — add maximum debug info (includes macro definitions)
-O0 — disable optimizations (recommended for debugging, so variables/lines aren't optimized away)
-o FILENAME — place the output into a file with FILENAME
````

Use the following commands in the GDB debugger:

````
file main — load the `main` file into the debugging session
b[reak] NUMBER — set a breakpoint at the NUMBER line; the NUBMER should be `4` and `14` for this sample
i[nfo] b[reakpoints] — display all breakpoints
r[un] — run the program; the program will stop at the first breakpoint
i[nfo] lo[cals] — show the local variables and their values at the current breakpoint or the selected stack frame
bt|backtrace — show the call stack
i[nfo] f[rame] 2 — show the description of the selected stack frame (`2`)
f[rame] 3 — select the specified stack frame (`3`)
````

