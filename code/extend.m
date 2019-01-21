function t = extend(u,M,N)
[m,n]=size(u)
me=mean(mean(u))
new=me*ones(M,N)
if m<=M && n<=N
    l=floor(m/2)
    s=floor(n/2)
    L=floor(M/2)
    S=floor(N/2)
    new(L-l:L+m-l-1,S-s:S+n-s-1)=u
    t=new
else
   display("Choose greater dimensions !")
end
end
