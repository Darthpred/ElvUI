local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local displayString = '';
local lastPanel;
local self = lastPanel
E.version = GetAddOnMetadata("ElvUI", "Version");

local function OnEvent(self, event, ...)
	self.text:SetFormattedText(displayString, 'ElvUI v', E.version);
end

local function Click()
	ElvConfigToggle:Click();
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	GameTooltip:AddDoubleLine("Сборка ElvUI версии", E.version)
	GameTooltip:AddDoubleLine("Редакция от Darth Predator (Дартпредатор - Свежеватель Душ)")
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("При возникновении вопросов или желании подогнать сборку под себя обращаться:")
	GameTooltip:AddDoubleLine("- Игровая почта")
	GameTooltip:AddDoubleLine("- Личное сообщение на форуме TukUI, ник Darth Predator")
	GameTooltip:AddDoubleLine("- Личное сообщение на форуме Curse, ник Darth_Predator")
	GameTooltip:AddDoubleLine("- Сайт Shadowmage.ru")
	
	GameTooltip:Show()
end

local function ValueColorUpdate(hex, r, g, b)
	displayString = string.join("", "%s", hex, "%.2f|r", " : Darth Predator's edit")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true
--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext("Сборка", {'PLAYER_ENTERING_WORLD'}, OnEvent, Update, Click, OnEnter)

