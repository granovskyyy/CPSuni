using CairoMakie
# Funkcja piłokształtna z ograniczeniem pasma
function sawtooth_wave_bl(t::Real, A::Real, T::Real, B::Real)::Float64
    if A <= 0 || T <= 0 || B <= 0
        error("Parametry A, T, B muszą być dodatnie")
    end

    f0 = 1 / T
    N = floor(Int, B / f0)

    sum = 0.0
    for n in 1:N
        sum += sin(2π * n * f0 * t) / n
    end

    return (A / 2) - (A / π) * sum
end

# Parametry fali
A = 1.0       # amplituda
T = 1.0       # okres
B = 10.0      # szerokość pasma (Hz)

# Wygeneruj dane czasowe i odpowiadające wartości funkcji
t_vals = range(0, stop=2T, length=1000)
y_vals = [sawtooth_wave_bl(t, A, T, B) for t in t_vals]

# Tworzenie wykresu
f = Figure()
Axis(f[1, 1], title="Fala piłokształtna z ograniczonym pasmem",
     xlabel="Czas [s]", ylabel="Amplituda")

lines!(t_vals, y_vals, color=:blue)
save("sawtoothbl.png", f)