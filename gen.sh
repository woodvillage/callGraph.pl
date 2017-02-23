#!/bin/bash  
declare objd="/root/android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-objdump" 
declare SoBase="/root/so/" 
declare readelf="/root/android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-readelf" 
for f in `ls $SoBase `
do 
  echo "disassembling $f and dumping rel information"
  $objd -d $SoBase$f > asm.tmp #-d disassemble
  $readelf -r -W $SoBase$f > elf.tmp # -r 
  echo "parsing ................ "
  
  ./cg.pl asm.tmp  $f elf.tmp | tee -a callg.total 
done
