import Pkg
Pkg.add("SpecialFunctions")

#prostokatne
function rectangular_window(N::Int)
    return ones(N)
end
#trojkatne
function triangular_window(N::Int)
    return [1 - abs((n - (N - 1) / 2) / ((N - 1) / 2)) for n in 0:N-1]
end

#hanning 
function hann_window(N::Int)
    return [0.5 * (1 - cos(2π * n / (N - 1))) for n in 0:N-1]
end

#hamming
function hamming_window(N::Int)
    return [0.54 - 0.46 * cos(2π * n / (N - 1)) for n in 0:N-1]
end

#blackman
function blackman_window(N::Int)
    return [0.42 - 0.5 * cos(2π * n / (N - 1)) + 0.08 * cos(4π * n / (N - 1)) for n in 0:N-1]
end



using CairoMakie

N = 64
a=60
b=8.5
w_rect = rectangular_window(N)
w_tri = triangular_window(N)
w_hann = hann_window(N)
w_hamming = hamming_window(N)
w_blackman = blackman_window(N)
w_chebwin = chebwin(N,a)

fig = Figure()
ax = Axis(fig[1, 1], title="Porównanie okien", xlabel="n", ylabel="Wartość")

lines!(ax, 0:N-1, w_rect, label="Prostokątne")
lines!(ax, 0:N-1, w_tri, label="Trójkątne")
lines!(ax, 0:N-1, w_hann, label="Hann")
lines!(ax, 0:N-1, w_hamming, label="Hamming")
lines!(ax, 0:N-1, w_blackman, label="Blackman")

axislegend(ax)
save("windows.png",fig)
