warning off;
A = eye(8);
b = [2*pi;2*pi;2*pi;2*pi;2*pi;2*pi;2*pi;2*pi];
options = gaoptimset('PopulationSize',2000,'EliteCount',200,'CrossoverFraction',0.85,'Generations',50,'StallGenLimit',60,'TolFun',1e-6,'PlotFcns',{@gaplotbestf,@gaplotbestindiv});
[x fval] = ga(@deco_opt, 8, [], [], [], [], zeros(8,1),b, [], options)