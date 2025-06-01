using LinearAlgebra

function roots(a::AbstractVector)::Vector
    H=Matrix(I,length(a)-2, length(a)-2)
    Z=zeros(length(a)-2)
    H=vcat(Z',H)
    H=hcat(H,-1*reverse(a[2:end]))
    return eigvals(H)
end

function polyfromroots(r::AbstractVector)
    p=[1.0+0im]
    for i in eachindex(r)
        p=conv(p,[1,-r[i]])
    end
    return p
end

