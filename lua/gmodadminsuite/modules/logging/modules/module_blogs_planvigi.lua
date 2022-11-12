local MODULE = GAS.Logging:MODULE()

MODULE.Category = "Plan Vigipirate"
MODULE.Name     = "Launch"
MODULE.Colour  = Color(255, 0, 0)

MODULE:Setup(function()

    MODULE:Hook("PV_BLogs_Launch", "pvlaunch", function(ply, level)
        MODULE:Log("{1} has launched a level {2} vigipirate plan", GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(level))
    end)


end)

GAS.Logging:AddModule(MODULE)

-----------------------------------------------------------------

local MODULE = GAS.Logging:MODULE()

MODULE.Category = "Plan Vigipirate"
MODULE.Name     = "Stop Force"
MODULE.Colour  = Color(255, 0, 0)

MODULE:Setup(function()

    MODULE:Hook("PV_BLogs_StopForce", "pv_stopforce", function(ply, reason)
        if !reason then reason = "Unknown" end 

        MODULE:Log("{1} has stopped a vigipirate plan by force for the reason {2}", GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(reason))
    end)
end)

GAS.Logging:AddModule(MODULE)