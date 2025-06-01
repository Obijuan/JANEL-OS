#!/bin/bash

#-- Directorio donde esta la toolchain
TOOLCHAIN=$HOME/".pico-sdk/toolchain/RISCV_RPI_2_0_0_5/bin"

# -- Nombre del fichero fuente (sin extension)
MAIN="main"

# -- Ensamblador
AS=$TOOLCHAIN"/riscv32-unknown-elf-as"

# -- Linker
LD=$TOOLCHAIN"/riscv32-unknown-elf-ld"

# -- Picotool
PICOTOOL=$HOME/".pico-sdk/picotool/2.1.1/picotool/picotool"

# -- Ensamblado 
$AS -g -march=rv32i -mabi=ilp32  -o boot.o boot.s 
$AS -g -march=rv32i -mabi=ilp32  -o runtime.o runtime.s
$AS -g -march=rv32i -mabi=ilp32  -o led.o led.s
$AS -g -march=rv32im -mabi=ilp32  -o uart.o uart.s
$AS -g -march=rv32i -mabi=ilp32  -o ansi.o ansi.s
$AS -g -march=rv32i -mabi=ilp32  -o delay.o delay.s
$AS -g -march=rv32i_zicsr -mabi=ilp32  -o mtime.o mtime.s
$AS -g -march=rv32i -mabi=ilp32  -o math.o math.s
$AS -g -march=rv32i_zicsr -mabi=ilp32  -o kernel.o kernel.s 
$AS -g -march=rv32i_zicsr -mabi=ilp32  -o $MAIN.o $MAIN.s

# -- Linkado
$LD -g -m elf32lriscv -T linker.ld -o $MAIN.elf \
     boot.o $MAIN.o  runtime.o led.o \
     uart.o delay.o ansi.o \
     math.o mtime.o kernel.o \

# -- Convertir a UF2
$PICOTOOL uf2 convert $MAIN.elf $MAIN.uf2 --family rp2350-riscv --abs-block

