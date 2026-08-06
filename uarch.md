# Spice 16 implementation microarchitecture


Each operation has a 3 bit unit ID and 5 bit opcode

The units are as follows, with a shortening at the beginning:
- `L` | Select register for bus L
- `H` | Select register for bus H
- `I` | Pop from immediate queue
- `A` | Execute ALU operation
- `M` | Execute memory operation
- `R` | Execute IRQ operation
- `W` | Enqueue writeback

The MCU can consume up to 4 of those operation in a frame organized as such:
```
    [A, B, C, D]
```

Where:
- slot A can consume `L` operation
- slot B can consume `H` or `I` operations
- slot C can consume `A`, `M` or `R` operations
- slot D can consume `W` operation




