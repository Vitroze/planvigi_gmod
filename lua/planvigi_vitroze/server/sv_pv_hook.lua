hook.Add("PlayerSay", "PV_CommandChat", function(ply, text, teamChat)
    if PlanVigi_Vitroze.Config.ActivateModule["Command"] then

        if text == "/"..PlanVigi_Vitroze.Config.Command.RespawnNPC then
            if not PlanVigi_Vitroze.Config.GradeCommand[ply:GetUserGroup()] then return end
            PlanVigi_Vitroze:RespawnEntities(ply, "pv_npc", true)

            return ""

        end

        local ArgsSplit = PlanVigi_Vitroze.ExplodeExcepton(" ", text, false, '"')
        if ArgsSplit[1] ~= "/"..PlanVigi_Vitroze.Config.Command.StopPVForce then return end
        if not PlanVigi_Vitroze.Config.GradeCommand[ply:GetUserGroup()] then return end

        -- Check if a vigipirate plan is in place
        if GetGlobalString("PV_InProgress") then
            print()
            if !table.HasValue(ArgsSplit, ArgsSplit[2]) or ArgsSplit[2] == "" then PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.31), "buttons/button10.wav") return "" end

            net.Start("PV_Alert")
            net.WriteUInt(4, 3)
            net.Broadcast()
            SetGlobalBool("PV_InProgress", false)

            PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.29)..ArgsSplit[2], "buttons/blip1.wav")

            hook.Run("PV_BLogs_StopForce", ply, ArgsSplit[2])
            return ""
        end
    end
    
end)
