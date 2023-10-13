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
## @deftypefn {} {@var{retval} =} FaktorisasiLUPivot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-09-11

function [L, U, p] = FaktorisasiLUPivot (A)
  [n, n] = size(A);
  L = eye(n);
  p = 1:n;
  for i=1:n-1
    [x, k] = max(abs(A(i:n,i)));
    k = k + i - 1;
    A([i k], :) = A([k i], :);
    L([i k], 1:i-1) = L([k i], 1:i-1);
    p([i k]) = p([k i]);
    for j=i+1:n
      r = A(j,i)/A(i,i);
      L(j,i) = r;
      A(j,:) = A(j,:) - r*A(i,:);
    endfor
  endfor
  U = A(1:n,1:n);
endfunction
