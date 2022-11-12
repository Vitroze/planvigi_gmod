PlanVigi_Vitroze          = PlanVigi_Vitroze or {}
PlanVigi_Vitroze.Config   = PlanVigi_Vitroze.Config or {}
PlanVigi_Vitroze.Language = PlanVigi_Vitroze.Language or {}
PlanVigi_Vitroze.Version  = PlanVigi_Vitroze.Version

-- Load Projet Folder
local planvigi_folder = "planvigi_vitroze/"

-- File Shared and Config
include(planvigi_folder.."sh_config.lua")

-- Languages Files
local files_languages = file.Find(planvigi_folder.."languages/*.lua", "LUA")
for _, f in pairs(files_languages) do
    if SERVER then
        AddCSLuaFile(planvigi_folder.."languages/"..f)
    end

    include(planvigi_folder.."languages/"..f)
end

function PlanVigi_Vitroze:Lang(id)
    return PlanVigi_Vitroze.Language[PlanVigi_Vitroze.Config.ScriptLanguage][id]
end

if SERVER then
    -- File Shared and Config
    AddCSLuaFile(planvigi_folder.."sh_config.lua")

    -- File Client => AddCSLuaFile
    AddCSLuaFile(planvigi_folder.."client/cl_pv_fonts.lua")
    AddCSLuaFile(planvigi_folder.."client/cl_pv_network.lua")
    AddCSLuaFile(planvigi_folder.."client/cl_pv_function.lua")

    -- File Server => Include
    include(planvigi_folder.."server/sv_pv_network.lua")
    include(planvigi_folder.."server/sv_pv_hook.lua")
    include(planvigi_folder.."server/sv_pv_function.lua")

elseif CLIENT then
    -- Client File => include
    include(planvigi_folder.."client/cl_pv_fonts.lua")
    include(planvigi_folder.."client/cl_pv_network.lua")
    include(planvigi_folder.."client/cl_pv_function.lua")
end

-- Check Version
PlanVigi_Vitroze.Version = "0.8" -- Not Delete
http.Fetch("https://raw.githubusercontent.com/Vitroze/planvigi_gmod/main/version.txt", function(body, len, headers, code)
    if !string.find(body, PlanVigi_Vitroze.Version) then
        local splitted = string.Split(body, " ")
        if PlanVigi_Vitroze.Config.VersionError then
            error("You do not have the latest version of the addon. Please download the latest version on the github or aide-serveur.fr\nCurrent version: "..PlanVigi_Vitroze.Version.."\nLatest version: "..splitted[6])
        else
            print("You do not have the latest version of the addon. Please download the latest version on the github or aide-serveur.fr")
            print("Version: "..PlanVigi_Vitroze.Version)
            print("Last Version: "..splitted[6])
        end
    end
end)


resource.AddFile("resource/fonts/montserrat_regular.ttf")
resource.AddFile("resource/fonts/montserrat_bold.ttf")
resource.AddFile("resource/fonts/montserrat_medium.ttf")
resource.AddFile("resource/fonts/montserrat_black.ttf")
resource.AddFile("resource/fonts/vt323_regular.ttf")
resource.AddFile("resource/fonts/archivo_bold.ttf")
resource.AddFile("resource/fonts/archivo_medium.ttf")

Msg( "////////////////////////////////////////\n" )
Msg( "//      Plan VigiPirate v1            //\n" )
Msg( "//      By Vitroze Gaming             //\n" )
Msg( "////////////////////////////////////////\n" )
Msg( "// Loading in progress...             //\n" )
Msg( "////////////////////////////////////////\n" )