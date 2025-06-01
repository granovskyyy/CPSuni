using LinearAlgebra

function conv(f::AbstractVector, g::AbstractVector)::Vector
    n=length(f)
    m=length(g)
    y=zeros(eltype(f),n+m-1)
    for i in 1:n
        for j in 1:m
            y[i+j-1] += f[i]*g[j]
        end
    end
    return y 
end