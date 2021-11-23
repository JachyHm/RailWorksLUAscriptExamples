function DebugScope()
    local inf = io.open("scope.in", "rb");
    if (not inf) then
        return;
    end
    inf:close();
    local outs = "";
    for val in io.lines("scope.in") do
        local tbl = Split(val, "%.");
        if (_G[tbl[1]] ~= nil) then
            if (table.getn(tbl) > 1) then
                local tmp = _G[tbl[1]];
                tbl[1] = nil;
                for _, child in pairs(tbl) do
                    tmp = tmp[child];
                end
                outs = outs..val.." - "..tostring(tmp).."\n";
            else
                outs = outs..val.." - "..tostring(_G[val]).."\n";
            end
        else
            outs = outs..val.." - nil\n";
        end
    end
    local outf = assert(io.open("scope.out", "w"));
    outf:write(outs);
    outf:close();
end

function Split(s, delimiter, asName)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(s, delimiter, from)
	while delim_from do
        local str = string.sub(s, from, delim_from-1)
        if (asName) then
            result[str] = true
        else
            table.insert(result, str)
        end
        from = delim_to + 1
        delim_from, delim_to = string.find(s, delimiter, from)
    end
    local str = string.sub(s, from)
    if (asName) then
        result[str] = true
    else
        table.insert(result, str)
    end
    return result
end