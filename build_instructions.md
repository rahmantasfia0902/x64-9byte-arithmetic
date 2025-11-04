# 9-Byte Arithmetic Module - Build Instructions

## Prerequisites

- NASM assembler (Netwide Assembler)
- GNU ld linker
- Linux x64 system (or WSL on Windows)

## Installation of Prerequisites

### On Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install nasm build-essential
```

### On Arch Linux:
```bash
sudo pacman -S nasm base-devel
```

### On macOS:
```bash
brew install nasm
```

## Building the Project

### Method 1: Using the Makefile

```bash
make
```

This will:
1. Assemble `arithmetic.asm` to `arithmetic.o`
2. Assemble `driver.asm` to `driver.o`
3. Link both object files into executable `test_arithmetic`

### Method 2: Manual Build Commands

```bash
# Assemble the arithmetic module
nasm -f elf64 arithmetic.asm -o arithmetic.o

# Assemble the driver module
nasm -f elf64 driver.asm -o driver.o

# Link both modules
ld -o test_arithmetic driver.o arithmetic.o
```

## Running the Tests

```bash
./test_arithmetic
```

## Expected Output

The program will output test results showing:
- Test number
- Operation type (ADD or SUB)
- Expected result in hexadecimal
- Actual result in hexadecimal
- Overflow/Underflow flag status
- PASS/FAIL for each test

## Test Cases Explained

### Test 1: Addition without overflow
- A = 0x0123456789ABCDEF01
- B = 0x00FFFFFFFFFFFFFF01
- Expected = 0x0223456789ABCDEF02
- Should NOT overflow

### Test 2: Addition with overflow
- A = 0xFFFFFFFFFFFFFFFFFF (maximum 9-byte value)
- B = 0x000000000000000001
- Expected = 0x000000000000000000 (wraps around)
- Should OVERFLOW (actual result would be 0x010000000000000000, but can't fit in 9 bytes)

### Test 3: Subtraction without underflow
- A = 0x123456789ABCDEF012
- B = 0x000000000000000012
- Expected = 0x123456789ABCDEF000
- Should NOT underflow

### Test 4: Subtraction with underflow
- A = 0x000000000000000001
- B = 0x000000000000000002
- Expected = 0xFFFFFFFFFFFFFFFFFF (two's complement wraps)
- Should UNDERFLOW (borrowing from non-existent higher byte)

### Test 5: Addition with carry propagation
- A = 0x80FFFFFFFFFFFFFFFF
- B = 0x80FFFFFFFFFFFFFFFF
- Expected = 0x01FFFFFFFFFFFFFFFE
- Should NOT overflow (result fits in 9 bytes)

## Cleaning Up

```bash
make clean
```

This removes all object files and the executable.

## Troubleshooting

### "Command not found: nasm"
Install NASM using the instructions above.

### "Permission denied" when running ./test_arithmetic
Make the file executable:
```bash
chmod +x test_arithmetic
```

### Wrong output format
Ensure you're using Linux x64 syscalls. On macOS, syscall numbers differ.
