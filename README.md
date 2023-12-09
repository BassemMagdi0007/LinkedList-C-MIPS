# Mapping the linked-list data structure scripted in C into MIPS assembly language

## Overview:

## Table of Contents
- [Introduction](#introduction)
- [Functions](#functions)
  - Insertion
  - Deletion
  - Printing
  - Searching
  - Updating
  - Accessing
  - Sorting
  - Global Functions
- [Execution Instructions](#execution-instructions)
- [Contributing](#Contributing)
- [License](#license)

## Introduction
This project involves the translation of a linked-list data structure implemented in the C programming language into the MIPS assembly language.
It implements various operations on a singly linked list in MIPS assembly language. The operations include insertion, deletion, printing, searching, updating, accessing, and sorting of the linked list.


## Functions

- Insertion
The Insert_To_List function allows the user to insert a new element into the linked list at a specified position. It handles the insertion process, including updating pointers and managing the list size.

- Deletion
The Delete_From_List function enables the user to delete an element from the linked list at a specified position. It handles various edge cases, such as deleting from an empty list or at an invalid position.

- Printing
The Print_The_List function prints the elements of the linked list. It traverses the list and outputs each element, separated by a predefined separator.

- Searching
The Search_The_List function allows the user to search for a specific element in the linked list. It prompts the user for a value and performs a linear search to find the element's position.

- Updating
The Update_The_List function updates the value of an element in the linked list at a specified position. It scans for a new value and updates the corresponding node.

- Accessing
The Access_The_List function retrieves and prints the data value of a node in the linked list at a specified position. It prompts the user for a position and displays the corresponding element.

- Sorting
The Sort_The_List function implements a basic bubble sort algorithm to sort the linked list in ascending order based on the data values of its nodes.

## Global Functions
Several global functions are used for user input and error handling. These include functions for scanning input, scanning values for insertion, scanning positions for access, printing messages, and handling errors.

## Execution Instructions:
To run the MIPS code, follow the steps outlined below:

- **Java Runtime Environment (JRE):** Ensure that the 'Java Runtime Environment' is installed on your system.
- **Mars MIPS Simulator:** Download the 'Mars MIPS simulator' from the official website.
- **Launch Mars MIPS Simulator:** Open the 'Mars.jar' file to start the Mars MIPS simulator.
- **Select Assembly File:** Load the MIPS assembly code file (with the '.asm' extension) within the Mars MIPS simulator.
- **Compile the Code:** Choose 'Run' => 'Assemble' to compile the MIPS assembly code.
- **Execute the Code:** Initiate the program execution by pressing the 'Run' button within the Mars MIPS simulator.
  
## Contributing
Contributions are welcome! If you find any issues or have enhancements to suggest, please feel free to submit a pull request or open an issue.

## License 

MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.




