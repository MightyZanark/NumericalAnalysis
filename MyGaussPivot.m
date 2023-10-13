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
## @deftypefn {} {@var{retval} =} MyGaussPivot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-09-11

function [U, bt] = MyGaussPivot (A, b)
  n = length(b);
  A = [A, b];

  for i=1:n-1
    [x, k] = max(abs(A(i:n,i)));
    k = k + i - 1;
    A([i k], :) = A([k i], :);
    for j=i+1:n
      m = A(j,i)/A(i,i);
      A(j,:) = A(j,:) - m*A(i,:);
    endfor
  endfor
  U = A(1:n,1:n);
  bt = A(:,n+1);
endfunction
