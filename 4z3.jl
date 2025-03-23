function energy(x)
    return sum(abs2.(x))
end

function power(x)
    return energy(x)/length(x)
end

function rms(x)
    return sqrt(power(x))
end

function running_mean(x, M)
    N = length(x)
    y = similar(x)
    for n in 1:N
        start = max(1, n - M)
        end = min(N, n + M)
        y[n] = mean(x[start:end])
    end
    return y
end



e1=[1.34,2.34,0.763]
println(energy(e1))
println(power(e1))
println(rms(e1))
e2=[3+4im,7-6im,-2.45+5.64im]
println(energy(e2))
println(power(e2))
println(rms(e2))