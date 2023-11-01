## Copyright (C) 2023 Ferry. S
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} LineBinarySearch (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-11-01

function a = LineBinarySearch (f, x0)
  a1 = 0;
  a2 = 1;
  tol = 1e-5;
  while (a2 - a1) > tol
    p = -grad(f, x0);
    x1 = x0 + a1*p;
    x2 = x0 + a2*p;
    f1 = f(x1);
    f2 = f(x2);
    if f1 < f2
      a2 = (a1 + a2)/2;
    else
      a1 = (a1 + a2)/2;
    endif
  endwhile
  a = (a1 + a2)/2;
endfunction
