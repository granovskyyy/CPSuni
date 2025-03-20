function ci_rectangular(t,T)

    if (T<0)
        println("T musi byc dodatnie")
    end
    return abs(t) <=T/2 ? 1.0 : 0.0
end

x=ci_rectangular(0.0,1.0)
println(x)