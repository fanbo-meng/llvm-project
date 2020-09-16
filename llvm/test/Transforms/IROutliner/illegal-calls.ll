; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -verify -iroutliner -ir-outlining-no-cost < %s | FileCheck %s

; This test checks that we do not outline calls.  Special calls, such as
; indirect or nameless calls require extra handling to ensure that there
; are no inconsistencies when outlining and consolidating regions.

declare void @f1(i32*, i32*);

define void @outline_constants1() {
; CHECK-LABEL: @outline_constants1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    store i32 2, i32* [[A]], align 4
; CHECK-NEXT:    store i32 3, i32* [[B]], align 4
; CHECK-NEXT:    store i32 4, i32* [[C]], align 4
; CHECK-NEXT:    call void @f1(i32* [[A]], i32* [[B]])
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  call void @f1(i32* %a, i32* %b)
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  ret void
}

define void @outline_constants2() {
; CHECK-LABEL: @outline_constants2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[B:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[C:%.*]] = alloca i32, align 4
; CHECK-NEXT:    store i32 2, i32* [[A]], align 4
; CHECK-NEXT:    store i32 3, i32* [[B]], align 4
; CHECK-NEXT:    store i32 4, i32* [[C]], align 4
; CHECK-NEXT:    call void @f1(i32* [[A]], i32* [[B]])
; CHECK-NEXT:    call void @outlined_ir_func_0(i32* [[A]], i32* [[B]], i32* [[C]])
; CHECK-NEXT:    ret void
;
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  call void @f1(i32* %a, i32* %b)
  %al = load i32, i32* %a
  %bl = load i32, i32* %b
  %cl = load i32, i32* %c
  ret void
}
