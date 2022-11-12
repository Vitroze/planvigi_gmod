ENT.Base                  = "base_ai"
ENT.Type                  = "ai"
ENT.PrintName             = "NPC Plan Vigipirate"
ENT.Author                = "Vitroze Gaming"
ENT.Category              = "Plan Vigipirate"
ENT.Contact               = "Vitroze_Gaming#2612"
ENT.Instructions          = ""
ENT.Spawnable             = false
ENT.AdminOnly             = true
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(byUsingAnim)
	self.AutomaticFrameAdvance = byUsingAnim
end