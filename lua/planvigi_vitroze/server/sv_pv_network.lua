util.AddNetworkString("PV_OpenMenu")
util.AddNetworkString("PV_VerifyServer")
util.AddNetworkString("PV_Alert")
util.AddNetworkString("PV_Saving")
util.AddNetworkString("PV_Notify")

local delay = PlanVigi_Vitroze.Config.Cooldown
local nextOccurance = 0
net.Receive("PV_VerifyServer", function(len, ply)
    local id = net.ReadUInt(3)
    local time = net.ReadFloat()
    
    -- Check if he has a cooldown in progress
    if GetGlobalBool("PV_InProgress") then return PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.23), "buttons/button10.wav") end

	local RemainingTime = nextOccurance - CurTime()
	if RemainingTime < 0 then
        
        if id == 1 then
            if PlanVigi_Vitroze.Config.JobConfig[team.GetName(ply:Team())] then
                if time >= PlanVigi_Vitroze.Config.MinimumTime and time <= PlanVigi_Vitroze.Config.MaximumTime then
                    
    
                    net.Start("PV_Alert")
                    net.WriteUInt(1, 3)
                    net.WriteFloat(time)
                    net.Broadcast()
    
                    SetGlobalBool("PV_InProgress", true)
                    hook.Run("PV_BLogs_Launch", ply, "Level 1")
                    
                end
            end
        end
    
        if id == 2 then
            if PlanVigi_Vitroze.Config.JobConfig[team.GetName(ply:Team())] then
                if time >= PlanVigi_Vitroze.Config.MinimumTime and time <= PlanVigi_Vitroze.Config.MaximumTime then
                    
    
                    net.Start("PV_Alert")
                    net.WriteUInt(2, 3)
                    net.WriteFloat(time)
                    net.Broadcast()
    
                    SetGlobalBool("PV_InProgress", true)
                    hook.Run("PV_BLogs_Launch", ply, "Level 2")
                end
            end
        end
    
        if id == 3 then
            if PlanVigi_Vitroze.Config.JobConfig[team.GetName(ply:Team())] then
                if time >= PlanVigi_Vitroze.Config.MinimumTime and time <= PlanVigi_Vitroze.Config.MaximumTime then
                    
    
                    net.Start("PV_Alert")
                    net.WriteUInt(3, 3)
                    net.WriteFloat(time)
                    net.Broadcast()
    
                    SetGlobalBool("PV_InProgress", true)
                    hook.Run("PV_BLogs_Launch", ply, "Level 3")
                end
            end
        end
        nextOccurance = CurTime() + delay

    else
        PlanVigi_Vitroze:Notify(ply, 1, 3, PlanVigi_Vitroze:Lang(0.21)..math.Round(RemainingTime)..PlanVigi_Vitroze:Lang(0.22), "buttons/button10.wav")
	end

end)

net.Receive("PV_Saving", function(len, ply)
    local id = net.ReadUInt(3)

    if id == 1 then
        PlanVigi_Vitroze:ToolgunSave(ply, "pv_npc")
    end

    if id == 2 then
        PlanVigi_Vitroze:ToolgunUnSave(ply, "pv_npc")
    end

end)