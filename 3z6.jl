function ci_literka_U(t,T)

    if (T<0)
        println("T must be positive")
    end
    if abs(t) > T / 2
        return 0.0
    elseif t < 0
        return (2 * abs(t + T / 4) / (T / 2))
    else
        return (2 * abs(t - T / 4) / (T / 2))
    end
end

x=ci_literka_U(0.0,1.0) #1
y=ci_literka_U(0.25,2.2) #0.54
println(x)
println(y)