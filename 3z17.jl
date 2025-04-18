using CairoMakie

function triangular_wave_bl(t, A, T, B)
    if A <= 0 || T <= 0 || B <= 0
        error("A, T, B must be positive")
    end

    f0 = 1 / T
    N = floor(Int, B / f0)

    sum = 0.0
    for n in 1:2:N*2   # tylko nieparzyste: 1, 3, 5, ...
        sum += ((-1)^((n - 1) ÷ 2)) * sin(2π * n * f0 * t) / (n^2)
    end

    return (8 * A / π^2) * sum
end



A = 1.0       # amplituda
T = 1.0       # okres
B = 10.0      # szerokość pasma (Hz)

# Wygeneruj dane czasowe i odpowiadające wartości funkcji
t_vals = range(0, stop=2T, length=1000)
y_vals = [triangular_wave_bl(t, A, T, B) for t in t_vals]

# Tworzenie wykresu
f = Figure()
Axis(f[1, 1], title="Fala trojkatna z ograniczonym pasmem",
     xlabel="Czas [s]", ylabel="Amplituda")

lines!(t_vals, y_vals, color=:blue)
save("trianglebl.png", f)