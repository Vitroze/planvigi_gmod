function PlanVigi_Vitroze:Notify(ply, enum, time, text, soundnotify)
    net.Start("PV_Notify")
    net.WriteUInt(enum, 3)
    net.WriteUInt(time, 4)
    net.WriteString(text)
    net.WriteString(soundnotify)
    net.Send(ply)
end

function PlanVigi_Vitroze:CheckNPC(ply)
    if !IsValid(ply) then return end

    -- Check if the player is a member of the job
    if !PlanVigi_Vitroze.Config.JobConfig[team.GetName(ply:Team())] then 
        PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.2), "buttons/button10.wav")
        return  false
    end

    return true
end


local function createSavesFolders()
    if not file.Exists("planvigi", "DATA") then
        file.CreateDir("planvigi")
    end

    if not file.Exists("planvigi/npc", "DATA") then
        file.CreateDir("planvigi/npc")
    end
end

function PlanVigi_Vitroze:ToolgunSave(ply, className)
    if not IsValid(ply) and not ply:IsSuperAdmin() then return end

    local dataToSave = {}
    for _, v in pairs(ents.FindByClass(className)) do
        dataToSave[#dataToSave+1] = { pos = v:GetPos(), ang = v:GetAngles() }
    end

    if #dataToSave > 0 then
        createSavesFolders()

        local fElem = string.Replace(className, "pv_")
        local fPath = "planvigi/"..fElem.."/"..string.lower(game.GetMap())..".txt"
        file.Write(fPath, util.TableToJSON(dataToSave))

        PlanVigi_Vitroze:RespawnEntities(ply, className, true)
        PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.24), "buttons/blip1.wav")
    end
end 

local stackDeleteFiles = {}

local function fileDeleteRecursive(path, gamePath)
	if file.Exists(path, gamePath) then
		if file.IsDir(path, gamePath) then
			local files, folders = file.Find(path .. "/*", gamePath)

			for _, f in ipairs(files) do
				file.Delete(path .. "/" .. f)
			end

			for _, d in ipairs(folders) do
				stackDeleteFiles[#stackDeleteFiles+1] = path .. "/" .. d
			end

			while #stackDeleteFiles > 0 do
				local sf = table.remove(stackDeleteFiles)
				fileDeleteRecursive(sf, gamePath)
			end
		end

		file.Delete(path)
	
    end
end

function PlanVigi_Vitroze:ToolgunUnSave(ply, className)
    if not IsValid(ply) and not ply:IsSuperAdmin() then return end

    local fElem = string.Replace(className, "pv_", "")
    local fPath = "planvigi/"..fElem.."/"..string.lower(game.GetMap())..".txt"
    local found = false

    for _, v in ipairs(ents.FindByClass(className)) do
        found = true 
        v:Remove()
    end

    if found then
        fileDeleteRecursive("planvigi", "DATA")

        PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.25), "buttons/blip1.wav")
    end
end

function PlanVigi_Vitroze:RespawnEntities(ply, className, notify)
    if IsValid(ply) and not ply:IsSuperAdmin() then return end

    for _, v in ipairs(ents.FindByClass(className)) do 
        v:Remove()
    end

    local fElem = string.Replace(className, "pv_")
    local fPath = "planvigi/"..fElem.."/"..string.lower(game.GetMap())..".txt"
    local fData = util.JSONToTable(file.Read(fPath) or "")
    
    if not fData then 
        if !IsValid(ply) then return end
        PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.27), "buttons/button10.wav") 
        return 
    end

    for _, data in ipairs(fData) do 
        local pos = data.pos + Vector(0, 0, 10)
        local ent = ents.Create(className)
        ent:SetPos(pos)
        ent:SetAngles(data.ang)
        ent:Spawn()
        ent:Activate()

    end
    
    if notify then PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.26), "buttons/blip1.wav") end

end

local function InitSpawnEntities(ply)
    PlanVigi_Vitroze:RespawnEntities(ply, "pv_npc", false)
end

hook.Add("InitPostEntity", "SpawnPV_EntitiesInit", InitSpawnEntities)
hook.Add("PostCleanupMap", "SpawnPV_EntitiesCleanUp", InitSpawnEntities)

function PlanVigi_Vitroze.ExplodeExcepton(separator, str, withPattern, startRestrict, endedRestrict)
    if isstring(startRestrict) and startRestrict ~= "" then

        local tagReplace = "-|%§%|-"
        local rgxDiscard = startRestrict

        if isstring(endedRestrict) and endedRestrict ~= startRestrict and endedRestrict ~= "" then
            rgxDiscard = startRestrict .. endedRestrict
        else
            endedRestrict = startRestrict
        end

        for match in string.gmatch(str, startRestrict .. "([^" .. rgxDiscard .. "]+)" .. endedRestrict) do
            local matchClean = string.Trim(match, separator)
            local tagReplaced = string.Replace(matchClean, separator, tagReplace)
            local matchReplaced = string.Replace(match, matchClean, tagReplaced)
            str = string.Replace(str, startRestrict .. match .. endedRestrict, matchReplaced)
            str = string.gsub(str, "[" .. separator .. "]+", separator)
        end

        local tblExploded = string.Explode(separator, str, withPattern)

        for i = 1, #tblExploded do
            tblExploded[i] = string.Replace(tblExploded[i], tagReplace, separator)
        end

        return tblExploded
    end

    return string.Explode(separator, str, withPattern)
end