using LinearAlgebra

function dft(x::AbstractVector)::Vector
    N=length(x)
    Z=[cispi(-2*n/N) for n in 0:(N-1)]
    [sum((x[n+1]*Z[(n*f)%N+1] for n in 0:(N-1))) for f in 0:(N-1)]
end

function freq2index(f,N,fp)
    k=f*N/fp
    return Int(round(mod(k,N)))+1
end