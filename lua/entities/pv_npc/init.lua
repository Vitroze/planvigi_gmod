AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/breen.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetBloodColor(BLOOD_COLOR_RED)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE, CAP_TURN_HEAD)
	self:SetMaxYawSpeed(90)
	self:DropToFloor()
end

function ENT:SpawnFunction(ply, tr, class)
	if not tr.Hit then return end
	
	local ang = ply:EyeAngles()
	ang.p = 0
	ang.y = ang.y + 240

	local ent = ents.Create(class)
	ent:SetPos(tr.HitPos + tr.HitNormal * 16)
	ent:SetAngles(ang)
	ent:Spawn()
	ent:Activate()

	return ent

end

function ENT:AcceptInput(name, _, caller)
    if name == "Use" and caller:IsPlayer() then
		if PlanVigi_Vitroze:CheckNPC(caller) then
			net.Start("PV_OpenMenu")
			net.Send(caller)
		end
    end
end