using DataFrames
using CategoricalArrays
using StatsBase
using Statistics
using DataStructures

# Optional: Embedded R within Julia
# using RCall
# @rlibrary ggplot2

# Optional: Revise.jl tracks files and updates methods upon file writes
# using Revise
# includet(YourJuliaSourceFile.jl)

# ------------------------------------------------------------------------------
# Arrays
# ------------------------------------------------------------------------------
# Arrays are mutable and passed by reference.
Array{Char}(undef, 2, 3, 4) # uninitialized 2x3x4 array of Chars
a = [1,2]
a[1] # first element of array (1-based indexing)
a[end] # get last element of array
firstindex(a)
lastindex(a)

ndims(a) # number of dimensions
eltype(a) # type of elements in array
length(a) # number of elements in array
size(a) # dimensions of array as a tuple

zeros(2) # Float64 zeros
ones(2) # Float64 ones
trues(2)
falses(2)

r = range(0, stop = 1, length = 11)
collect(r) # converts iterator to array
collect(1:2:9)

reshape(1:6, 2, 3) # reshapes array into a 2x3 matrix, filled column-wise
fill("a", 2, 2)

[x*y for x in 1:2, y in 1:3] # list comprehension

# start:step:end
for i in 0:0.1:1
    println(i)
end

# ------------------------------------------------------------------------------
# DataFrames.jl package
# ------------------------------------------------------------------------------
df = DataFrame(A = 1:10, B = rand(10))
describe(df)
names(df)
nrow(df)
ncol(df)
push!(df, (50, 40.1))
rename!(df, :A => :A_new)
select!(df, Not(:A_new)) # remove column A
delete!(df, 1:4) # remove rows 1 through 4

df = DataFrame(A = 1:10, B = rand(10))
sort!(df, [order(:B), order(:A)]) # sort by A, then by B

filter(row -> row.A > 3, df)
df[df.A .> df.B, :]
df[(df.A .> 3) .& (df.A .< 5), :]
[mean(col) for col in eachcol(df)]
mean.(eachcol(df))

# ------------------------------------------------------------------------------
# Dictionaries
# ------------------------------------------------------------------------------
Dict{Char, Int}()
D = Dict("a"=>1, "b"=>2)
haskey(D, "b")
keys(D)
values(D)
delete!(D, "b")
get(D, "c", "default_value_if_no_c")

# ------------------------------------------------------------------------------
# Strings
# ------------------------------------------------------------------------------
"Hello" * ", world!" # string concatenation
string("Answer to the universe is ", 42)
occursin("cd", "abcd")
chop("testing") # removes last character of string and returns a SubString

# Regular expressions
r = r"A|B"
occursin(r, "CD") # false
match(r, "ACBD")

# ------------------------------------------------------------------------------
# Types
# ------------------------------------------------------------------------------
# var::TypeName # type annotation

# Type declaration; structs are immutable!
struct Person
    name::String
    age::UInt16
end

bob = Person("Bob", 30) # type instantiation

# Mutable type declaration
mutable struct Programmer
    name::String
    age::UInt16
    drinks_coffee::Bool
end

# Subtype declaration
abstract type SuperType end
struct SubType <: SuperType
    name::String
end

# Parametric types
struct Point{T <: Real}
    x::T
    y::T
end
p = Point{Float64}(1,2)

Union{Int, String} # Union types

fieldnames(Person)
Person.types # field types

('a', false)::Tuple{Char, Bool} # tuple type assertion
namedtuple = (p=1, q=2, r=3)
typeof(namedtuple)
