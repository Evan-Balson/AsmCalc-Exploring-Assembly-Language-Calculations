# AsmCalc-Exploring-Assembly-Language-Calculations

AsmCalc: Explores Assembly Language Calculations

Submitted by: Evan Balson
### Time spent: 7 days

<img src='https://github.com/Evan-Balson/AsmCalc-Exploring-Assembly-Language-Calculations/blob/main/Assembly%20Language%20cover.mp4' title='Program Preview' width='' alt='program-preview' />

## Description:
AsmCalc: Explores Assembly Language Calculations, showcasing the power of Assembly Language in computing. Explore fundamental arithmetic, subroutines, and control flow with sample .asm code:

* [X] Solution to simple Hello world
* [x] Solution to Question 1
* [x] Solution to Question 2
* [x] Solution to Question 3
* [x] Solution to Question 4
* [x] Solution to Question 5
* [X] Solution to Arithmetic
* [X] Solution to Addition
* [X] Solution to Subtraction
* [X] Solution to division
* [X] Solution to Multiplication
* [X] Solution to Greater Than Operations
* [X] Solution to Greater Than Operations (Jmp function used)
* [X] Solution to creating a Countdown loop
* [X] Solution to creating a countdown by 2 loop
* [X] Solution to Logical Operations
* [X] Solution to Loop structures
* [X] Solution to user input (Name)
* [X] Solution to Further Prompts
* [X] Solution to Subroutines


## Table of Content:

1. Technologies used
2. Instructions
3. Requirements
4. Contributions
5. License Information

------------------------------------------------------------------------
# 1. TECHNOLOGIES USED:
------------------------------------------------------------------------
1. VirtualBox: Used for virtualization to run Ubuntu.
2. Ubuntu: Used as the guest operating system for development.
3. NASM: Used as the assembler for Assembly Language code.
4. GCC: Used as the linker for compiling the Assembly code.


------------------------------------------------------------------------
# 2. Instructions:
------------------------------------------------------------------------
1. Clone the repository to your Ubuntu virtual machine.
2. Navigate to the project directory in the terminal.
3. Edit the calculator.asm file using your preferred text editor.
4. Compile the Assembly code using nasm and gcc.
5. Run the compiled program according to the instructions provided.



------------------------------------------------------------------------
# 3. Requirements
------------------------------------------------------------------------
## Prerequisites:
1. Install VirtualBox: Download and install VirtualBox from https://www.virtualbox.org/.
2. Install Ubuntu: Download an Ubuntu ISO image from https://ubuntu.com/download and install it on VirtualBox.
3. Install NASM: Open a terminal in Ubuntu and run the following command: sudo apt-get install nasm
4. Install GCC: Still in the terminal, run the following command: sudo apt-get install gcc

## Usage:
1. Navigate to the working directory: Open a terminal and navigate to the directory where you want to save your .asm files.
2. Write your Assembly code: Use your preferred text editor to write your Assembly code. Save the file with a .asm extension.
3. Compile the Assembly code: In the terminal, use nasm to assemble your code and gcc to link it: 
* [x] nasm -f elf64 -o output.o input.asm
* [x] gcc -o output output.o
* [x] Replace input.asm with the name of your Assembly file and output with the desired name of your executable.

4. Run the program: Execute the compiled program by typing ./output in the terminal.

------------------------------------------------------------------------
# 4. CONTRIBUTIONS
------------------------------------------------------------------------

We welcome contributions from everyone, regardless of their experience level or background.

## How to Contribute:

Testing Contributions: Test the project and report any bugs or issues you encounter. You can also contribute by writing automated tests to improve test coverage.

Feedback and Suggestions: Provide feedback on the project, suggest new features.

------------------------------------------------------------------------
# 5. LICENSE INFORMATION
------------------------------------------------------------------------

## MIT License

Copyright (c) 2024 Evan Balson, Version 1.0

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.






.