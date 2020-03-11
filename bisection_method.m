function bisection_method
format long

function root = bisection(func, a, b, tol)
    iters = ceil(log2((b-a)/tol));
    
    f = func;
    if (f(a)*f(b) >= 0)
      disp("No real root in the interval");
      return;
    end

    for i=0:iters
      c = (a+b)/2;
      if sign(f(c)) == sign(f(a))
          a = c;
      else
          b = c;
      end
      fprintf("         %d,    %.3f   %.3f   %.5f\n",i, c, f(c), (b-a)/2^i)
    end
    root = c;
end

function [a,b] = get_root_interval(func)
    % Get the interval in which a root might exist
    a = 0;
    b = 1;
    iters = 500;
    step = 1;
    for i=1:iters
        if sign(f(a)) == sign(f(b))
            a = b;
            b = b+step;
        else
            return;
        end
    end
end


f = @(x) x.^3-x-2;
[a,b] = get_root_interval(f);
disp('      iter      root    function    error');
root = bisection(f, a, b, 10^-4);
root
if round(root,4) == 1.5214
    disp('Bisection Method working nominal');
end

end