local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB
local B = E:GetModule('Blizzard');

local chatbubblehook = CreateFrame("Frame", nil, E.UIParent)
local noscalemult = E.mult * (GetCVar('uiScale') or UIParent:GetScale())
local tslu = 0
local numkids = 0

local function skinbubble(frame)
	for i=1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		elseif region:GetObjectType() == "FontString" then
			frame.text = region
		end
	end
	
	frame:SetBackdrop({
		bgFile = E["media"].blankTex,
		edgeFile = E["media"].blankTex,
		tile = false, tileSize = 0, edgeSize = noscalemult,
		insets = {left = -noscalemult, right = -noscalemult, top = -noscalemult, bottom = -noscalemult}
	})
	frame:SetBackdropBorderColor(unpack(E["media"].bordercolor))	
	frame:SetBackdropColor(.1, .1, .1, .8)
	frame:SetClampedToScreen(false)
end

local function ischatbubble(frame)
	if frame:GetName() then return end
	if not frame:GetRegions() then return end
	return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
end

chatbubblehook:SetScript("OnUpdate", function(chatbubblehook, elapsed)
	tslu = tslu + elapsed
	if tslu < .1 then return end

	tslu = 0

	local newnumkids = WorldFrame:GetNumChildren()
	if newnumkids ~= numkids then
		for i=numkids + 1, newnumkids do
			local frame = select(i, WorldFrame:GetChildren())

			if ischatbubble(frame) then
				skinbubble(frame)
			end
		end
		numkids = newnumkids
	end	
end)

function B:Bubbles()

end