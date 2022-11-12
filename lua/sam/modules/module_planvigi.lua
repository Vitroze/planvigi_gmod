timer.Simple(1, function()
    if not PlanVigi_Vitroze.Config.ActivateModule["SAM"] then return end

    sam.command.set_category("Plan Vigipirate")

    sam.command.new("pv_stopforce")
        :SetPermission("pv_stopforce", "admin")

        :AddArg("text", {hint = "reason"})
        :DisallowConsole()

        :Help("Allows to stop by force a vigipirate plan")

        :OnExecute(function(ply, text)

            if GetGlobalBool("PV_InProgress") then
                
                net.Start("PV_Alert")
                net.WriteUInt(4, 3)
                net.Broadcast()
                SetGlobalBool("PV_InProgress", false)

                PlanVigi_Vitroze:Notify(ply, 0, 3, PlanVigi_Vitroze:Lang(0.29)..text, "buttons/blip1.wav")

                if sam.is_command_silent then return end
                sam.player.send_message(nil, "{A} "..PlanVigi_Vitroze:Lang(0.29).." {V}", {
                    A = ply, V = text
                })

                hook.Run("PV_BLogs_StopForce", ply, text)
            else
                PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.28), "buttons/button10.wav")
            end
        end)
    :End()

    sam.command.new("pv_respawnnpc")
    :SetPermission("pv_respawnnpc", "admin")

    :DisallowConsole()

    :Help("Allows to respawn all saved NPCs")

    :OnExecute(function(ply)

        
        PlanVigi_Vitroze:RespawnEntities(ply, "pv_npc", true)

        if sam.is_command_silent then return end
        sam.player.send_message(nil, "{A} did respawn all the NPCs", {
            A = ply
        })
    end)
:End()
end)