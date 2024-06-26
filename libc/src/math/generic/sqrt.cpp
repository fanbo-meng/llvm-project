//===-- Implementation of sqrt function -----------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/math/sqrt.h"
#include "src/__support/FPUtil/sqrt.h"
#include "src/__support/common.h"

namespace LIBC_NAMESPACE {

LLVM_LIBC_FUNCTION(double, sqrt, (double x)) { return fputil::sqrt<double>(x); }

} // namespace LIBC_NAMESPACE
