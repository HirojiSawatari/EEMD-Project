% This is a utility program for significance test.
%
%   function [spmax, spmin, flag]= extrema(in_data)
%
% INPUT:
%       in_data: Inputted data, a time series to be sifted;
% OUTPUT:
%       spmax: The locations (col 1) of the maxima and its corresponding
%              values (col 2)
%       spmin: The locations (col 1) of the minima and its corresponding
%              values (col 2)
%
% References can be found in the "Reference" section.
%
% The code is prepared by Zhaohua Wu. For questions, please read the "Q&A" section or
% contact
%   zhwu@cola.iges.org
%
function [spmax, spmin, flag]= extrema(in_data)

flag=1;
dsize=length(in_data);

spmax(1,1) = 1;
spmax(1,2) = in_data(1);
jj=2;
kk=2;
while jj<dsize,
    if ( in_data(jj-1)<=in_data(jj) & in_data(jj)>=in_data(jj+1) )
        spmax(kk,1) = jj;
        spmax(kk,2) = in_data (jj);
        kk = kk+1;
    end
    jj=jj+1;
end
spmax(kk,1)=dsize;
spmax(kk,2)=in_data(dsize);

if kk>=4
    slope1=(spmax(2,2)-spmax(3,2))/(spmax(2,1)-spmax(3,1));
    tmp1=slope1*(spmax(1,1)-spmax(2,1))+spmax(2,2);
    if tmp1>spmax(1,2)
        spmax(1,2)=tmp1;
    end

    slope2=(spmax(kk-1,2)-spmax(kk-2,2))/(spmax(kk-1,1)-spmax(kk-2,1));
    tmp2=slope2*(spmax(kk,1)-spmax(kk-1,1))+spmax(kk-1,2);
    if tmp2>spmax(kk,2)
        spmax(kk,2)=tmp2;
    end
else
    flag=-1;
end


msize=size(in_data);
dsize=max(msize);
xsize=dsize/3;
xsize2=2*xsize;

spmin(1,1) = 1;
spmin(1,2) = in_data(1);
jj=2;
kk=2;
while jj<dsize,
    if ( in_data(jj-1)>=in_data(jj) & in_data(jj)<=in_data(jj+1))
        spmin(kk,1) = jj;
        spmin(kk,2) = in_data (jj);
        kk = kk+1;
    end
    jj=jj+1;
end
spmin(kk,1)=dsize;
spmin(kk,2)=in_data(dsize);

if kk>=4
    slope1=(spmin(2,2)-spmin(3,2))/(spmin(2,1)-spmin(3,1));
    tmp1=slope1*(spmin(1,1)-spmin(2,1))+spmin(2,2);
    if tmp1<spmin(1,2)
        spmin(1,2)=tmp1;
    end

    slope2=(spmin(kk-1,2)-spmin(kk-2,2))/(spmin(kk-1,1)-spmin(kk-2,1));
    tmp2=slope2*(spmin(kk,1)-spmin(kk-1,1))+spmin(kk-1,2);
    if tmp2<spmin(kk,2)
        spmin(kk,2)=tmp2;
    end
else
    flag=-1;
end

flag=1;


