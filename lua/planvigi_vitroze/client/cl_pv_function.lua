RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

function PlanVigi_Vitroze:HUDPaint_PV(times, US, FR, id, deletepanel)
    
    local sinceUnix    = os.time()
    local ResultTime   = os.date("%H:%M", sinceUnix+times)
    local speedtext    = 0.5
    local DPanelText
    
    if US then
        -- Slide Texte
        DPanelText = vgui.Create( "DPanel" )
        DPanelText:SetSize( RX(232), RY(35) ) 
        DPanelText:SetPos( RX(1634), RY(753) )
        noclearpanel = true
        function DPanelText:Paint(w, h)
            if noclearpanel then
                draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255))

                if !PlanVigi_Vitroze.Config.JobConfig[team.GetName(LocalPlayer():Team())] then
                    local offset = PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].rangepolice * math.sin(CurTime() * PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].speedtext)
 
                    draw.SimpleText(PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].policeintructions..ResultTime, "PV_PhoneText_US", offset, h/2, Color(63, 63, 61), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else
                    local offset = PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].rangecitizen * math.sin(CurTime() * PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].speedtext)

                    draw.SimpleText(PlanVigi_Vitroze.Config.ModifyLevels["Level "..id].citizenintructions..ResultTime, "PV_PhoneText_US", offset, h/2, Color(63, 63, 61), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
        end

        if deletepanel then
            if IsValid(DPanelText) then
                DPanelText:Remove()
                noclearpanel = false
            end

            return true
        end
    end


    hook.Add("HUDPaint", "PV_BreakingNews", function()

        -- BREAKING NEWS
        if PlanVigi_Vitroze.Config.ScriptLanguage == "english" then
            draw.RoundedBox(0, 0, 0, RX(487), RY(106), Color(190, 0, 0))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1), "PV_BreakingNews", RX(135), RY(29), Color(255, 255, 255))
            surface.SetMaterial( Material("pv_breakingnews/microphone.png") )
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawTexturedRect( RX(41), RY(19), RX(64), RY(64) )

        elseif PlanVigi_Vitroze.Config.ScriptLanguage == "french" then
            draw.RoundedBox(0, 0, 0, RX(403), RY(106), Color(190, 0, 0))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1), "PV_BreakingNews", RX(135), RY(29), Color(255, 255, 255))
            surface.SetMaterial( Material("pv_breakingnews/microphone.png") )
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawTexturedRect( RX(41), RY(19), RX(64), RY(64) )

        end

        if US then

            if PlanVigi_Vitroze.Config.ScriptLanguage == "english" then
                draw.RoundedBox(0, RX(487), 0, ScrW(), RY(106), Color(0, 0, 0, 142))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.1)..id, "PV_BreakingNewsTitle", RX(976), 0, Color(210, 0, 0))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.11), "PV_BreakingNewsText", RX(499), RY(43), Color(255, 255, 255))
    
            elseif PlanVigi_Vitroze.Config.ScriptLanguage == "french" then
                draw.RoundedBox(0, RX(403), 0, ScrW(), RY(106), Color(0, 0, 0, 142))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.1)..id, "PV_BreakingNewsTitle", RX(871), 0, Color(210, 0, 0))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.11), "PV_BreakingNewsText", RX(415), RY(43), Color(255, 255, 255))
            end


            -- Phone
            surface.SetMaterial(Material("pv_breakingnews/iphone.png"))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(RX(1494), RY(532), RX(512), RY(512))

            surface.SetMaterial(Material("pv_breakingnews/us_department_of_state.png"))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(RX(1718), RY(622), RX(64), RY(64))

            draw.RoundedBox(0, 1663, 705, 173, 2, Color(255, 255, 255))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.12), "PV_PhoneText_US", RX(1650), RY(707), Color(255, 255, 255))            
            
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.13), "PV_PhoneText_US", RX(1643), RY(804), Color(255, 255, 255))

            draw.SimpleText(PlanVigi_Vitroze:Lang(1.14), "PV_PhoneText_US", RX(1714), RY(877), Color(255, 255, 255))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.15), "PV_PhoneText_US", RX(1679), RY(899), Color(255, 255, 255))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.16), "PV_PhoneText_US", RX(1701), RY(921), Color(255, 255, 255))
        elseif FR then

            if PlanVigi_Vitroze.Config.ScriptLanguage == "english" then
                draw.RoundedBox(0, 487, 0, 1500, 106, Color(0, 0, 0, 142))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.1)..id, "PV_BreakingNewsTitle", RX(976), 0, Color(210, 0, 0))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.11), "PV_BreakingNewsText", RX(499), RY(43), Color(255, 255, 255))
    
            elseif PlanVigi_Vitroze.Config.ScriptLanguage == "french" then
                draw.RoundedBox(0, 403, 0, 1517, 106, Color(0, 0, 0, 142))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.1)..id, "PV_BreakingNewsTitle", RX(871), 0, Color(210, 0, 0))
                draw.SimpleText(PlanVigi_Vitroze:Lang(1.11), "PV_BreakingNewsText", RX(415), RY(43), Color(255, 255, 255))
            end

            -- Phone
            surface.SetMaterial(Material("pv_breakingnews/phone_fr.png"))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(RX(1494), RY(532), RX(512), RY(512))

            draw.RoundedBox(10, 1650, 628, 200, 319, Color(255, 255, 255))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.22), "PV_PhoneTitle_FR", RX(1686), RY(638), Color(0, 0, 0))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.23), "PV_PhoneTitle_FR", RX(1686), RY(655), Color(0, 0, 0))

            draw.SimpleText(PlanVigi_Vitroze:Lang(1.24), "PV_TextePhone_FR", RX(1659), RY(679), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.25), "PV_TextePhone_FR", RX(1659), RY(703), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze.Config.NamePrefecture, "PV_TextePhone_FR", RX(1659), RY(718), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.26), "PV_TextePhone_FR", RX(1659), RY(740), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.27), "PV_TextePhone_FR", RX(1659), RY(757), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.28), "PV_TextePhone_FR", RX(1659), RY(774), Color(189, 189, 189))

            draw.SimpleText(PlanVigi_Vitroze:Lang(1.29), "PV_TextePhone_FR", RX(1659), RY(805), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.3), "PV_TextePhone_FR", RX(1659), RY(822), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.31), "PV_TextePhone_FR", RX(1659), RY(839), Color(189, 189, 189))
            draw.SimpleText(PlanVigi_Vitroze:Lang(1.32)..id..".", "PV_TextePhone_FR", RX(1659), RY(856), Color(189, 189, 189))

            draw.SimpleText(PlanVigi_Vitroze:Lang(1.33)..ResultTime, "PV_TextePhone_FR", RX(1659), RY(893), Color(189, 189, 189))

        end
    end)

    
    -- Stop Plan Vigipirate
    timer.Create("PV_InProgress", times, 1, function()
        hook.Remove("HUDPaint", "PV_BreakingNews")
        if IsValid(DPanelText) then
            DPanelText:Remove()
            noclearpanel = false
        end
        SetGlobalFloat("PV_InProgress", false)
    end)

end

function PlanVigi_Vitroze:RemovePV()
    timer.Remove("PV_InProgress")
    timer.Remove("PV_ChatInProgress")
    hook.Remove("HUDPaint", "PV_BreakingNews")
    
    -- RunConsoleCommand --> StopSound
    RunConsoleCommand("stopsound")
end