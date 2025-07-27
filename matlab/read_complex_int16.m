function v = read_complex_int16(filename, count)
%% usage: read_complex_int16 (filename, [count])
%%
%%  open filename and return the contents as a column vector,
%%  reading 16bit signed, and treating them as doubles (and normalizing
%% to (+/- 1)
%%

% if ((m = nargchk (1,2,nargin)))
%   usage (m);
% endif;

% Maximum magnitude of a signed integers of different sizes
MAXI12Q11 = 2**11

if (nargin < 2)
count = Inf;
end;

f = fopen(filename, 'rb');
if (f < 0)
v = 0;
else
t = fread (f, [2, count], 'int16=>double');
fclose (f);
v = t(1,:) + (t(2,:))*1i;
v = v / MAXI12Q11;
[r, c] = size (v);
v = reshape (v, c, r);
end;
