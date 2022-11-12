local category_name = "Plan VigiPirate"

function ulx.pv_stopforce( calling_ply, reason )
    if GetGlobalBool("PV_InProgress") then
                
        net.Start("PV_Alert")
        net.WriteUInt(4, 3)
        net.Broadcast()
        SetGlobalBool("PV_InProgress", false)
        
        PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.29)..text, "buttons/blip1.wav")

        hook.Run("PV_BLogs_StopForce", ply, text)
    else
        PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.28), "buttons/button10.wav")
    end

    ulx.fancyLogAdmin( calling_ply, "#A "..PlanVigi_Vitroze:Lang(0.29).." #T", reason )
end

local pv_stopforce = ulx.command( category_name, "ulx pv_stopforce", ulx.pv_stopforce, "!pv_stopforce" )
pv_stopforce:addParam{ type=ULib.cmds.StringArg, hint="reason" }
pv_stopforce:defaultAccess( ULib.ACCESS_ADMIN )
pv_stopforce:help( "Allows to stop by force a vigipirate plan" )

function ulx.pv_respawnnpc( calling_ply, reason )
    PlanVigi_Vitroze:RespawnEntities(ply, "pv_npc", true)

    ulx.fancyLogAdmin( calling_ply, "#A stopped a Vigipirate plan for the reason #T", reason )
end

local pv_respawnnpc = ulx.command( category_name, "ulx pv_respawnnpc", ulx.pv_respawnnpc, "!pv_respawnnpc" )
pv_respawnnpc:addParam{ type=ULib.cmds.StringArg, hint="reason" }
pv_respawnnpc:defaultAccess( ULib.ACCESS_ADMIN )
pv_respawnnpc:help( "Allows to respawn all saved NPCs" )