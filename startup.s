.section .vector_table, "x" // put the vector table section at the address 0
.global _Reset              // defining a global symbol for the entry point of the program it points at the beginning of the vector table
_Reset:
    b Reset_Handler         /* reset vector is the Reset handler */
    b .                     /* 0x4 Undefined Instruction */
    b .                     /* 0x8 Software Interrupt */
    b .                     /* 0xC Prefetch Abort */
    b .                     /* 0x10 Data Abort */
    b .                     /* 0x14 Reserved */
    b .                     /*0x18IRQ*/
    b .                     /* 0x1C FIQ */

.section .text              // we create a section for the code and the Reset_handler points to it
Reset_Handler:
    ldr r2, str1            // save the string into r2 gp register 
    b .                     // branch to the actual address
    str1: .word 0xDEADBEEF  // allocate a word (4 bytes) which value is 0xDEADBEEF and label it as str1
