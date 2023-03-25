
// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// RUN: %{explorer-run}
// RUN: %{explorer-run-trace}
// CHECK:STDOUT: result: 1

package ExplorerTest api;

fn F(n: i32, p: i32*) -> i32 {
  *p = 2;
  return n;
}

fn Main() -> i32 {
  var k: i32 = 1;
  var j: i32 = k;
  return F(j, &k);
}
