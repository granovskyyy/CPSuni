function peak2peak(x)
    return maximum(x)-minimum(x)
end

v=[1.0,0.368,4.23,3.623]
println(peak2peak(v))