using Documenter, PowerSystems
using Literate
const PSYPATH = dirname(pathof(PowerSystems))

# This is commented out because the output is not user-friendly. Deliberation on how to best
# communicate this information to users is ongoing.
include(joinpath(@__DIR__, "src", "generate_validation_table.jl"))

makedocs(
    modules = [PowerSystems],
    format = Documenter.HTML(),
    sitename = "PowerSystems.jl",
    authors = "Jose Daniel Lara, Daniel Thom and Clayton Barrows",
    pages = Any[ # Compat: `Any` for 0.4 compat
        "Welcome Page" => "index.md",
        "User Guide" => Any[
            "man/installation.md",
            "man/type_structure.md",
            "man/data_requirements_table.md"
        ],
        "Modeler" => Any[
            "modeler/parsing.md",
            "modeler/data.md",
        ],
        "Model Developer" => Any[
            "Adding Types" => "model_developer/adding_types.md",
            "Extending Parsing" => "model_developer/extending_parsing.md",
        ],
        "Developer" => Any[
            "Tests" => "developer/tests.md",
            "Logging" => "developer/logging.md",
            "Style Guide" => "developer/style.md",
        ],
        "API" => Any[
            "DynamicStructs" => "api/DynamicsAPI.md"
            "Internal" => "api/Internal.md"
        ]
    ]
)

deploydocs(
    repo = "github.com/NREL-SIIP/PowerSystems.jl.git",
    target = "build",
    branch = "gh-pages",
    devbranch = "master",
    devurl = "dev",
    versions = ["stable" => "v^", "v#.#"],
)
