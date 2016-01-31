function q = LQU(x)

d = 3;

% Horodeski
h = 0.61;
rho = 1/(8*h+1)*[h 0 0 0 h 0 0 0 h; 0 h 0 0 0 0 0 0 0; 0 0 h 0 0 0 0 0 0; 0 0 0 h 0 0 0 0 0; h 0 0 0 h 0 0 0 h; 0 0 0 0 0 h 0 0 0; 0 0 0 0 0 0 (1+h)/2 0 sqrt(1-h^2)/2; 0 0 0 0 0 0 0 h 0; h 0 0 0 h 0 sqrt(1-h^2)/2 0 (1+h)/2];

%Werner
% p = 0.2;
% rho = (1-p)/9*eye(d*d) + p/3*[1;0;0;0;1;0;0;0;1]*[1;0;0;0;1;0;0;0;1]';


spectrum = diag([-1 0 1]);


U = productor(d,1,2,x(1),x(2),x(3))*productor(d,2,3,x(4),x(5),0)*productor(d,1,3,x(6),x(7),x(8));

operator = kron(U*spectrum*U',eye(d));
q = real(trace(operator*operator*rho - sqrtm(rho)*operator*sqrtm(rho)*operator));

end

