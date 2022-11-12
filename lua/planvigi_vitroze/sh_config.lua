PlanVigi_Vitroze.Config = {} -- Not Delete

-- Version
PlanVigi_Vitroze.Config.VersionError = true 

-- Script Language (availables : "english", "french")
PlanVigi_Vitroze.Config.ScriptLanguage = "english"

PlanVigi_Vitroze.Config.ActivateModule = {
    ["SAM"] = true,
    ["ULX"] = false,
    ["Command"] = true -- The MODULE command is only for the chat
}

PlanVigi_Vitroze.Config.JobConfig = {
    ["Civil Protection"]          = true,
    ["Civil Protection Chief"]    = true
}

PlanVigi_Vitroze.Config.EnabledSound = true

-- Country Alert (availables : "fr", "us") 
-- If you set "US" then the Vigipirate Plan will change to FIB Alert. If you set "FR" then the Vigipirate Plan will remain
PlanVigi_Vitroze.Config.CountryAlert = "us"

if PlanVigi_Vitroze.Config.CountryAlert == "fr" then
    -- Name of the Prefecture (ex : "Rockford") | If it is empty then it will automatically take the name of the map by removing the underscore (ex : rp_rockford_v2b --> Rockford)
    PlanVigi_Vitroze.Config.NamePrefecture = "Rockford"
end

-- Please do not add to or remove from the table. It has only 3 levels of vigipirate plan at the maximum
PlanVigi_Vitroze.Config.ModifyLevels = {
    ["Level 1"] = {
        enabled            = true,
        description_fr     = "The French Government and the National Police Headquarters have launched a Vigipirate plan of vigilance level. The Vigipirate Plan now triggers: a daily protection against a terrorist threat.",
        description_us     = "The U.S. Government has issued a Level 1 Attack Alert. The Attack Alert now triggers : daily protection against a terrorist threat and a reinforcement in police protections.", -- WARNING: The "description" will be only in the chat and not in the audio 
        /*
            Only on the phone! If nothing the text will automatically read "THIS IS NOT TEST - KEEP CALM. END OF ALERT A " with the time. 
            If you want to disable the time please false the option "ActivatedTimePhone" (The time will be disabled on US and FR mode)
            The civil and police intructions will be on the US AND FR
        */
        citizenintructions = "THIS IS NOT TEST - KEEP CALM. END OF ALERT A ", -- Only US !
        rangecitizen       = 230, -- Allows you to set the display distance when scrolling from right to left - FOR US ONLY
        policeintructions  = "THIS IS NOT TEST - YOU ARE AUTHORIZED TO SEARCH AND PERFORM ROUTINE CHECKS. END OF ALERT A ", -- Only US !
        rangepolice        = 440, -- Allows you to set the display distance when scrolling from right to left - FOR US ONLY
        speedtext          = 0.5,
        activatedtime      = true
    },
    ["Level 2"] = {
        enabled            = true,
        description_fr     = "The French government and the French national police have launched a reinforced security level vigipirate plan. The Vigipirate plan now triggers: permanent reinforced security measures and the activation of the right to search by the police.",
        description_us     = "The U.S. government has issued a level 2 attack alert. The attack alert now triggers: a permanent protection against a terrorist threat, enhanced police protections and the right to search by law enforcement.",
        citizenintructions = "THIS IS NOT TEST - KEEP CALM. END OF ALERT A ",
        rangecitizen       = 230, 
        policeintructions  = "THIS IS NOT A TEST - YOU ARE ALLOWED TO SEARCH AND PERFORM ROUTINE CHECKS - PERMANENT POLICE PROTECTION - ACTIVATED. END OF ALERT A ",
        rangepolice        = 600, 
        speedtext          = 0.5,
        activatedtime      = true
    },
    ["Level 3"] = {
        enabled            = true,
        description_fr     = "The French government and the French national police have activated the Vigipirate plan at the URGENT ATTACK level. The Vigipirate plan now triggers: a permanent protection against a terrorist threat, a reinforced police security, authorization of the RAID to patrol.",
        description_us     = "The U.S. government has issued a level 3 attack alert. The attack alert now triggers: permanent protection from a terrorist threat, enhanced police protections, and the right to be searched by law enforcement, SWAT patrol authorization.", 
        citizenintructions = "THIS IS NOT TEST - KEEP CALM. END OF ALERT A ",
        rangecitizen       = 230,
        policeintructions  = "THIS IS NOT A TEST - YOU ARE ALLOWED TO SEARCH AND PERFORM ROUTINE CHECKS - PERMANENT POLICE PROTECTION - ACTIVATED. END OF ALERT A ", 
        rangepolice        = 600,
        speedtext          = 0.5,
        activatedtime      = true
    }
}

-- The minimum time that a vigipirate plan can last (In seconds)
PlanVigi_Vitroze.Config.MinimumTime = 90 -- It is recommended to take 90 seconds for the audio to finish well. The audio is currently 1 minute 24 (84 seconds)

-- The maximum time that a vigipirate plan can last (In seconds)
PlanVigi_Vitroze.Config.MaximumTime = 350

PlanVigi_Vitroze.Config.Cooldown = 60

if PlanVigi_Vitroze.Config.ActivateModule["Command"] then
    PlanVigi_Vitroze.Config.GradeCommand = {
        ["superadmin"] = true,
        ["admin"]      = true
    }
    
    PlanVigi_Vitroze.Config.Command = { -- The prefix "/" is already included in the order, please do not add a prefix
        StopPVForce = "pv_stopforce",
        RespawnNPC  = "pv_respawnnpc",
    }
    
end