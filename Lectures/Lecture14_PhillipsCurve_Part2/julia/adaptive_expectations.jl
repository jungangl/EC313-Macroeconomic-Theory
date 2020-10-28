using Plots, Distributions

function simul_pi(θ, T)
    mz = 0.0
    α = 0.55
    ut = 0.06rand(T + 1) - 0.03
    πt = zeros(T + 1)
    for t in 2:T + 1
        πt[t] = θ * πt[t - 1] + mz - α * ut[t]
    end
    return πt
end

πt = simul_pi(1., 100)
gr()
p = plot(100 .* πt, legend = false, grid = false, ylabel = "Inflation Rate %", xlabel = "Time", lw = 3, color = :black)
savefig(p, "theta1")
