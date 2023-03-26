# Norganic 

> Your solvent-free Norg compiler.

`norganic` is a frontend to [Norg.jl](https://github.com/Klafyvel/Norg.jl/), a [norg](https://github.com/nvim-neorg/norg-specs/) parser. It allows compiling `.norg` files to various target formats.

Install `norganic` now by downloading the [latest version](https://github.com/Klafyvel/norganic/releases/latest). Alternatively, see the [compile from sources](#compile-from-sources) section.

## Usage

`norganic` input/output defaults to `stdin` and `stdout`. You can decide to specify input/output files using `--input`/`--output`.

```bash
norganic html --input 1.0-specification.norg --output 1.0-specification.html
norganic json --input 1.0-specification.norg | pandoc -f json -t html -o 1.0-specification.html
```

## Compile from sources

You need Julia on your operating system. If you don't already have Julia installed, consider using [juliaup](https://github.com/JuliaLang/juliaup).

You can then use the provided `Makefile`.

```bash
make # Compile the app to build/norganic
make archive # Create a tarball for the app
make comonicon # Create a launchable script in ~/.julia/bin
make compost # Compost the repository
```
