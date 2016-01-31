function E = productor(d, i, j, phi, psi, kai)
E = zeros(d,d);
for k = 1:d
    if k ~= i && k ~= j
        E(k,k) = 1;
    end
end
E(i,i) = cos(phi)*exp(1i*psi);
E(i,j) = sin(phi)*exp(1i*kai);
E(j,i) = -sin(phi)*exp(-1i*kai);
E(j,j) = cos(phi)*exp(-1i*psi);
end