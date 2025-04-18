function impulse_repeater(g::Function,t1::Real,t2::Real)
    T=t2-t1
    if T<=0
        error("T2<T1, it wont work")
    end

    f = t-> begin 
    t_mod=mod(t-t1,T)+1
    return g(t_mod)
end

    return f
    
end

g= t-> abs(t-2)
f=impulse_repeater(g,-1,1)


t_vals = 0:0.01:10
y_vals = [f(t) for t in t_vals]
println(y_vals)