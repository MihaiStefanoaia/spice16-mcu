# Spice 16, the 8 bit MCU

I didn't think the naming of the architecture through fully, don't question it.

## NOTES

Notation H|L refers to concatenation, H being high and L being low; for example: 1|2 = 12, 0xAB|0xCD = 0xABCD

## FEATURES

- 8 bit value bus
- 16 bit address bounds

## REGISTERS

16 bit usable registers - accessible by replacing the 'x' with 'h' or 'l' for accessing the high or low byte respectively:

`r0x` - general purpose register 0

`r1x` - general purpose register 1

`r2x` - general purpose register 2

`r3x` - general purpose register 3

`rax` - return address pointer

`rtx` - stack top pointer

`rbx` - stack base pointer

`rpx` - program counter

All registers can be used freely, but their names are suggestions for their use, except for `rpx` where it is not a suggestion - writing to `rpx` will modify the program counter, which can be intended behaviour.

When using `rpx` in an instruction, it will point to the next instruction.

Reserved (non usable) registers:

`rsx` - swap register

`rgi` - 16 bit instruction register. Named for no particular reason.

`rgf` - flags register (bitwise, low to high):

    0 flag
    carry
    negative (high bit 1)
    overflow



## INSTRUCTION SET


| opcode | instruction name | description |
|--------|------------------|-------------|
| 0x0    | ivt              | 2s complement invert an 8 bit register 
| 0x1    | not              | bitwise not
| 0x2    | shlshr           | shift left or right by unary immediate depending on the x bit
| 0x3    | tst              | calculate the flags based on the given value and immediate mask
| 0x4    | muldiv           | mul or div depending on the x bit
| 0x5    | swp16            | swap the values in one of the 16 bit registers with the rsx
| 0x6    | lim              | load immediate
| 0x7    | add16            | add signed immediate to 16 bit register
| 0x8    | mov              | copy value from one register to another
| 0x9    | adcsub           | add with carry or subtract depending on the x bit
| 0xA    | andor            | bitwise and or bitwise or depending on the x bit
| 0xB    | mwrmrd           | memory write or memory read depending on the x bit
| 0xC    | \<reserved\>     | unused
| 0xD    | \<reserved\>     | unused
| 0xE    | \<reserved\>     | unused
| 0xF    | cnj              | conditional near jump

Note: "depending on the x bit" means that the first specified instruction is run if x is 0, and the second if x is 1

## INSTRUCTION FORMATTING

All instructions are 16 bits wide and are grouped in multiple formats


### Binary operation

    0......7 | 8......F
    oooorrrr   bbbbx___

- o - opcode
- r - operand 1 + retire location
- b - operand 2
- x - instruction mode (basically opcode expansion)

instructions:
- mov
    - move a value from one 8 bit register to another
- adcsub
    - add (`adc` if x=0) or subtract (`sub` if x=1) the two 8 bit registers
    - adc will consume the `carry` flag as carry in
    - sets the zero, carry, negative and overflow to their relevant values
- andor
    - bitwise and (if x=0) or bitwise or (if x=1) the two 8 bit registers
- mwrmrd
    - write to memory (if x=0) or read from memory (if x=1)
    - on write, use 16 bit register associated with the left operand as the address to which to write, and the 8 bit value of the right operand as the value
    - on read, use the value of the 8 bit register of the left operand as the value, and the 16 bit register associated with the right operant as the address from which to read

### Unary operation

    0......7 | 8......F
    oooorrrr   iiiix___

- o - opcode
- r - register + retire location
- i - 4 bit immediate
- x - instruction mode (basically opcode expansion)

instructions:
- ivt
    - 2s complement invert the selected register
- not
    - Bitwise not the selected register
- shlshr
    - Shift the register left (`shl` if x=0) or right (`shr` if x=1) by the lowest 3 bits of the included immediate
        - Sets the carry flag based on the value of the last bit "consumed" by the shift - see [below](#shift-carry-behaviour)
- tst
    - Test and update the flags register based on the immediate mask
    - Computes the zero and negative flags, and resets the carry and overflow if selected
    - The update formula goes like so: `for i in [0..3]: flags[i] = computed[i] if mask[i] else flags[i]`
- muldiv
    - Select the 16 bit register associated with the register in `r` and multiply (`mul` if x=0) or divide (`div` if x=1) the high with the low
    - Multiplication will save the 16 bit result into the original register as is - high byte into `r_h` and low byte into `r_l`
        - multiplication sets the 0, negative and overflow flags based on the high byte
    - Division will save the remainder of the division into `r_h` and the result into `r_l`
        - division sets the 0 flag based on the remainder
    - The 16 bit register used is the one expanded from the encoding for the 8 bit one - for example instructions encoded as using either r0h or r0l will use r0x
- swp16
    - Swap the contents of the selected register with the `rsx`. Useful for far jumps and function calls
    - The 16 bit register used is the one expanded from the encoding for the 8 bit one - for example instructions encoded as using either r0h or r0l will use r0x



### Immediate containing binary op

    0......7 | 8......F
    oooorrrr   iiiiiiii

- o - opcode
- r - register + retire location
- i - immediate value

instructions:
- lim
    - Load the immediate into the selected register
- add16
    - Add the immediate to the selected 16 bit register. The immediate is signed in 2s complement
    - The 16 bit register used is the one expanded from the encoding for the 8 bit one - for example instructions encoded as using either r0h or r0l will use r0x

### Conditional instruction

    0......7 | 8......F
    oooocccc   viiiiiii

- o - opcode
- c - condition vector
- v - invert condition
- i - immediate value, 2s complement signed

instructions:
- cnj
    - The only conditional instruction in the architecture. If `(cond | (v ? rgf : ~rgf)) == 0xF`, jump by `i` instructions 
    - A special "halt" instruction (`hlt`) is a special encoding of this instruction 
        - `cnj 0xF -1` - unconditional jump to the previous instruction
    - The condition bits are in the same order as the flags register

## Instruction uses

### Far jump

```
    lim   rah 0xFE
    lim   ral 0x00
    swp16 rax
    swp16 rpx
```

### Function call

```
    add16 rtx -1
    memwr rtx rah
    lim   rah _func_entry.h
    add16 rtx -1
    memwr rtx ral
    lim   ral _func_entry.l
    swp16 rax
    swp16 rpx ; actual call happens here
    ; return point
    memrd ral rtx
    add16 rtx 1
    memrd rah rtx
    add16 rtx 1
```

### Function return

```
_func_entry:
    swp16 rax ;preserve return addr
    add16 rtx -1
    memwr rtx rbh
    add16 rtx -1
    memwr rtx rbl
    mov   rbl rtl
    mov   rbh rth
    ; stack is set up here
    ; function finally starts
    ...
    memrd rbl rtx
    add16 rtx 1
    memrd rbh rtx
    add16 rtx 1
    swp16 rax
    swp16 rpx
```

### Shift carry behaviour

The code below keeps looping infinitely

```
    lim   r0l 0xF4 ; 1111 0100
    shl   r0l 3    ; 1111 0[[1]00]
    jc    1        ; near jump if carry
    hlt            ; halt instruction never executes
    jmp   -5       ; go back to the beginning
```

While the code below stops at the `hlt` instuction

```
    lim   r0l 0xF4 ; 1111 0100
    shl   r0l 4    ; 1111 [[0]100]
    jc    1        ; near jump if carry (doesn't execute)
    hlt            ; halt instruction executes
    jmp   -5
```
