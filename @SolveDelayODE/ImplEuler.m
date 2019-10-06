function y = ImplEuler(obj)
    y = obj.y;
    bounds = [obj.timespan(1); obj.timespan(end)];
    for n=1:length(y)-1
        z = find_retarded_t(obj, y, n);
        fun = @(x)implFunc(y, x, obj, z, n);
        y(:, n+1) = fsolve(fun, bounds);
    end
end

function delta = implFunc(y, ynn, obj, z, n)
    delta = y(:, n)+ obj.h*obj.retarded_func(ynn, z) - ynn;
end