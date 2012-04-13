local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local function LoadSkin()
	TellMeWhen_IconEditorMain:StripTextures()
	TellMeWhen_IconEditorConditions:StripTextures()
	TellMeWhen_IconEditor:StripTextures()
	TellMeWhen_IconEditorMainOptions:StripTextures()
	
	TellMeWhen_IconEditor:SetTemplate("Transparent")
	TellMeWhen_IconEditorMainOptions:SetTemplate("Transparent")
	
	S:HandleButton(TellMeWhen_IconEditorReset, true)
	S:HandleButton(TellMeWhen_IconEditorUndo, true)
	S:HandleButton(TellMeWhen_IconEditorRedo, true)

	S:HandleTab(TellMeWhen_IconEditorTab1)
	S:HandleTab(TellMeWhen_IconEditorTab2)
	S:HandleTab(TellMeWhen_IconEditorTab3)
	S:HandleTab(TellMeWhen_IconEditorTab4)
	S:HandleTab(TellMeWhen_IconEditorTab5)

	S:HandleButton(TellMeWhen_IconEditorOkay, true)
	S:HandleCloseButton(TellMeWhen_IconEditorClose, true)
end

S:RegisterSkin("TellMeWhen_Options", LoadSkin)