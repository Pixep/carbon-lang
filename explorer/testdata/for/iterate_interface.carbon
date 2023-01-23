// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// RUN: %{explorer-run}
// RUN: %{explorer-run-trace}

package ExplorerTest api;

class MyIntContainer {
  fn Size[self: Self]() -> i32 {
      return 4;
  }
  fn GetValue[self: Self](i: i32) -> i32 {
    return i;
  }
  impl as Iterate where .ElementType = i32 and .CursorType = i32 {
    fn NewCursor[self: Self]() -> i32 { return 0; }
    fn Next[self: Self](cursor: i32*) -> Optional(i32) {
      // Advance and return value, or return empty
      if (*cursor < self.Size()) {
        let index: i32 = *cursor;
        *cursor = index + 1;
        return Optional(i32).Create(self.GetValue(index));
      } else {
        return Optional(i32).CreateEmpty();
      }
    }
  }
}

fn Main() -> i32 {
  var container: MyIntContainer;
  for (x: i32 in container) {
    Print("{0}", x);
  // CHECK:STDERR: COMPILATION ERROR: {{.*}}/explorer/testdata/for/iterate_interface.carbon:[[@LINE+1]]: expected array type after in, found value of type class MyIntContainer
  }
  return 0;
}
