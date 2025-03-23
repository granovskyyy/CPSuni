function mean(x)
    return sum(x)/length(x)
end

V=[1.0,2.135,4.3,0.123]
cv=[1+2im,3-4im,15im-8]
println(mean(V))
println(mean(cv))