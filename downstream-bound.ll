; ModuleID = "bound"
target triple = "i386-pc-linux-gnu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i32 @"main"() 
{
entry:
  %"iVar1" = alloca i32
  %"var_ch" = alloca i32
  %"var_4h" = alloca i64
  %"register0x00000206" = alloca i8
  %"register0x00000000" = alloca i32
  br label %"0"
"0":
  %".3" = call i32 @"nd"()
  store i32 %".3", i32* %"iVar1"
  %".5" = load i32, i32* %"iVar1"
  %".6" = srem i32 %".5", 10
  %".7" = add i32 %".6", -2
  store i32 %".7", i32* %"var_ch"
  br label %"1"
"1":
  %".10" = load i32, i32* %"var_ch"
  %".11" = icmp slt i32 %".10", 10
  br i1 %".11", label %"2", label %"6"
"2":
  %".13" = load i32, i32* %"var_ch"
  %".14" = icmp eq i32 %".13", 9
  %".15" = bitcast i8* %"register0x00000206" to i1*
  store i1 %".14", i1* %".15"
  %".17" = load i8, i8* %"register0x00000206"
  %".18" = trunc i8 %".17" to i1
  br i1 %".18", label %"3", label %"4"
"3":
  call void @"verifier.error"()
  br label %"4"
"4":
  %".22" = load i32, i32* %"var_ch"
  %".23" = add i32 %".22", 1
  store i32 %".23", i32* %"var_ch"
  %".25" = load i32, i32* %"var_ch"
  %".26" = icmp eq i32 %".25", 13
  %".27" = bitcast i8* %"register0x00000206" to i1*
  store i1 %".26", i1* %".27"
  %".29" = load i8, i8* %"register0x00000206"
  %".30" = trunc i8 %".29" to i1
  br i1 %".30", label %"1", label %"5"
"5":
  br label %"1"
"6":
  store i32 0, i32* %"register0x00000000"
  %".34" = load i32, i32* %"register0x00000000"
  ret i32 %".34"
}

declare i32 @"nd"() 

declare void @"verifier.error"() 
