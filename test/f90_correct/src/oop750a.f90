! Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.

! Same as oop750 but has multiple mold= allocations.

program p
  logical rslt(2),expect(2)
  integer, allocatable :: a(:), b(:)
  integer :: c(10)

  c = 101
  allocate(a(10), b(21:30), mold=101)

  rslt(1) = size(a,1) .eq. size(c,1) 
  rslt(2) = size(b,1) .eq. size(c,1) 

  expect = .true.
  call check(rslt,expect,2)


  end
