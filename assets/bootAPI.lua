local imports = {
    "germshire.germserv.net:5000/mineForward.lua",
    "germshire.germserv.net:5000/mineCommand.lua",
}

function runImports()
    for key, link in ipairs(imports) do
        wget link
    end     
end

function bindImports()
    runImports()

    -- add imports to api
end



