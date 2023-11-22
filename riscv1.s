.text
__start:
 li a2, 0 #inside a2: iterable var = i
 la a4, array_length
 lw a4, 0 (a4) #inside a4: int array_len value
 la a5, array #inside a5: address of 0's array element
 addi a6, a4, -1 #inside a6: int array_len value - 1
outer_loop:
 bgeu a2, a6, outer_loop_exit # if( a2 >= a3 ) goto outer_loop_exit
 li a3, 0 #inside a3: iterable var = j
 sub t5, a6, a2
 addi a2, a2, 1
inner_loop:
 bgeu a3, t5, inner_loop_exit
 slli t2, a3, 2 # t2 = j * 4
 add t0, a5, t2 # t0 = address of 0's element + j; arr[i] element
 addi t1, t0, 4 # t address of arr[i + 1] element
 addi a3, a3, 1
 lw t3, 0 (t0) # array[i]
 lw t4, 0 (t1) # array[i + 1]
 bgeu t3, t4, swap
 jal zero, inner_loop
inner_loop_exit:
 jal zero, outer_loop
 
outer_loop_exit:
 la t0, k
 lw t0, 0(t0)
 addi t0, t0, -1
 slli t0, t0, 2
 add t0, a5, t0
 lw t0, 0 (t0)
 li a0, 1 # command to print in result in console
 addi a1, t0, 0
 ecall 
 li a0, 10
 ecall
 
swap:
 sw t3, 0 (t1) # array[i] = t1
 sw t4, 0 (t0) # array[i-1] = t0
 jal zero, inner_loop
 
.globl __start
.rodata
k: .word 5
array_length: .word 6
.data
array:
 .word 11, 10, 2, 1, 10101, 3