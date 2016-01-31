% Calculating the generators of SU(d) group
function lambda=generator(d)
    lambda=zeros(d,d,d^2-1);
    for i=1:1:d-1
        for k=1:1:i
            lambda(k,k,i)=sqrt(2/(i*(i+1)));
        end
        lambda(i+1,i+1,i)=-i*sqrt(2/(i*(i+1)));
    end
        i=d;
        for k=1:1:d-1
            for m=k+1:1:d
                lambda(k,m,i)=1;
                lambda(m,k,i)=1;
                i=i+1;
            end
        end       
        i=(d^2+d)/2;
        for k=1:1:d-1
            for m=k+1:1:d
                lambda(k,m,i)=0+1j;
                lambda(m,k,i)=0-1j;
                i=i+1;
            end
        end       
end