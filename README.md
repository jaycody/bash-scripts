# shell-scripts
an attempt to earn my stripes
_____________

exercises and notes from:  
### [BASH Programming - Introduction HOW-TO][1]
- #### by Mike G mikkey at [dynamo.com.ar][2] 

### [Getting Started with BASH: A Bash Tutorial][20]

### [BashGuide][21]

### [Shell Scripting Tutorial](https://www.shellscript.sh/) - by Steve Parker

-------------------
## What is the Bash Shell?
The GNU Bourne-Again SHell (BASH) incorporates features from the C Shell (csh) and the Korn Shell (ksh) and conforms to the POSTIX 2 shell specifications. It provides a Command Line Interface (CLI) for working on \*nix systems and is the most common shell used on Linux systems. [hypexr.org](http://www.hypexr.org/bash_tutorial.php)

BASH is an acronym for Bourne Again Shell. It is based on the Bourne shell and is mostly compatible with its features.

Shells are command interpreters. They are applications that provide users with the ability to give commands to their operating system interactively, or to execute batches of commands quickly. In no way are they required for the execution of programs; they are merely a layer between system function calls and the user.  [BashGuide][21]

BASH is not your operating system. It is not your window manager. **It is not your terminal (but it oftens runs inside your terminal).** It does not control your mouse or keyboard. It does not configure your system, activate your screensaver, or open your files when you double-click them. It is generally not involved in launching applications from your window manager or desktop environment. It's important to understand that BASH is only an interface for you to execute statements (using BASH syntax), either at the interactive BASH prompt or via BASH scripts. [BashGuide][21]

`Shell`: A (possibly interactive) command interpreter, acting as a layer between the user and the system.   
`Bash`: The Bourne Again Shell, a Bourne compatible shell.



### Bash Config Files
In your home directory, 3 files have a special meaning to Bash, allowing you to set up your environment automatically when you log in and when you invoke another Bash shell, and allow you to execute commands when you log out.  

`.bash_profile` : read and the commands in it executed by Bash every time you log in to the system  

`.bashrc` : read and executed by Bash every time you start a subshell  

`.bash_logout` : read and executed by Bash every time a login shell exits

The `.bash_profile` is read and executed when you log in to the system. If you start a subshell (a new shell) by typing `bash` at the command prompt, it will read commands from `.bashrc`. This allows you to separate commands needed at login from those needed when invoking a subshell. 

However, most people want to have the same commands run regardless of whether it is a login shell or a subshell. This can be done by using the `source` command from within `.bash_profile` to execute `.bashrc`. You would then simply place all the commands in `.bashrc`.

These files are useful for automatically executing commands like: `set, alias, unalias`, and setting the PS(1-4) variables, which can all be used to modify your bash environment.

### Modify the Bash Shell with `set`
`set -o emacs`
Gives emacs controls in the bash.  Could be useful

### Useful Commands 
Search `~/.bash_history`.  From the Bash prompt, browse recent history with arrow up down, OR  

`ctrl-r` invokes a search field with access to previous commands

Use `{}` to create lists  
  `touch {f1, f2, f3, f4}`

Execute multiple commands in a single line with `;` (semicolon)

-----------------

## Shell Scripts
### There are 3 file descriptors used for REDIRECTION
`stdin`  
`stdout`  
`stderr`  

### The 7 actions of descriptors  
```
redirect  stdout to a file
          stderr to a file
          stdout to a stderr
          stderr to a stdout
          stderr and stdout to a file
          stderr and stdout to stdout
          stderr and stdout to stderr
```

'1' represents `stdout`  
'2' represents `stderr`  

#### stdout to file
`1>` or just `>`  
as in:   
`ls -l > ls-l.txt`  
`grep ro * 1> grep-errors.txt`

#### stderr to file
`2>`  
as in:  
`grep ro * 2> grep-errors.txt`

#### stdout to stderr
`1>&2`  
as in:
`grep ro * 1>&2`  

#### stderr to stdout 
`2>&1`  
as in:  
`grep * 2>&1`

#### stderr AND stdout to file  
`&>`  
as in:  
`rm -f $(find / -name deleteMe) &> /path/to/newFile`  

----------------

## PIPES  |  
Pipes let you use the output of a program as the input of another.    

Instead of the output of `ls` being printed, it is piped to `sed`  
`ls -l | sed -e "s/[aeio]/u/g`  

Here the output of `ls -l` is sent to the `grep` program  
`ls -l | grep "\.txt$"`

-------------------

## VARIABLES
A variable in bash can contain a num, char, or string.  
And there's no need to declare a variable, just assign the value:  
```
#!/bin/bash 
STR="Hello new world of bash variables!"
echo $STR 
```

The `$` in line 3 retrieves the variable 

#### capturing a command's output in a variable 
```
#!/bin/bash
TSTAMP=$(date +%Y%m%d_%H%M%S)

mkdir tStampDirs/$TSTAMP
echo "Created dir tStampDirs/$TSTAMP"
ls -l tStampDirs
```

#### local variables
```
#!/bin/bash 
TSTAMP=$(date +%Y%m%d_%H%M%S)
function showDate {
  local TSTAMP=TODAY:
  echo $TSTAMP
}
showDate
echo $TSTAMP
```

## Conditionals
`if..then` base construction in bash:  
**NOTE:** empty char after '[ ' and before ' ]'  
```
if [ expression ]; then
  code if 'expression'is true.
fi
```  

`if..then..else` base construction in bash:  
```
if [ expression ]; then 
  code if true
else
  code if expression is false
fi
```

`if..then..else` example  
```
#!/bin/bash
if [ 1 == 0 ]; then
  echo yup it is the big T
else
  echo 'otherwise do this'
fi 
```

## Loops: For, While, and Until
#### for loop
The `for loop` in bash iterates over a series of words in a string. 
```
for i in $( ls ); do
  echo item: $i
done
``` 

#### while 
`while` executes a piece of code if the **control expression** is true, and only stops when the **control expression** is false (or an explicit break is found within the executed code).

#### until loop
`until` loop is almost equal to the while loop, except that the code is executed while the **control expression** evaluates to false  

#### examples
```
for i in $( ls ); do
  echo item: $i 
done  
```

### Functions
Use the same piece of code, but with different inputs each time.  
To declare:  
`function my_func {my_code}`
To call:
`my_func`


### User Interfaces 
#### Use select to make simple menus

### MISC
#### Reading User Input with `read`
```
#!/bin/bash 
echo Please, enter your name  
read NAME  
echo "Hi $NAME!"
```

```
echo Please, enter two words 
read FW SW
echo "your first word is $FW and your second word $SW"
```


#### Math
Use bash to evaluate an arithmetic expression
`echo $[1+1]`

#### Finding Bash 
`which bash`



--------------------



[1]:http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc1
[2]:http://dynamo.com.ar
[3]:http://superbad.com
[4]
[20]:http://www.hypexr.org/bash_tutorial.php
[21]:http://mywiki.wooledge.org/BashGuide
