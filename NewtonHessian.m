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
## @deftypefn {} {@var{retval} =} NewtonHessian (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-11-01

function [x0, it] = NewtonHessian (f, x0, tol, itmax)
  g0 = grad(f, x0);
  it = 0;
  while norm(g0) > tol && it < itmax
    H = HessianWithGrad(f, x0);
    [U, bt] = MyGaussPivot(H, -g0);
    d = Backward(U, bt);
    x0 = x0 + d;
    g0 = grad(f, x0);
    it += 1;
  endwhile
endfunction
