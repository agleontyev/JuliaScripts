
using CSV,Glob, DataFrames

#path = raw"C:\Users\agleo\Documents\Programming_projects\competitions and hackathons\DataScienceComp"
path = raw"C:\Users\agleo\Documents\Programming_projects\TAMU\final analysis mturk\Mouse\final_mturk_mouse"

files = glob("*.csv", path)

dfs = DataFrame.(CSV.File.(files))

#for i in 1:length(dfs)
#    dfs[i][!, :identity_col] .= i # I called the new col sample
#end


holder = nothing
for (ctr, df) in enumerate(dfs)
    for c in 1:ncol(df)
        col = df[!, c]
        @assert length(col) == nrow(df)
        for r in 1:nrow(df)
            try
                global holder = col[r]
            catch
                @show c, r
                @show ctr
                error()
            end
        end
    end
end

#first(dfs[19])


#x = dfs[19]

#println(x[!,12])

#println(x[!,"participant"])

#(propertynames(x))[12]
#df = reduce(vcat,dfs, cols = :union)



#dfwrong = dfs[291]

#first(dfwrong)
