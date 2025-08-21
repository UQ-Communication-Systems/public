function v = read_complex_byte(filename, count)
%% usage: read_complex_byte (filename, [count])
%%
%%  open filename and return the contents as a column vector,
%%  reading 8bit unsigned, and treating them as doubles (and normalizing
%% to (+/- 1)
%%

% if ((m = nargchk (1,2,nargin)))
%   usage (m);
% endif;

% Maximum magnitude of a signed integers of different sizes
MAXI8Q7 = 2^7;

if (nargin < 2)
count = Inf;
end;

f = fopen(filename, 'rb');
if (f < 0)
v = 0;
else
t = fread (f, [2, count], 'uint8=>double');
fclose (f);
v = t(1,:)-(MAXI8Q7-1) + (t(2,:)-(MAXI8Q7-1))*1i;
v = v / MAXI8Q7;
[r, c] = size (v);
v = reshape (v, c, r);
end;
