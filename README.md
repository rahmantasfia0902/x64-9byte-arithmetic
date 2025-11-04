# 9-Byte Unsigned Integer Arithmetic in x64 Assembly

This project implements multi-precision arithmetic for 9-byte (72-bit) unsigned integers in x64 assembly language.

## Features
- Addition and subtraction of 9-byte unsigned integers
- Overflow/underflow detection via carry flag
- Follows System V AMD64 ABI calling conventions
- Comprehensive test suite with 5 test cases

## Building
```bash
make
```

## Running Tests
```bash
./test_arithmetic
```

## Files
- `arithmetic.asm` - Core arithmetic module
- `driver.asm` - Test driver
- `Makefile` - Build automation
- `WRITEUP.md` - Detailed documentation

## Test Results
All 5 tests pass, including proper overflow detection for edge cases.
