function ci_triangular(t,T)

    if (T<0)
        println("T musi byc dodatnie")
    end
    return abs(t) <=T/2 ? 1 - (2*abs(t)/T) : 0.0
end

x=ci_triangular(0.0,1.0)
println(x)