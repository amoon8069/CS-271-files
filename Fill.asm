// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)
    //Set start conditions
    //Set addr to first pixel

    @SCREEN
    D=A
    @address
    M=D

    //Set pixel counter to 8192
    @8192
    D=A
    @pixels
    M=D

(CHECK)
    //Get user input
    //Check if there are pixels left to fill
    @pixels
    D=M

    //Go back to start if no pixels to fill
    @START
    D;JEQ

    //Check keyboard input
    @KBD
    D=M

    //Fill screen if key pressed
    @FILLSCREEN
    D;JNE

    //UnFill screen if no key is pressed
    @UNFILLSCREEN
    D;JEQ

(FILLSCREEN)
    //set pixel at address to 1
    @address
    A=M
    M=-1

    //Advance one
    @address
    M=M+1

    //sub one pixel to fill
    @pixels
    M=M-1

    //Check user input
    @CHECK
    0;JMP

(UNFILLSCREEN)
    //set pixel addres to 0
    A=M
    M=0

    //Advance one
    @address
    M=M+1

    @pixels
    M=M-1

    @CHECK
    0;JMP
