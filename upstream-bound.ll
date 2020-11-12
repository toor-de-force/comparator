; ModuleID = 'bound.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@global_time = dso_local global i64 0, align 8

; Function Attrs: noinline norecurse nounwind optnone uwtable
define dso_local i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @_Z10path_startv()
  %5 = call i32 @rand() #3
  store i32 %5, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = srem i32 %6, 10
  %8 = sub nsw i32 %7, 2
  store i32 %8, i32* %3, align 4
  br label %9

9:                                                ; preds = %23, %0
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, i32* %3, align 4
  %14 = icmp eq i32 %13, 9
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @_Z9path_goalv()
  br label %16

16:                                               ; preds = %15, %12
  %17 = load i32, i32* %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %3, align 4
  %19 = load i32, i32* %3, align 4
  store volatile i32 %19, i32* %4, align 4
  %20 = load volatile i32, i32* %4, align 4
  %21 = icmp eq i32 %20, 13
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  call void @_Z12path_nongoalv()
  br label %23

23:                                               ; preds = %22, %16
  br label %9

24:                                               ; preds = %9
  %25 = load i32, i32* %1, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z10path_startv() #0 {
  %1 = call i64 @time(i64* @global_time) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z9path_goalv() #0 {
  %1 = call i64 @time(i64* @global_time) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z12path_nongoalv() #0 {
  %1 = call i64 @time(i64* @global_time) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"Ubuntu clang version 10.0.1-++20201013091236+ef32c611aa2-1~exp1~20201013191834.199"}
!1 = !{i32 1, !"wchar_size", i32 4}
