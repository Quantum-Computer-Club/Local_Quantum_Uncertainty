function q = deco_opt(s)

d = 3;
rho0 = 1/3*[1;0;0;0;1;0;0;0;1]*[1;0;0;0;1;0;0;0;1]';
q1=2;q2=1;
t = 0.9;
        m1=sqrt(1-(1-exp(-q1*t)));
    n1=sqrt(1-exp(-q1*t));
            m2=sqrt(1-(1-exp(-q2*t)));
    n2=sqrt(1-exp(-q2*t));
E(:,:,1)=[1,0,0;0,m1,0;0,0,m1];
E(:,:,2)=[0,n1,0;0,0,0;0,0,0];
E(:,:,3)=[0,0,0;0,0,0;0,0,n1];
F(:,:,1)=[1,0,0;0,m2,0;0,0,m2];
F(:,:,2)=[0,n2,0;0,0,0;0,0,0];
F(:,:,3)=[0,0,0;0,0,0;0,0,n2];
rho=zeros(9);
for y=1:1:3
    for x=1:1:3
        rho=rho + kron(F(:,:,x),E(:,:,y))*rho0*kron(F(:,:,x),E(:,:,y))';
    end
end

spectrum = diag([-1 0 1]);


U = productor(d,1,2,s(1),s(2),s(3))*productor(d,2,3,s(4),s(5),0)*productor(d,1,3,s(6),s(7),s(8));

operator = kron(U*spectrum*U',eye(d));
q = real(trace(operator*operator*rho - sqrtm(rho)*operator*sqrtm(rho)*operator));

end

