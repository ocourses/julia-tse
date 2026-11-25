using Suppressor
@suppress begin
    using Pkg
    Pkg.activate(@__DIR__)
    Pkg.instantiate()
    include(joinpath(@__DIR__, "..", "assets", "julia", "myshow.jl"))
    using Markdown
    using QuizQuestions
end
nothing