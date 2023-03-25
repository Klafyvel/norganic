module Norganic

using Norg, Comonicon, JSON

"""
Convert Norg to HTML.
"""
@cast html(;input=stdin, output=stdout) = _html(input, output)

function _html(input::IO, output::IO)
    s = read(input, String)
    res = norg(HTMLTarget(), s)
    write(output, s)
end

function _html(input::IO, output::String)
    io_out = open(output, "w")
    res = _html(input, io_out)
    close(io_out)
    res
end

function _html(input::String, output::IO)
    io_in = open(input, "r")
    res = _html(io_in, output)
    close(io_in)
    res
end

function _html(input::String, output::String)
    io_in = open(input, "r")
    res = _html(io_in, output)
    close(io_in)
    res
end

"""
Convert Norg to Pandoc JSON.
"""
@cast json(;input=stdin, output=stdout) = _json(input, output)

function _json(input::IO, output::IO)
    s = read(input, String)
    res = norg(JSONTarget(), s)
    JSON.print(output, res)
end

function _json(input::IO, output::String)
    io_out = open(output, "w")
    res = _json(input, io_out)
    close(io_out)
    res
end

function _json(input::String, output::IO)
    io_in = open(input, "r")
    res = _json(io_in, output)
    close(io_in)
    res
end

function _json(input::String, output::String)
    io_in = open(input, "r")
    res = _json(io_in, output)
    close(io_in)
    res
end

"""
Your solvent-free Norg compiler.
"""
@main

end
