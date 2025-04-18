using CairoMakie

function pulse_wave_bl(t, A, T, B,p)
    if A <= 0 || T <= 0 || B <= 0 || p<0 || p>1
        error("A, T, B must be positive and p must be in (0,1)")
    end

    f0 = 1 / T
    N = floor(Int, B / f0)

    sum = 0.0
    for n in 1:2:N*2  
        coeff = (2A / (n * π)) * sin(n * π * p)
        sum += coeff*cos(2π * n * f0 * t)
    end

    return sum
end



A = 1.0       # amplituda
T = 1.0       # okres
B = 10.0      # szerokość pasma (Hz)
p=0.25

# Wygeneruj dane czasowe i odpowiadające wartości funkcji
t_vals = range(0, stop=2T, length=1000)
y_vals = [pulse_wave_bl(t, A, T, B,p) for t in t_vals]

# Tworzenie wykresu
f = Figure()
Axis(f[1, 1], title="Fala impulsowa z ograniczonym pasmem",
     xlabel="Czas [s]", ylabel="Amplituda")

lines!(t_vals, y_vals, color=:blue)
save("pulsebl.png", f)

