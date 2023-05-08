// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    // Copy the value stored in R0 into x variable
    @R0 // Load the value stored in memory location R0 into A Register
	D=M // Load value from A register into D register
	@x // Load the value of the memory address represented as x
	M=D	// Copy value stored in D register into x
    //
    // Copy the value stored in R1 into y (same as above)
	@R1
	D=M
	@y
	M=D	// Copy value stored in D register into y

    
    // Load the value 0 into R2
	@0
	D=A //Load constant 0 into D register
	@R2
	M=D	// Copy value stored in D register pointed to by A register which is R2

(WHILE)
	// Begin the main loop (WHILE) that will execute R0 times
	@x
	D=M	// Load value of x (loop counter) into the D register
	@END
	D;JLE	// if x is less than or equal to 0, exit loop and jump to END

	// begin body of while
	@y
	D=M	// Load the value of y into the D register
	@R2
	M=D+M	// Add the value of y to R2
	@1
	D=A	// Load the value of 1 to D
	@x
	M=M-D	// subtract 1 from the loop counter x and store in x

	@WHILE 
	0;JMP // Jump to the beggining of the while loop
(END)	
	@END
	0;JMP	// Infinite loop (program end)