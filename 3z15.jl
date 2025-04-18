using CairoMakie
function ramp_wave_bl(t::Real, A::Real, T::Real, B::Real)::Float64
    if A <= 0 || T <= 0 || B <= 0
        error("Parametry A, T, B muszą być dodatnie")
    end
    t_mod = mod(t, T)
    return (A / T) * t_mod
end

using Plots

A = 1.0     # amplituda
T = 1.0     # okres
B = 20.0    # szerokość pasma (Hz)

ramp = t -> ramp_wave_bl(t, A, T, B)

t_vals = 0:0.001:3
y_vals = [ramp(t) for t in t_vals]

f = Figure()
Axis(f[1, 1], title="Fala impulsowa z ograniczonym pasmem",
     xlabel="Czas [s]", ylabel="Amplituda")

lines!(t_vals, y_vals, color=:blue)
save("rampbl.png", f)