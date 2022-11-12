net.Receive("PV_OpenMenu", function()
    local FramePV = vgui.Create("DFrame")
    FramePV:SetSize(RX(943), RY(504))
    FramePV:Center()
    FramePV:MakePopup()
    FramePV:SetTitle("")
    FramePV:ShowCloseButton(false)

    function FramePV:Paint(w, h)

        draw.RoundedBox(10, 0, 0, w, h, Color(44, 62, 80))

        if PlanVigi_Vitroze.Config.CountryAlert == "us" then
            draw.SimpleText(PlanVigi_Vitroze:Lang(0.1), "PV_TextMenu", w/2, RY(51), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            surface.SetMaterial(Material("pv_panel/logo_fbi.png"))
            surface.SetDrawColor(255, 255, 255, 255, 255)
            surface.DrawTexturedRect(RX(587), RY(139), RX(280), RY(280))

        elseif PlanVigi_Vitroze.Config.CountryAlert == "fr" then
            draw.SimpleText(PlanVigi_Vitroze:Lang(0.11), "PV_TextMenu", w/2, RY(51), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            surface.SetMaterial(Material("pv_panel/logo_vigipirate.png"))
            surface.SetDrawColor(255, 255, 255, 255, 255)
            surface.DrawTexturedRect(RX(587), RY(139), RX(280), RY(280))
        end
        
    end

    if table.Count(PlanVigi_Vitroze.Config.ModifyLevels) > 3 then
        error("You have put too much level of vigipirate plan", 0)
    end

    if PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled then
        local ButtonLevelOne = vgui.Create("DButton", FramePV)
        ButtonLevelOne:SetText("")
        ButtonLevelOne:SetSize(RX(248), RY(83))
        ButtonLevelOne:SetPos(RX(110), RY(120))

        function ButtonLevelOne:DoClick()
            local FrameTimes = vgui.Create("DFrame")
            FrameTimes:SetSize(RX(742), RY(411))
            FrameTimes:Center()
            FrameTimes:MakePopup()
            FrameTimes:SetTitle("")
            FrameTimes:ShowCloseButton(false)

            function FrameTimes:Paint(w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(44, 62, 80))

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.15), "PV_TextMenu", w/2, RY(65), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.16), "PV_TextMenu", w/2, 110, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local TextEntryNumber = vgui.Create("DTextEntry", FrameTimes)
            TextEntryNumber:SetSize(RX(342), RY(69))
            TextEntryNumber:Center()
            TextEntryNumber:SetFont("PV_TextMenu")
            TextEntryNumber:SetNumeric(true)
            TextEntryNumber:SetValue(90)

            TextEntryNumber.Paint = function(self, w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                self:DrawTextEntryText(Color(255, 255, 255, 255), Color(38, 130, 255), Color(255, 255, 255))
                self:SetDrawLanguageID(false)
                
            end

            local ButtonConfirm = vgui.Create("DButton", FrameTimes)
            ButtonConfirm:SetText("")
            ButtonConfirm:SetSize(RX(248), RY(83))
            ButtonConfirm:SetPos(RX(110), RY(280))
            
            function ButtonConfirm:DoClick()
                net.Start("PV_VerifyServer")
                net.WriteUInt(1, 3)
                net.WriteFloat(TextEntryNumber:GetValue())
                net.SendToServer()

                FrameTimes:Close()
            end

            ButtonConfirm.Paint = function(me, w, h)
 
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))   
                end

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.17), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local ButtonCancel = vgui.Create("DButton", FrameTimes)
            ButtonCancel:SetText("")
            ButtonCancel:SetSize(RX(248), RY(83))
            ButtonCancel:SetPos(RX(380), RY(280))

            function ButtonCancel:DoClick()
                FrameTimes:Close()
            end

            ButtonCancel.Paint = function(me, w, h)
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                end

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.18), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            FramePV:Close()
        end

        ButtonLevelOne.Paint = function(me, w, h)
            if me:IsHovered() then
                draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
            else
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
            end

            draw.SimpleText(PlanVigi_Vitroze:Lang(0.12), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        end
    end

    if PlanVigi_Vitroze.Config.ModifyLevels["Level 2"].enabled then
        local ButtonLevelTwo = vgui.Create("DButton", FramePV)
        ButtonLevelTwo:SetText("")
        ButtonLevelTwo:SetSize(RX(248), RY(83))
        if PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled then
            ButtonLevelTwo:SetPos(RX(110), RY(235))
        else
            ButtonLevelTwo:SetPos(RX(110), RY(120))
        end

        function ButtonLevelTwo:DoClick()
            local FrameTimes = vgui.Create("DFrame")
            FrameTimes:SetSize(RX(742), RY(411))
            FrameTimes:Center()
            FrameTimes:MakePopup()
            FrameTimes:SetTitle("")
            FrameTimes:ShowCloseButton(false)

            function FrameTimes:Paint(w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(44, 62, 80))

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.15), "PV_TextMenu", w/2, RY(65), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.16), "PV_TextMenu", w/2, RY(110), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local TextEntryNumber = vgui.Create("DTextEntry", FrameTimes)
            TextEntryNumber:SetSize(RX(342), RY(69))
            TextEntryNumber:Center()
            TextEntryNumber:SetFont("PV_TextMenu")
            TextEntryNumber:SetNumeric(true)
            TextEntryNumber:SetValue(90)

            TextEntryNumber.Paint = function(self, w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                self:DrawTextEntryText(Color(255, 255, 255, 255), Color(38, 130, 255), Color(255, 255, 255))
                self:SetDrawLanguageID(false)
                
            end

            local ButtonConfirm = vgui.Create("DButton", FrameTimes)
            ButtonConfirm:SetText("")
            ButtonConfirm:SetSize(RX(248), RY(83))
            ButtonConfirm:SetPos(RX(110), RY(280))
            
            function ButtonConfirm:DoClick()
                net.Start("PV_VerifyServer")
                net.WriteUInt(2, 3)
                net.WriteFloat(TextEntryNumber:GetValue())
                net.SendToServer()

                FrameTimes:Close()
            end

            ButtonConfirm.Paint = function(me, w, h)
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                end
                 
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.17), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local ButtonCancel = vgui.Create("DButton", FrameTimes)
            ButtonCancel:SetText("")
            ButtonCancel:SetSize(RX(248), RY(83))
            ButtonCancel:SetPos(RX(380), RY(280))

            function ButtonCancel:DoClick()
                FrameTimes:Close()
            end

            ButtonCancel.Paint = function(me, w, h)
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                end

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.18), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            FramePV:Close()
        end

        ButtonLevelTwo.Paint = function(me, w, h)
            if me:IsHovered() then
                draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
            else
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
            end

            draw.SimpleText(PlanVigi_Vitroze:Lang(0.13), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        end
    end

    if PlanVigi_Vitroze.Config.ModifyLevels["Level 3"].enabled then
        local ButtonLevelThree = vgui.Create("DButton", FramePV)
        ButtonLevelThree:SetText("")
        ButtonLevelThree:SetSize(RX(248), RY(83))
        if PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled and PlanVigi_Vitroze.Config.ModifyLevels["Level 2"].enabled then
            ButtonLevelThree:SetPos(RX(110), RY(350))
        elseif !PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled and PlanVigi_Vitroze.Config.ModifyLevels["Level 2"].enabled then 
            ButtonLevelThree:SetPos(RX(110), RY(235))
        elseif PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled and !PlanVigi_Vitroze.Config.ModifyLevels["Level 2"].enabled then
            ButtonLevelThree:SetPos(RX(110), RY(235))
        elseif !PlanVigi_Vitroze.Config.ModifyLevels["Level 1"].enabled and !PlanVigi_Vitroze.Config.ModifyLevels["Level 2"].enabled then
            ButtonLevelThree:SetPos(RX(110), RY(120))
        end

        function ButtonLevelThree:DoClick()
            local FrameTimes = vgui.Create("DFrame")
            FrameTimes:SetSize(RX(742), RY(411))
            FrameTimes:Center()
            FrameTimes:MakePopup()
            FrameTimes:SetTitle("")
            FrameTimes:ShowCloseButton(false)

            function FrameTimes:Paint(w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(44, 62, 80))
                
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.15), "PV_TextMenu", w/2, RY(65), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.16), "PV_TextMenu", w/2, 110, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local TextEntryNumber = vgui.Create("DTextEntry", FrameTimes)
            TextEntryNumber:SetSize(RX(342), RY(69))
            TextEntryNumber:Center()
            TextEntryNumber:SetFont("PV_TextMenu")
            TextEntryNumber:SetNumeric(true)
            TextEntryNumber:SetValue(90)

            TextEntryNumber.Paint = function(self, w, h)
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                self:DrawTextEntryText(Color(255, 255, 255, 255), Color(38, 130, 255), Color(255, 255, 255))
                self:SetDrawLanguageID(false)

            end

            local ButtonConfirm = vgui.Create("DButton", FrameTimes)
            ButtonConfirm:SetText("")
            ButtonConfirm:SetSize(RX(248), RY(83))
            ButtonConfirm:SetPos(RX(110), RY(280))
            
            function ButtonConfirm:DoClick()
                net.Start("PV_VerifyServer")
                net.WriteUInt(3, 3)
                net.WriteFloat(TextEntryNumber:GetValue())
                net.SendToServer()

                FrameTimes:Close()
            end

            ButtonConfirm.Paint = function(me, w, h)
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                end
                 
                draw.SimpleText(PlanVigi_Vitroze:Lang(0.17), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            local ButtonCancel = vgui.Create("DButton", FrameTimes)
            ButtonCancel:SetText("")
            ButtonCancel:SetSize(RX(248), RY(83))
            ButtonCancel:SetPos(RX(380), RY(280))

            function ButtonCancel:DoClick()
                FrameTimes:Close()
            end

            ButtonCancel.Paint = function(me, w, h)
                if me:IsHovered() then
                    draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
                else
                    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
                end

                draw.SimpleText(PlanVigi_Vitroze:Lang(0.18), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            end

            FramePV:Close()
        end

        ButtonLevelThree.Paint = function(me, w, h)
            if me:IsHovered() then
                draw.RoundedBox(10, 0, 0, w, h, Color(48, 68, 89))
            else
                draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))
            end

            draw.SimpleText(PlanVigi_Vitroze:Lang(0.14), "PV_TextMenu", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        end
    end

    -- Close Button
    local ImageButtonClose = vgui.Create("DImageButton", FramePV)
    ImageButtonClose:SetPos( RX(852), RY(20) )
    ImageButtonClose:SetImage("pv_panel/close.png")
    ImageButtonClose:SizeToContents()
    function ImageButtonClose:DoClick()
        FramePV:Close()
    end
end)

net.Receive("PV_Alert", function()
    local id = net.ReadUInt(3)
    local time = net.ReadFloat()

    if id == 1 then
        local InfoLevel = PlanVigi_Vitroze.Config.ModifyLevels["Level 1"]
        if PlanVigi_Vitroze.Config.CountryAlert == "fr" then

            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255),  InfoLevel.description_fr.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)

            end 
            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)
                
            end)
            
            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.35)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, false, true, 1, false)

        elseif PlanVigi_Vitroze.Config.CountryAlert == "us" then
            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end

            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end)

            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.34)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, true, false, 1, false)
        end
    end

    if id == 2 then
        local InfoLevel = PlanVigi_Vitroze.Config.ModifyLevels["Level 2"]
        if PlanVigi_Vitroze.Config.CountryAlert == "fr" then

            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255),  InfoLevel.description_fr.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)

            end 
            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)
                
            end)
            
            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.35)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, false, true, 1, false)

        elseif PlanVigi_Vitroze.Config.CountryAlert == "us" then
            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end

            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end)

            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.34)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, true, false, 2, false)
        end
    end

    if id == 3 then
        local InfoLevel = PlanVigi_Vitroze.Config.ModifyLevels["Level 3"]
        if PlanVigi_Vitroze.Config.CountryAlert == "fr" then

            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255),  InfoLevel.description_fr.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)

            end 
            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(1.23).."] ", Color(255, 255, 255), InfoLevel.description_fr)
                
            end)
            
            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.35)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, false, true, 3, false)

        elseif PlanVigi_Vitroze.Config.CountryAlert == "us" then
            if InfoLevel.activatedtime then
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us.." This Plan lasted "..string.NiceTime(time))
            else
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end

            timer.Create("PV_ChatInProgress", time/5, 5, function()
                chat.AddText(Color(255, 0, 0), "["..PlanVigi_Vitroze:Lang(0.19).."] ", Color(255, 255, 255), InfoLevel.description_us)
            end)

            if PlanVigi_Vitroze.Config.EnabledSound then EmitSound(Sound(PlanVigi_Vitroze:Lang(1.34)), LocalPlayer():GetPos(), 1, CHAN_AUTO, 1, 150, 0, 100) end
            PlanVigi_Vitroze:HUDPaint_PV(time, true, false, 3, false)
        end
    end

    if id == 4 then
        PlanVigi_Vitroze:HUDPaint_PV(0, true, false, 0, true)
        PlanVigi_Vitroze:RemovePV()
    end
end)

net.Receive("PV_Notify", function()
    local enum        = net.ReadUInt(3)
    local time        = net.ReadUInt(4)
    local text        = net.ReadString()
    local soundnotify = net.ReadString()
    notification.AddLegacy(text, enum, time)

    if soundnotify then
        surface.PlaySound( soundnotify )
    end
end)