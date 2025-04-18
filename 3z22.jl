function kronecker(n)
    return n == 0 ? 1.0 : 0.0
end

using CairoMakie

n_vals = -10:10
y_vals = [kronecker(n) for n in n_vals]

fig = Figure()
Axis(fig[1, 1], title="Delta Kroneckera", xlabel="n", ylabel="δ(n)")
scatter!(n_vals, y_vals, color=:red, markersize=12)
save("kronecker.png", fig)