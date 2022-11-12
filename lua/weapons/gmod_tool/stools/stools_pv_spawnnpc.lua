TOOL.Category = "Plan Vigipirate"
TOOL.Name = "Spawn NPC"
TOOL.Command = nil 
TOOL.ConfigName = ""

TOOL.ClientConVar["myparameter"] = "fubar"


TOOL.Information = {
    { name = "left" },
    { name = "right"},
    { name = "reload"}
}

if CLIENT then
    language.Add("tool.stools_pv_spawnnpc.name", "NPC | Plan Vigipirate")
    language.Add("tool.stools_pv_spawnnpc.desc", "Be able to spawn a « NPC » ")
    language.Add("tool.stools_pv_spawnnpc.left", "Spawn")
    language.Add("tool.stools_pv_spawnnpc.right", "Save the NPC")
    language.Add("tool.stools_pv_spawnnpc.reload", "UnSave the NPCs")

end

function TOOL:LeftClick(trace)
    if SERVER then
        if not self:GetOwner():IsSuperAdmin() then return end 
        local SpawnAngles = self:GetOwner():EyeAngles()
        SpawnAngles.pitch = 0
        SpawnAngles.roll  = 0

        local SpawnNPC = ents.Create("pv_npc")
        SpawnNPC:SetPos(trace.HitPos + Vector(0, 0, 10))
        SpawnNPC:SetAngles(SpawnAngles + Angle(0, 180, 0))
        SpawnNPC:Spawn()
        SpawnNPC:Activate()
    end
end

function TOOL:RightClick(trace)
    if not self:GetOwner():IsSuperAdmin() then return end 

    if CLIENT then
        local lp = LocalPlayer()
        if not IsFirstTimePredicted() then return end 

        net.Start("PV_Saving")
        net.WriteUInt(1, 3)
        net.SendToServer()

    end
end

function TOOL:Reload(trace)
    if not self:GetOwner():IsSuperAdmin() then return end 

    if CLIENT then
        local lp = LocalPlayer()
        if not IsFirstTimePredicted() then return end 

        net.Start("PV_Saving")
        net.WriteUInt(2, 3)
        net.SendToServer()    
    end
end