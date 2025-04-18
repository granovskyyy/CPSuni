function pulse_wave(t::Real, ρ::Real)::Float64
    if ρ < 0 || ρ > 1
        error("Współczynnik wypełnienia ρ musi być w przedziale [0, 1]")
    end
    t_mod = mod(t, 1.0)  # okres 1 sekunda
    if 0.0 < t_mod < ρ
        return 1.0
    else
        return 0.0
    end
end

for i in -2:0.1:2
    println(pulse_wave(i,0.5))
end