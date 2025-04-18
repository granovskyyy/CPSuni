function heavside(n)
    return n < 0 ? 0 : 1
end

using CairoMakie

n_vals = -10:10
y_vals = [heavside(n) for n in n_vals]

fig = Figure()
Axis(fig[1, 1], title="Funkcja skokowa Heavside'a", xlabel="n", ylabel="H(n)")
scatter!(n_vals, y_vals, color=:red, markersize=12)
save("heavside.png", fig)