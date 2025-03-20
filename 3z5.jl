function ci_literka_M(t,T)

    if (T<0)
        println("T musi byc dodatnie")
    end
    if abs(t) > T / 2
        return 0.0
    elseif t < 0
        return 1 - (2 * abs(t + T / 4) / (T / 2))
    else
        return 1 - (2 * abs(t - T / 4) / (T / 2))
    end
end

x=ci_literka_M(0.0,1.0) #0
y=ci_literka_M(0.25,2.2) #0.45
println(x)
println(y)