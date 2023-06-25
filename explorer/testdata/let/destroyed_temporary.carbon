// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// CHECK:STDOUT: Destructor
// CHECK:STDOUT: 0: Heap{}, 1: !!C{}
// CHECK:STDOUT: result: 0

package ExplorerTest api;

class C {
  destructor[self: Self] {
    Print("Destructor");
  }
}

fn Foo(c: C) {
}

fn Main() -> i32 {
  Foo({});
  heap.PrintAllocs();
  return 0;
}
