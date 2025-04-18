using CairoMakie

function square_wave_bl(t, A, T, B)
    if A <= 0 || T <= 0 || B <= 0
        error("A, T, B must be positive")
    end

    f0 = 1 / T
    N = floor(Int, B / f0)

    sum = 0.0
    for n in 1:2:N*2  
        sum += sin(2π * n * f0 * t) /n
    end

    return 4*A/pi * sum
end



A = 1.0       # amplituda
T = 1.0       # okres
B = 10.0      # szerokość pasma (Hz)

# Wygeneruj dane czasowe i odpowiadające wartości funkcji
t_vals = range(0, stop=2T, length=1000)
y_vals = [square_wave_bl(t, A, T, B) for t in t_vals]

# Tworzenie wykresu
f = Figure()
Axis(f[1, 1], title="Fala prostokatna z ograniczonym pasmem",
     xlabel="Czas [s]", ylabel="Amplituda")

lines!(t_vals, y_vals, color=:blue)
save("squarebl.png", f)

