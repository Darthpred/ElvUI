local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local LO = E:NewModule('Layout', 'AceEvent-3.0');

local PANEL_HEIGHT = 22;
local SIDE_BUTTON_WIDTH = 16;

E.Layout = LO;

function LO:Initialize()
	self:CreateChatPanels()
	self:CreateMinimapPanels()
	self:CreateDataPanels() -- Инициализация добавления панелей под инфотексты
end


local function ChatPanelLeft_OnFade(self)
	LeftChatPanel:Hide()
end

local function ChatPanelRight_OnFade(self)
	RightChatPanel:Hide()
end

local function ChatButton_OnEnter(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		self.parent:Show()
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	end
end

local function ChatButton_OnLeave(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
end

local function ChatButton_OnClick(self, ...)
	if E.db[self.parent:GetName()..'Faded'] then
		E.db[self.parent:GetName()..'Faded'] = nil
		UIFrameFadeIn(self.parent, 0.2, self.parent:GetAlpha(), 1)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
	else
		E.db[self.parent:GetName()..'Faded'] = true
		UIFrameFadeOut(self.parent, 0.2, self.parent:GetAlpha(), 0)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		self.parent.fadeInfo.finishedFunc = self.parent.fadeFunc
	end
end

function HideLeftChat()
	ChatButton_OnClick(LeftChatToggleButton)
end

function HideRightChat()
	ChatButton_OnClick(RightChatToggleButton)
end

function HideBothChat()
	ChatButton_OnClick(LeftChatToggleButton)
	ChatButton_OnClick(RightChatToggleButton)
end

function LO:ToggleChatPanels()
	LeftChatDataPanel:ClearAllPoints()
	RightChatDataPanel:ClearAllPoints()
	if E.db.general.panelBackdrop == 'SHOWBOTH' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		

		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 2)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -2, PANEL_HEIGHT)		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', 2, 2)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 2, 2)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -2, 2)
	elseif E.db.general.panelBackdrop == 'HIDEBOTH' then
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)		
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
	elseif E.db.general.panelBackdrop == 'LEFT' then
		LeftChatPanel.backdrop:Show()
		LeftChatTab:Show()
		RightChatPanel.backdrop:Hide()
		RightChatTab:Hide()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT')
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -SIDE_BUTTON_WIDTH, PANEL_HEIGHT)			
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT')
	else
		LeftChatPanel.backdrop:Hide()
		LeftChatTab:Hide()
		RightChatPanel.backdrop:Show()
		RightChatTab:Show()		
		LeftChatDataPanel:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT', SIDE_BUTTON_WIDTH, 0)
		LeftChatDataPanel:Point('TOPRIGHT', LeftChatPanel, 'BOTTOMRIGHT', 0, PANEL_HEIGHT)			
		RightChatDataPanel:Point('BOTTOMLEFT', RightChatPanel, 'BOTTOMLEFT', 5, 5)
		RightChatDataPanel:Point('TOPRIGHT', RightChatPanel, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)		
		LeftChatToggleButton:Point('BOTTOMLEFT', LeftChatPanel, 'BOTTOMLEFT')
		RightChatToggleButton:Point('BOTTOMRIGHT', RightChatPanel, 'BOTTOMRIGHT', -5, 5)
	end
end

function LO:CreateChatPanels()
	--Left Chat
	local lchat = CreateFrame('Frame', 'LeftChatPanel', E.UIParent)
	lchat:SetFrameStrata('BACKGROUND')
	lchat:Width(420)
	lchat:Height(180)
	lchat:Point('BOTTOMLEFT', E.UIParent, 0, 0)
	lchat:CreateBackdrop('Transparent')
	lchat.backdrop:SetAllPoints()
	
	--Background Texture
	lchat.tex = lchat:CreateTexture(nil, 'OVERLAY')
	lchat.tex:Point('TOPLEFT', lchat, 'TOPLEFT', 2, -2)
	lchat.tex:Point('BOTTOMRIGHT', lchat, 'BOTTOMRIGHT', -2, 2)
	lchat.tex:SetTexture(E.db.general.panelBackdropNameLeft)
	lchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)
	
	--Left Chat Tab
	local lchattab = CreateFrame('Frame', 'LeftChatTab', LeftChatPanel)
	lchattab:Point('TOPLEFT', lchat, 'TOPLEFT', 2, -2)
	lchattab:Point('BOTTOMRIGHT', lchat, 'TOPRIGHT', -2, -PANEL_HEIGHT)
	lchattab:SetTemplate('Default', true)
	
	--Left Chat Data Panel
	local lchatdp = CreateFrame('Frame', 'LeftChatDataPanel', LeftChatPanel)
	lchatdp:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', 5 + SIDE_BUTTON_WIDTH, 5)
	lchatdp:Point('TOPRIGHT', lchat, 'BOTTOMRIGHT', -5, (5 + PANEL_HEIGHT))
	lchatdp:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lchatdp, 3, 'ANCHOR_TOPLEFT', -17, 4)
	
	--Left Chat Toggle Button
	local lchattb = CreateFrame('Button', 'LeftChatToggleButton', E.UIParent)
	lchattb.parent = LeftChatPanel
	LeftChatPanel.fadeFunc = ChatPanelLeft_OnFade
	lchattb:Point('TOPRIGHT', lchatdp, 'TOPLEFT', -1, 0)
	lchattb:Point('BOTTOMLEFT', lchat, 'BOTTOMLEFT', 5, 5)
	lchattb:SetTemplate('Default', true)
	lchattb:SetScript('OnEnter', ChatButton_OnEnter)
	lchattb:SetScript('OnLeave', ChatButton_OnLeave)
	lchattb:SetScript('OnClick', ChatButton_OnClick)
	lchattb.text = lchattb:CreateFontString(nil, 'OVERLAY')
	lchattb.text:FontTemplate()
	lchattb.text:SetPoint('CENTER')
	lchattb.text:SetJustifyH('CENTER')
	lchattb.text:SetText('<')
	
	--Right Chat
	local rchat = CreateFrame('Frame', 'RightChatPanel', E.UIParent)
	rchat:SetFrameStrata('BACKGROUND')
	rchat:Width(420)
	rchat:Height(180)
	rchat:Point('BOTTOMRIGHT', E.UIParent, 0, 0)
	rchat:CreateBackdrop('Transparent')
	rchat.backdrop:SetAllPoints()
	
	--Background Texture
	rchat.tex = rchat:CreateTexture(nil, 'OVERLAY')
	rchat.tex:Point('TOPLEFT', rchat, 'TOPLEFT', 2, -2)
	rchat.tex:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -2, 2)
	rchat.tex:SetTexture(E.db.general.panelBackdropNameRight)
	rchat.tex:SetAlpha(E.db.general.backdropfadecolor.a - 0.7 > 0 and E.db.general.backdropfadecolor.a - 0.7 or 0.5)	
	
	--Right Chat Tab
	local rchattab = CreateFrame('Frame', 'RightChatTab', RightChatPanel)
	rchattab:Point('TOPRIGHT', rchat, 'TOPRIGHT', -2, -2)
	rchattab:Point('BOTTOMLEFT', rchat, 'TOPLEFT', 2, -PANEL_HEIGHT)
	rchattab:SetTemplate('Default', true)
	
	--Right Chat Data Panel
	local rchatdp = CreateFrame('Frame', 'RightChatDataPanel', RightChatPanel)
	rchatdp:Point('BOTTOMLEFT', rchat, 'BOTTOMLEFT', 5, 5)
	rchatdp:Point('TOPRIGHT', rchat, 'BOTTOMRIGHT', -(5 + SIDE_BUTTON_WIDTH), 5 + PANEL_HEIGHT)
	rchatdp:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rchatdp, 3, 'ANCHOR_TOPRIGHT', 17, 4)
	
	--Right Chat Toggle Button
	local rchattb = CreateFrame('Button', 'RightChatToggleButton', E.UIParent)
	rchattb.parent = RightChatPanel
	RightChatPanel.fadeFunc = ChatPanelRight_OnFade
	rchattb:Point('TOPLEFT', rchatdp, 'TOPRIGHT', 1, 0)
	rchattb:Point('BOTTOMRIGHT', rchat, 'BOTTOMRIGHT', -5, 5)
	rchattb:SetTemplate('Default', true)
	rchattb:SetScript('OnEnter', ChatButton_OnEnter)
	rchattb:SetScript('OnLeave', ChatButton_OnLeave)
	rchattb:SetScript('OnClick', ChatButton_OnClick)
	rchattb.text = rchattb:CreateFontString(nil, 'OVERLAY')
	rchattb.text:FontTemplate()
	rchattb.text:SetPoint('CENTER')
	rchattb.text:SetJustifyH('CENTER')
	rchattb.text:SetText('>')
	
	--Load Settings
	if E.db['LeftChatPanelFaded'] then
		LeftChatToggleButton:SetAlpha(0)
		LeftChatPanel:Hide()
	end	
	
	if E.db['RightChatPanelFaded'] then
		RightChatToggleButton:SetAlpha(0)
		RightChatPanel:Hide()
	end		
	
	self:ToggleChatPanels()
end

function LO:CreateMinimapPanels()
	local lminipanel = CreateFrame('Frame', 'LeftMiniPanel', Minimap)
	lminipanel:Point('TOPLEFT', Minimap, 'BOTTOMLEFT', -2, -3)
	lminipanel:Point('BOTTOMRIGHT', Minimap, 'BOTTOM', -1, -(3 + PANEL_HEIGHT))
	lminipanel:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(lminipanel, 1, 'ANCHOR_BOTTOMLEFT', lminipanel:GetWidth() * 2, -4)
	
	local rminipanel = CreateFrame('Frame', 'RightMiniPanel', Minimap)
	rminipanel:Point('TOPRIGHT', Minimap, 'BOTTOMRIGHT', 2, -3)
	rminipanel:Point('BOTTOMLEFT', Minimap, 'BOTTOM', 0, -(3 + PANEL_HEIGHT))
	rminipanel:SetTemplate('Default', true)
	E:GetModule('DataTexts'):RegisterPanel(rminipanel, 1, 'ANCHOR_BOTTOM', 0, -4)
	
	local configtoggle = CreateFrame('Button', 'ElvConfigToggle', Minimap)
	configtoggle:Point('TOPLEFT', rminipanel, 'TOPRIGHT', 1, 0)
	configtoggle:Point('BOTTOMLEFT', rminipanel, 'BOTTOMRIGHT', 1, 0)
	configtoggle:Width(E.RBRWidth)
	configtoggle:SetTemplate('Default', true)
	configtoggle.text = configtoggle:CreateFontString(nil, 'OVERLAY')
	configtoggle.text:FontTemplate()
	configtoggle.text:SetText('C')
	configtoggle.text:SetPoint('CENTER')
	configtoggle.text:SetJustifyH('CENTER')
	configtoggle:SetScript('OnClick', function() E:ToggleConfig() end)
end

-- Новые панели инфотекстов
function LO:CreateDataPanels()
	--Нижняя двойная панель
	local bottom_bar = CreateFrame('Frame', "Bottom_Panel", E.UIParent)
	bottom_bar:SetTemplate('Default', true)
	bottom_bar:SetFrameStrata('LOW')
	bottom_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", Top_Panel, "BOTTOMLEFT", 0, -E.mult); 
		self:Size(685, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Bottom_Panel, 3, 'ANCHOR_BOTTOM', 0, -4)
	bottom_bar:Hide()
	
	--Верхняя двойная панель
	local top_bar = CreateFrame('Frame', 'Top_Panel', E.UIParent)
	top_bar:SetTemplate('Default', true)
	top_bar:SetFrameStrata('LOW')
	top_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", ElvUI_Bar1, "BOTTOMLEFT", 0, -E.mult); 
		self:Size(685, 22);
		E:CreateMover(self, "BottomBarMover", "Двойная панель") 
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Panel, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_bar:Hide()
	
	--Панель у карты
	local map = CreateFrame('Frame', 'Map_Panel', E.UIParent)
	map:Point("TOPLEFT", E.UIParent, "BOTTOMLEFT", 0, -E.mult)
	map:SetTemplate('Default', true)
	map:SetFrameStrata('LOW')
	map:Hide()
	map:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", Minimap, "BOTTOMLEFT", -2, -26); 
		self:Size(211, 20)
		E:CreateMover(map, "MapBarMover", "Панель карты") 
	end)
	E:GetModule('DataTexts'):RegisterPanel(Map_Panel, 1, 'ANCHOR_BOTTOM', 0, -4)
	
	--Верхняя левая крайняя панель
	local top_left_bar = CreateFrame('Frame', "Top_Left", E.UIParent)
	top_left_bar:SetTemplate('Default', true)
	top_left_bar:SetFrameStrata('LOW')
	top_left_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", E.UIParent, "TOPLEFT", 0, 0); 
		self:Size(386, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Left, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_left_bar:Hide()
	
	--Верхняя правая крайняя панель
	local top_right_bar = CreateFrame('Frame', "Top_Right", E.UIParent)
	top_right_bar:SetTemplate('Default', true)
	top_right_bar:SetFrameStrata('LOW')
	top_right_bar:SetScript('OnShow', function(self) 
		self:Point("TOPRIGHT", E.UIParent, "TOPRIGHT", 0, 0); 
		self:Size(386, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Right, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_right_bar:Hide()
	
	--Верхняя правая панель
	local top_center_right_bar = CreateFrame('Frame', "Top_Center_Right", E.UIParent)
	top_center_right_bar:SetTemplate('Default', true)
	top_center_right_bar:SetFrameStrata('LOW')
	top_center_right_bar:SetScript('OnShow', function(self) 
		self:Point("TOPRIGHT", Top_Right, "TOPLEFT", -1, 0); 
		self:Size(386, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center_Right, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_center_right_bar:Hide()
	
	--Верхняя левая панель
	local top_center_left_bar = CreateFrame('Frame', "Top_Center_Left", E.UIParent)
	top_center_left_bar:SetTemplate('Default', true)
	top_center_left_bar:SetFrameStrata('LOW')
	top_center_left_bar:SetScript('OnShow', function(self) 
		self:Point("TOPLEFT", Top_Left, "TOPRIGHT", 1, 0); 
		self:Size(386, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center_Left, 3, 'ANCHOR_BOTTOM', 0, -4)
	top_center_left_bar:Hide()
	
	--Верхняя центральная панель
	local top_center_bar = CreateFrame('Frame', "Top_Center", E.UIParent)
	top_center_bar:SetTemplate('Default', true)
	top_center_bar:SetFrameStrata('LOW')
	top_center_bar:SetScript('OnShow', function(self) 
		self:Point("TOP", E.UIParent, "TOP", 0, 0); 
		self:Size(551, 22);
	end)
	E:GetModule('DataTexts'):RegisterPanel(Top_Center, 1, 'ANCHOR_BOTTOM', 0, -4)
	top_center_bar:Hide()

end

--Отображать панели
function ExtraDataBarSetup()
Top_Panel:Show()
Bottom_Panel:Show()
Map_Panel:Show()
Top_Left:Show()
Top_Right:Show()
Top_Center_Right:Show()
Top_Center_Left:Show()
Top_Center:Show()
end

--Обновлять панели на каждый экран загрузки
function LO:PLAYER_ENTERING_WORLD(...)
ExtraDataBarSetup()
self:UnregisterEvent("PLAYER_ENTERING_WORLD");
end
--Конец добавления панелей
LO:RegisterEvent('PLAYER_ENTERING_WORLD')
E:RegisterModule(LO:GetName())