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
## @deftypefn {} {@var{retval} =} VectorNewton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-10-11

function [x0, n] = VectorNewton (F, x0, tol, itmax)
  n = 0;
  h = 10^-5;
  F0 = F(x0);
  while norm(F0) > tol && n < itmax
    J = Jacobi(F, x0);
    [U, bt] = MyGaussPivot(J, F0);
    d = Backward(U, bt);
    x0 = x0 - d;
    F0 = F(x0);
    n = n + 1;
  endwhile
endfunction
