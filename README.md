# bash-scripts
an attempt to earn my stripes
_____________

exercises from:  
## [BASH Programming - Introduction HOW-TO][1]
### by Mike G mikkey at [dynamo.com.ar][2]
[http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc1][1]

-------------------

## misc notes:
### There are 3 descriptors  
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


[1]:http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc1
[2]:http://dynamo.com.ar