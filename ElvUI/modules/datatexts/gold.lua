local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local DT = E:GetModule('DataTexts')

local defaultColor = { 1, 1, 1 }
local Profit	= 0
local Spent		= 0

local function formatMoney(money)
	local gold = floor(math.abs(money) / 10000)
	local silver = mod(floor(math.abs(money) / 100), 100)
	local copper = mod(floor(math.abs(money)), 100)
	if gold ~= 0 then
		return format("%s"..L.goldabbrev.." %s"..L.silverabbrev.." %s"..L.copperabbrev, gold, silver, copper)
	elseif silver ~= 0 then
		return format("%s"..L.silverabbrev.." %s"..L.copperabbrev, silver, copper)
	else
		return format("%s"..L.copperabbrev, copper)
	end
end

local function FormatTooltipMoney(money)
	if not money then return end
	local gold, silver, copper = abs(money / 10000), abs(mod(money / 100, 100)), abs(mod(money, 100))
	local cash = ""
	cash = format("%d"..L.goldabbrev.." %d"..L.silverabbrev.." %d"..L.copperabbrev, gold, silver, copper)		
	return cash
end

local function OnEvent(self, event, ...)
	if not IsLoggedIn() then return end
	local NewMoney = GetMoney()
	if (ElvData == nil) then ElvData = {}; end
	if (ElvData['gold'] == nil) then ElvData['gold'] = {}; end
	if (ElvData['gold'][E.myrealm] == nil) then ElvData['gold'][E.myrealm] = {} end
	if (ElvData['gold'][E.myrealm][E.myname] == nil) then ElvData['gold'][E.myrealm][E.myname] = NewMoney end
	
	local OldMoney = ElvData['gold'][E.myrealm][E.myname] or NewMoney
	
	local Change = NewMoney-OldMoney -- Positive if we gain money
	if OldMoney>NewMoney then		-- Lost Money
		Spent = Spent - Change
	else							-- Gained Moeny
		Profit = Profit + Change
	end
	
	self.text:SetText(formatMoney(NewMoney))

	ElvData['gold'][E.myrealm][E.myname] = NewMoney
end

local function Click()
	ToggleAllBags()
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	GameTooltip:AddLine(L['Session:'])
	GameTooltip:AddDoubleLine(L["Earned:"], formatMoney(Profit), 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine(L["Spent:"], formatMoney(Spent), 1, 1, 1, 1, 1, 1)
	if Profit < Spent then
		GameTooltip:AddDoubleLine(L["Deficit:"], formatMoney(Profit-Spent), 1, 0, 0, 1, 1, 1)
	elseif (Profit-Spent)>0 then
		GameTooltip:AddDoubleLine(L["Profit:"	], formatMoney(Profit-Spent), 0, 1, 0, 1, 1, 1)
	end				
	GameTooltip:AddLine' '								

	local totalGold = 0				
	GameTooltip:AddLine(L["Character: "])			

	--Locales to make my personal sorting to the gold list
	local tempTable = { }
    local Darth
	local Aleyah
	local Wazzuli
	local Siaranna
	local Jaton
	local Kilandra
	local Fixter
	local Narjo
	local Verzuk
    local DarthGold
	local AleyahGold
	local WazzuliGold
	local SiarannaGold
	local JatonGold
	local KilandraGold
	local FixterGold
	local NarjoGold
	local VerzukGold
	
	--Sorting conditions
    for k,v in pairs(ElvData['gold'][E.myrealm]) do
        local charName = k
        local goldCount = ElvData['gold'][E.myrealm][k]
        if charName == "Дартпредатор" then
            Darth = charName
            DarthGold = goldCount
			table.insert(tempTable, 1, {[Darth] = DarthGold})
        elseif charName == "Алея" then
			Aleyah = charName
            AleyahGold = goldCount
			table.insert(tempTable, 2, {[Aleyah] = AleyahGold})
		elseif charName == "Ваззули" then
			Wazzuli = charName
            WazzuliGold = goldCount
			table.insert(tempTable, 3, {[Wazzuli] = WazzuliGold})
		elseif charName == "Сиаранна" then
			Siaranna = charName
            SiarannaGold = goldCount
			table.insert(tempTable, 4, {[Siaranna] = SiarannaGold})
		elseif charName == "Джатон" then
			Jaton = charName
            JatonGold = goldCount
			table.insert(tempTable, 5, {[Jaton] = JatonGold})
		elseif charName == "Киландра" then
			Kilandra = charName
            KilandraGold = goldCount
			table.insert(tempTable, 6, {[Kilandra] = KilandraGold})
		elseif charName == "Фикстер" then
			Fixter = charName
            FixterGold = goldCount
			table.insert(tempTable, 7, {[Fixter] = FixterGold})
		elseif charName == "Нарджо" then
			Narjo = charName
            NarjoGold = goldCount
			table.insert(tempTable, 8, {[Narjo] = NarjoGold})
		elseif charName == "Верзук" then
			Verzuk = charName
            VerzukGold = goldCount
			table.insert(tempTable, 9, {[Verzuk] = VerzukGold})
		else
            table.insert(tempTable, 1, {[charName] = goldCount})
        end
    end

   for i=1, table.getn(tempTable) do
        for k,v in pairs(tempTable[i]) do
            GameTooltip:AddDoubleLine(k, FormatTooltipMoney(v), 1, 1, 1, 1, 1, 1)
            totalGold=totalGold+v;
        end
    end
	
	GameTooltip:AddLine' '
	GameTooltip:AddLine(L["Server: "])
	GameTooltip:AddDoubleLine(L["Total: "], FormatTooltipMoney(totalGold), 1, 1, 1, 1, 1, 1)

	for i = 1, MAX_WATCHED_TOKENS do
		local name, count, extraCurrencyType, icon, itemID = GetBackpackCurrencyInfo(i)
		if name and i == 1 then
			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(CURRENCY)
		end
		if name and count then GameTooltip:AddDoubleLine(name, count, 1, 1, 1) end
	end	
	
	GameTooltip:Show()
end

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
DT:RegisterDatatext("Золото", {'PLAYER_ENTERING_WORLD', 'PLAYER_MONEY', 'SEND_MAIL_MONEY_CHANGED', 'SEND_MAIL_COD_CHANGED', 'PLAYER_TRADE_MONEY', 'TRADE_MONEY_CHANGED'}, OnEvent, nil, Click, OnEnter)

