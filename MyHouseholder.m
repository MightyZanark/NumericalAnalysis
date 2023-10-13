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
## @deftypefn {} {@var{retval} =} MyHouseholder (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Ferry. S <Ferry. S@DESKTOP-O4ELN0M>
## Created: 2023-10-03

function [R, bt] = MyHouseholder (A, b)
  [m, n] = size(A);
  A = [A b];

  for i=1:n
    v = A(i:m,i) + sign(A(i,i)) * norm(A(i:m,i)) * [1;zeros(m-i,1)];
    alpha = 2/(v'*v);
    for j=i:n+1
      A(i:m,j) = A(i:m,j) - (alpha * v' * A(i:m,j)) * v;
    endfor
  endfor

  R = A(:,1:n);
  bt = A(:,n+1);
endfunction
