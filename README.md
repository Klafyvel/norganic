# Norganic [![Build Status](https://github.com/klafyvel/Norganic.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/klafyvel/Norganic.jl/actions/workflows/CI.yml?query=branch%3Amain)

> Your solvent-free Norg compiler.

`norganic` is a frontend to [Norg.jl](https://github.com/Klafyvel/Norg.jl/), a [norg](https://github.com/nvim-neorg/norg-specs/) parser. It allows compiling `.norg` files to various target formats.

Install `norganic` now by downloading the [latest version](https://github.com/Klafyvel/norganic/releases/latest).

## Usage

`norganic` input/output defaults to `stdin` and `stdout`. You can decide to specify input/output files using `--input`/`--output`.

```bash
norganic html --input 1.0-specification.norg --output 1.0-specification.html
norganic json --input 1.0-specification.norg | pandoc -f json -t html -o 1.0-specification.html
```

