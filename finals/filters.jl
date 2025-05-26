
using LinearAlgebra
# FILTRY
function kronecker(n::Int64)::Float64
    ifelse(n == 0, 1, 0)
end

function fdp(order, f0)::Vector
    [2*f0*sinc(2*f0*n) for n in -order÷2:order÷2]
end

function fgp(order, f0)::Vector
    [kronecker(n) - 2*f0*sinc(2*f0*n) for n in -order÷2:order÷2]
end

function fpp(order, f1, f2)::Vector #pasmowoprzepustowy
    [2*f2*sinc(2*f2*n) - 2*f1*sinc(2*f1*n) for n in -order÷2:order÷2]
end

function fbz(order, f1, f2)::Vector #pasmowozaporowy 
    [kronecker(n) - (2*f2*sinc(2*f2*n) - 2*f1*sinc(2*f1*n)) for n in -order÷2:order÷2]
end

# OKNA
function triang(M::Integer)::AbstractVector{<:Real} 
    [1 - abs(n) / (M + 1) for n = -M:M]
end
function hanning(M)::Vector{Float64}
    [0.5 * (1 + cos(2*pi*n/(2*M + 1))) for n in -M:M]
end

function hamming(M)::Vector{Float64}
    [0.54 - 0.46*cos(2*pi*n/(2*M + 1)) for n in -M:M]
end

function blackman(M)::Vector{Float64}
    [0.42 - 0.5*cos(2*pi*n/(2*M + 1)) + 0.08*cos(4*pi*n/(2*M + 1)) for n in -M:M]
end

# ZADANIA (numeracja jak w dysku)
begin
    function zadanie1(; order::Int = 30, fp::Float64 = 192.0, f0::Float64 = 49.92, z::Vector{Int} = [1, 10, 1, 19, 21])
        h = fgp(order, f0 / fp)                            # filtr: 31 próbek
        w = hanning(Int(order ÷ 2))                        # okno: też 31 próbek (M=15)
        h = h .* w                                         # zastosowanie okna
        h_z = [h[i] for i in z]                            # indeksowanie (zakładamy że i w z <= 31)
        return sum(h_z)
    end

    function zadanie18(; #fpp i hamming 
    order::Int = 38,
    fp::Float64 = 190.0,
    f1::Float64 = 37.05,
    f2::Float64 = 69.35,
    z::Vector{Int} = [15, 17, 11, 19, 25, 13],
    )
        h=fpp(order,f1/fp,f2/fp)
        w= hamming(Int(order÷2))
        h=h.*w
        h_z= [h[i] for i in z]
        return sum(h_z)
    end 
    function zadanie33(;
        order::Int = 30,
        fp::Float64 = 199.0,
        f0::Float64 = 61.69,
        z::Vector{Int} = [3, 9, 25, 10, 3, 18],
    )
        h=fgp(order,f0/fp)
        w=hamming(Int(order÷2))
        h=h.*w
        h_z= [h[i] for i in z]
        return sum(h_z)
    end
    function zadanie44(;
    order::Int = 80,
    fp::Float64 = 196.0,
    f1::Float64 = 64.68,
    f2::Float64 = 80.36,
    z::Vector{Int} = [7, 10, 13, 47],
    )
        h=fbz(order,f1/fp,f2/fp)
        w=triang(Int(order÷2))
        h=h.*w
        h_z=[h[i] for i in z]
        return sum(h_z)
    end
    function zadanie50(;
    order::Int = 52,
    fp::Float64 = 191.0,
    f0::Float64 = 82.13,
    z::Vector{Int} = [31, 22, 39, 34, 44, 34],
    )
        h=fgp(order,f0/fp)
        w=hamming(Int(order÷2))
        h=h.*w
        hsum=[h[i] for i in z]
        return sum(hsum)
    end

    out1 = zadanie1()
    println("Wynik: ", out1) #0.06181728496969079 
    out18 = zadanie18()
    println("wynik ", out18) #0.006039123315957948
    out33 = zadanie33()
    println("zadanie 33: ",out33) #0.023380779440447374
    out44 = zadanie44()
    println("zadanie 44: ",out44) #-0.006724205309096825
    out50 = zadanie50()
    println("zadanie 50: ",out50) #-0.02266955386765545
end