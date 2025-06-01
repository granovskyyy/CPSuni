using LinearAlgebra

function ltifilter(b::Vector, a::Vector, x::Vector)::Vector
    N=length(x)
    M=length(b)-1
    K=length(a)-1
    y=zeros(Float64,N)

    for n in 1:N
        for k in 0:M
            if n-k >0 
                y[n] += b[k+1]* x[n-k]
            end
        end
        for k in 1:K
            if n-k>0
                y[n] -= a[k+1]* y[n-k]
            end
        end
    end
    return y 
end

function ltiamp(f::Real,b::Vector,a::Vector)::Real
    M=length(b)
    K=length(a)
    num = sum(b[m+1]*cispi(-2*f*m) for m in 0:M-1)
    denom = sum(a[k+1]*cispi(-2*f*k) for k in 0:K-1)
    gain= num/denom
    return abs(gain)
end

function ltiphase(f::Real,b::Vector,a::Vector)::Real
    M=length(b)
    K=length(a)
    num = sum(b[m+1]*cispi(-2*f*m) for m in 0:M-1)
    denom = sum(a[k+1]*cispi(-2*f*k) for k in 0:K-1)
    gain= num/denom
    return angle(gain)
end