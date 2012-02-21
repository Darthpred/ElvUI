﻿local E, L, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, ProfileDB, GlobalDB

--Core
P['general'] = {
	["autoscale"] = true,
	["stickyFrames"] = true,
	['loginmessage'] = true,
	["interruptAnnounce"] = "NONE",
	["autoRepair"] = "NONE",
	['autoAcceptInvite'] = false,
	
	-- fonts
	["fontsize"] = 12,
	["font"] = "ElvUI Font",
	
	--colors
	["bordercolor"] = { r = .31,g = .31,b = .31 },
	["backdropcolor"] = { r = .1,g = .1,b = .1 },
	["backdropfadecolor"] = { r = .06,g = .06,b = .06, a = 0.9 },
	["valuecolor"] = {r = 23/255,g = 132/255,b = 209/255},
	
	--panels
	['panelWidth'] = 412,
	['panelHeight'] = 180,
	['panelBackdropNameLeft'] = '',
	['panelBackdropNameRight'] = '',
	['panelBackdrop'] = 'SHOWBOTH',
	['expRepPos'] = 'TOP_SCREEN',
	
	--misc
	['mapTransparency'] = 0.5,
};

--NamePlate
P["nameplate"] = {
	["markBGHealers"] = true,
	["width"] = 113,
	["height"] = 8,
	["cbheight"] = 5,
	["showlevel"] = true,
	["enhancethreat"] = true,
	["combat"] = false,
	["showhealth"] = false,
	["trackauras"] = false,
	["trackfilter"] = 'CCDebuffs',
	['goodscale'] = 1,
	['badscale'] = 1,
	["goodcolor"] = {r = 75/255,  g = 175/255, b = 76/255},
	["badcolor"] = {r = 0.78, g = 0.25, b = 0.25},
	["goodtransitioncolor"] = {r = 218/255, g = 197/255, b = 92/255},
	["badtransitioncolor"] = {r = 240/255, g = 154/255, b = 17/255}, 	
	["friendlynpc"] = {r = 0.31, g = 0.45, b = 0.63},
	["friendlyplayer"] = {r = 75/255,  g = 175/255, b = 76/255},
	["neutral"] = { r = 218/255, g = 197/255, b = 92/255 },
	["enemy"] = { r = 0.78, g = 0.25, b = 0.25 },	
};

--Auras
P['auras'] = {
	['perRow'] = 16,
}

--Chat
P['chat'] = {
	['url'] = true;
	['shortChannels'] = true;
}

--ClassTimers
P['classtimer'] = {
	['player'] = {
		['enable'] = true,
		['anchor'] = 'PLAYERDEBUFFS',
		["buffcolor"] = P.general.bordercolor,
		["debuffcolor"] = {r = 0.78, g = 0.25, b = 0.25},		
	},
	['target'] = {
		['enable'] = true,
		['anchor'] = 'TARGETDEBUFFS',
		["buffcolor"] = P.general.bordercolor,
		["debuffcolor"] = {r = 0.78, g = 0.25, b = 0.25},			
	},	
	['trinket'] = {
		['enable'] = true,
		['anchor'] = 'PLAYERANCHOR',
		["color"] = {r = 0.84, g = 0.75, b = 0.65},			
	},
}

--Skins
P['skins'] = {
	['embedRight'] = '',
}

--Datatexts
P['datatexts'] = {
	['panels'] = {
		['LeftChatDataPanel'] = {
			['left'] = 'Armor',
			['middle'] = 'Durability',
			['right'] = 'Avoidance',
		},
		['RightChatDataPanel'] = {
			['left'] = 'System',
			['middle'] = 'Time',	
			['right'] = 'Gold',
},
		['LeftMiniPanel'] = 'Guild',
		['RightMiniPanel'] = 'Friends',
	},
	['localtime'] = true,
	['time24'] = false,
	['specswap'] = true,
}

--Tooltip
P['tooltip'] = {
	['anchor'] = 'SMART',
	['ufhide'] = false,
	['whostarget'] = true,
	['combathide'] = false,
}

--UnitFrame
P['unitframe'] = {
	['smoothbars'] = true,
	['statusbar'] = "Minimalist",
	['font'] = 'ElvUI Font',
	['fontsize'] = 12,
	['fontoutline'] = 'OUTLINE',
	['OORAlpha'] = 0.35,
	['debuffHighlighting'] = true,
	["smartRaidFilter"] = true,

	['colors'] = {
		['healthclass'] = false,
		['powerclass'] = false,
		['colorhealthbyvalue'] = true,
		['customhealthbackdrop'] = false,
		['classbackdrop'] = false,
	
		['health'] = P.general.bordercolor,
		['health_backdrop'] = { r = .8,g = .01,b = .01 },
		['tapped'] = { r = 0.55, g = 0.57, b = 0.61},
		['disconnected'] = { r = 0.84, g = 0.75, b = 0.65},
		['power'] = {
			["MANA"] = {r = 0.31, g = 0.45, b = 0.63},
			["RAGE"] = {r = 0.78, g = 0.25, b = 0.25},
			["FOCUS"] = {r = 0.71, g = 0.43, b = 0.27},
			["ENERGY"] = {r = 0.65, g = 0.63, b = 0.35},
			["RUNIC_POWER"] = {r = 0, g = 0.82, b = 1},
		},
		['reaction'] = {
			['BAD'] = { r = 0.78, g = 0.25, b = 0.25 },
			['NEUTRAL'] = { r = 218/255, g = 197/255, b = 92/255 },
			['GOOD'] = { r = 75/255, g = 175/255, b = 76/255 },
		},
	},

	['units'] = {
		['player'] = {
			['enable'] = true,
			['width'] = 260,
			['height'] = 53,
			['lowmana'] = 30,
			['combatfade'] = false,
			['healPrediction'] = true,
			['health'] = {
				['text'] = true,
				['text_format'] = 'current-percent',
				['position'] = 'LEFT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = true,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 10,
				['offset'] = 0,
				['position'] = 'RIGHT',
				['hideonnpc'] = false,
			},
			['altpower'] = {
				['enable'] = true,
				['width'] = 260,
				['height'] = 18,
			},
			['name'] = {
				['enable'] = false,
				['position'] = 'CENTER',
			},
			['portrait'] = {
				['enable'] = false,
				['width'] = 45,
				['overlay'] = false,
				['camDistanceScale'] = 1,
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'DEBUFFS',
				['anchorPoint'] = 'TOPLEFT',
				['fontsize'] = 10,
				['showPlayerOnly'] = true,
				['useFilter'] = 'TurtleBuffs',
				['durationLimit'] = 900,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'TOPRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},
			['castbar'] = {
				['enable'] = true,
				['width'] = 260,
				['height'] = 18,
				['icon'] = true,
				['latency'] = true,
				['color'] = P.general.bordercolor,
				['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
				['xOffset'] = 0,
				['yOffset'] = 0,
				['format'] = 'REMAINING',
				["ticks"] = true,
				['spark'] = true,
			},
			['classbar'] = {
				['enable'] = true,
				['fill'] = 'spaced',
				['height'] = 9,
			},
		},	
		['target'] = {
			['enable'] = true,
			['width'] = 260,
			['height'] = 53,
			['healPrediction'] = true,
			['health'] = {
				['text'] = true,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = true,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 10,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['portrait'] = {
				['enable'] = false,
				['width'] = 45,
				['overlay'] = false,
				['camDistanceScale'] = 1,
			},
			['buffs'] = {
				['enable'] = true,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'TOPRIGHT',						
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMRIGHT',
				['attachTo'] = 'BUFFS',
				['anchorPoint'] = 'TOPRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = true,
				['useFilter'] = 'CCDebuffs',	
				['durationLimit'] = 0,
			},
			['castbar'] = {
				['enable'] = true,
				['width'] = 260,
				['height'] = 18,
				['icon'] = true,
				['color'] = P.general.bordercolor,
				['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
				['xOffset'] = 0,
				['yOffset'] = 0,
				['format'] = 'REMAINING',
				['spark'] = true,
			},	
			['combobar'] = {
				['enable'] = true,
				['fill'] = 'spaced',
				['height'] = 9,
			},				
		},
		['targettarget'] = {
			['enable'] = true,
			['width'] = 130,
			['height'] = 35,
			['health'] = {
				['text'] = false,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMLEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 5,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'TOPRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},			
		},
		['focus'] = {
			['enable'] = true,
			['width'] = 190,
			['height'] = 35,
			['healPrediction'] = true,
			['health'] = {
				['text'] = false,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMLEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 5,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'TOPRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},	
			['castbar'] = {
				['enable'] = true,
				['width'] = 190,
				['height'] = 18,
				['icon'] = true,
				['color'] = P.general.bordercolor,
				['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
				['xOffset'] = 0,
				['yOffset'] = 0,
				['format'] = 'REMAINING',
				['spark'] = true,
			},					
		},	
		['focustarget'] = {
			['enable'] = false,
			['width'] = 190,
			['height'] = 25,
			['health'] = {
				['text'] = false,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = false,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMLEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = false,
				['perrow'] = 5,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'TOPRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},			
		},				
		['pet'] = {
			['enable'] = true,
			['width'] = 130,
			['height'] = 35,
			['healPrediction'] = true,
			['health'] = {
				['text'] = false,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMLEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = false,
				['perrow'] = 5,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'TOPRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},			
		},
		['pettarget'] = {
			['enable'] = false,
			['width'] = 130,
			['height'] = 25,
			['health'] = {
				['text'] = false,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = false,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = true,					
			},
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 7,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'UP',
				['initialAnchor'] = 'BOTTOMLEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMLEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = false,
				['perrow'] = 5,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'TOPRIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'BOTTOMRIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'DebuffBlacklist',	
				['durationLimit'] = 0,
			},			
		},	
		['boss'] = {
			['enable'] = true,
			['growthDirection'] = 'UP',
			['width'] = 215,
			['height'] = 45,
			['health'] = {
				['text'] = true,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = true,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = false,					
			},
			['portrait'] = {
				['enable'] = false,
				['width'] = 35,
				['overlay'] = false,
				['camDistanceScale'] = 1,
			},				
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = true,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'RIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'LEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'LEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'RIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = true,
				['useFilter'] = '',	
				['durationLimit'] = 0,
			},	
			['castbar'] = {
				['enable'] = true,
				['width'] = 215,
				['height'] = 18,
				['icon'] = true,
				['color'] = P.general.bordercolor,
				['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
				['format'] = 'REMAINING',
				['spark'] = true,
			},					
		},	
		['arena'] = {
			['enable'] = true,
			['growthDirection'] = 'UP',
			['pvpTrinket'] = true,
			['width'] = 240,
			['height'] = 45,
			['health'] = {
				['text'] = true,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
			},
			['power'] = {
				['enable'] = true,
				['text'] = true,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'LEFT',
				['hideonnpc'] = false,					
			},			
			['name'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},
			['buffs'] = {
				['enable'] = true,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'RIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'LEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'TurtleBuffs',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'LEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'RIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = 'CCDebuffs',	
				['durationLimit'] = 0,
			},	
			['castbar'] = {
				['enable'] = true,
				['width'] = 240,
				['height'] = 18,
				['icon'] = true,
				['color'] = P.general.bordercolor,
				['interruptcolor'] = { r = 0.78, g = 0.25, b = 0.25 },
				['format'] = 'REMAINING',
				['spark'] = true,
			},					
		},
		['party'] = {
			['enable'] = true,
			['visibility'] = "[@raid6,exists] hide;show",
			['point'] = 'TOP', --Requires ReloadUI()
			['maxColumns'] = 1,
			['unitsPerColumn'] = 5,
			['columnSpacing'] = 3,
			['xOffset'] = 0,
			['yOffset'] = -3,
			['groupBy'] = 'GROUP',
			["showParty"] = true,
			["showRaid"] = true,
			["showSolo"] = false,
			["showPlayer"] = true,
			['healPrediction'] = false,
			['columnAnchorPoint'] = "TOP",
			['width'] = 180,
			['height'] = 43,
			['health'] = {
				['text'] = true,
				['text_format'] = 'current-percent',
				['position'] = 'RIGHT',
				['orientation'] = 'HORIZONTAL',
			},
			['power'] = {
				['enable'] = true,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'BOTTOMRIGHT',
				['hideonnpc'] = false,					
			},			
			['name'] = {
				['enable'] = true,
				['position'] = 'LEFT',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'RIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'LEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = true,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'LEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'RIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',	
				['durationLimit'] = 0,
			},	
			['buffIndicator'] = {
				['enable'] = true,
				['size'] = 6,
				['fontsize'] = 8,
				['colorIcons'] = true,
			},
			['roleIcon'] = {
				['enable'] = true,
				['position'] = 'CENTER',
			},			
			['petsGroup'] = {
				['enable'] = false,
				['width'] = 100,
				['height'] = 22,
				['initialAnchor'] = 'TOPRIGHT',
				['anchorPoint'] = 'TOPLEFT',
				['xOffset'] = -1,
				['yOffset'] = 0,
			},
			['targetsGroup'] = {
				['enable'] = false,
				['width'] = 100,
				['height'] = 22,
				['initialAnchor'] = 'TOPRIGHT',
				['anchorPoint'] = 'TOPLEFT',
				['xOffset'] = -1,
				['yOffset'] = 0,
			},				
		},
		['raid625'] = {
			['enable'] = true,
			['visibility'] = '[@raid6,noexists][@raid26,exists] hide;show',
			['point'] = 'LEFT',
			['maxColumns'] = 5,
			['unitsPerColumn'] = 5,
			['columnSpacing'] = 3,
			['xOffset'] = 3,
			['yOffset'] = -3,
			['groupBy'] = 'GROUP',
			["showParty"] = true,
			["showRaid"] = true,
			["showSolo"] = false,
			["showPlayer"] = true,
			['healPrediction'] = false,
			['columnAnchorPoint'] = "TOP",
			['width'] = 80,
			['height'] = 44,
			['health'] = {
				['text'] = true,
				['text_format'] = 'deficit',
				['position'] = 'BOTTOM',
				['orientation'] = 'HORIZONTAL',
			},
			['power'] = {
				['enable'] = true,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'BOTTOMRIGHT',
				['hideonnpc'] = false,					
			},			
			['name'] = {
				['enable'] = true,
				['position'] = 'TOP',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'RIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'LEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = false,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'LEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'RIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',	
				['durationLimit'] = 0,
			},	
			['buffIndicator'] = {
				['enable'] = true,
				['size'] = 6,
				['fontsize'] = 8,
				['colorIcons'] = true,
			},
			['rdebuffs'] = {
				['enable'] = true,
				['fontsize'] = 10,
				['size'] = 26,
			},
			['roleIcon'] = {
				['enable'] = false,
				['position'] = 'BOTTOM',
			},					
		},					
		['raid2640'] = {
			['enable'] = true,
			['visibility'] = '[@raid26,noexists] hide;show',
			['point'] = 'LEFT',
			['maxColumns'] = 8,
			['unitsPerColumn'] = 5,
			['columnSpacing'] = 3,
			['xOffset'] = 3,
			['yOffset'] = -3,
			['groupBy'] = 'GROUP',
			["showParty"] = true,
			["showRaid"] = true,
			["showSolo"] = false,
			["showPlayer"] = true,
			['healPrediction'] = false,
			['columnAnchorPoint'] = "TOP",
			['width'] = 80,
			['height'] = 36,
			['health'] = {
				['text'] = true,
				['text_format'] = 'deficit',
				['position'] = 'BOTTOM',
				['orientation'] = 'HORIZONTAL',
			},
			['power'] = {
				['enable'] = false,
				['text'] = false,
				['text_format'] = 'current',	
				['width'] = 'fill',
				['height'] = 7,
				['offset'] = 0,
				['position'] = 'BOTTOMRIGHT',
				['hideonnpc'] = false,					
			},			
			['name'] = {
				['enable'] = true,
				['position'] = 'TOP',
			},
			['buffs'] = {
				['enable'] = false,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'LEFT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'RIGHT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'LEFT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',		
				['durationLimit'] = 0,
			},
			['debuffs'] = {
				['enable'] = false,
				['perrow'] = 3,
				['numrows'] = 1,
				['growth-x'] = 'RIGHT',
				['growth-y'] = 'DOWN',
				['initialAnchor'] = 'LEFT',
				['attachTo'] = 'FRAME',
				['anchorPoint'] = 'RIGHT',					
				['fontsize'] = 10,
				['showPlayerOnly'] = false,
				['useFilter'] = '',	
				['durationLimit'] = 0,
			},	
			['buffIndicator'] = {
				['enable'] = true,
				['size'] = 6,
				['fontsize'] = 8,
				['colorIcons'] = true,
			},			
		},	
		['tank'] = {
			['enable'] = true,
			['width'] = 120,
			['height'] = 28,
		},	
		['assist'] = {
			['enable'] = true,
			['width'] = 120,
			['height'] = 28,
		},					
	},
}

--[[
Healer Layout Settings
['Secondary'] = {
	['boss'] = {
	['width'] = 200,
	['castbar'] = {
		['width'] = 200,
	},				
	},
	['arena'] = {
	['width'] = 200,
	['castbar'] = {
		['width'] = 200,
	},				
	},
	['party'] = {
	['point'] = 'LEFT',
	['xOffset'] = 1,
	['healPrediction'] = true,
	["columnAnchorPoint"] = "LEFT",
	["width"] = 80,
	["height"] = 52,
	['health'] = {
		["text_format"] = "deficit",
		["position"] = "BOTTOM",
		['orientation'] = 'VERTICAL',
	},
	['name'] = {
		["position"] = "TOP",
	},
	['debuffs'] = {
		["anchorPoint"] = "BOTTOMLEFT",
		["initialAnchor"] = "TOPLEFT",
		['useFilter'] = 'DebuffBlacklist',		
	},
	['petsGroup'] = {
		['enable'] = true,
		['width'] = 80,
		['initialAnchor'] = 'BOTTOM',
		['anchorPoint'] = 'TOP',
		['xOffset'] = 0,
		['yOffset'] = 1,
	},		
	['targetsGroup'] = {
		['enable'] = false,
		['width'] = 80,
		['initialAnchor'] = 'BOTTOM',
		['anchorPoint'] = 'TOP',
		['xOffset'] = 0,
		['yOffset'] = 1,
	},					
	},
	['raid625'] = {
	['healPrediction'] = true,
	['health'] = {
		['orientation'] = 'VERTICAL',
	},
	},
	['raid2640'] = {
	['healPrediction'] = true,
	['health'] = {
		['orientation'] = 'VERTICAL',
	},				
	},
	["positions"] = {
	["ElvUF_Player"] = "BOTTOMLEFTUIParent464242",
	["ElvUF_Target"] = "BOTTOMRIGHTUIParent-464242",
	["ElvUF_Raid2640"] = "BOTTOMUIParent050",
	["ElvUF_Raid625"] = "BOTTOMUIParent050",
	["ElvUF_TargetTarget"] = "BOTTOMRIGHTUIParent-464151",
	["ElvUF_Focus"] = "RIGHTUIParent-475-143",
	["ElvUF_Party"] = "BOTTOMUIParent074",
	["ElvUF_Pet"] = "BOTTOMLEFTUIParent464151",
	},					
}]]

--Actionbar
P["actionbar"] = {
	["macrotext"] = false,
	["hotkeytext"] = true,
	['fontsize'] = 11,
	["enablecd"] = true,
	["treshold"] = 3,
	["expiringcolor"] = { r = 1, g = 0, b = 0 },
	["secondscolor"] = { r = 1, g = 1, b = 0 },
	["minutescolor"] = { r = 1, g = 1, b = 1 },
	["hourscolor"] = { r = 0.4, g = 1, b = 1 },
	["dayscolor"] = { r = 0.4, g = 0.4, b = 1 },	
	['bar1'] = {
		['enabled'] = true,
		['buttons'] = 12,
		['mouseover'] = false,
		['buttonsPerRow'] = 12,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,		
		['paging'] = {
			["DRUID"] = "[bonusbar:1,nostealth] 7; [bonusbar:1,stealth] 8; [bonusbar:2] 8; [bonusbar:3] 9; [bonusbar:4] 10;",
			["WARRIOR"] = "[bonusbar:1] 7; [bonusbar:2] 8; [bonusbar:3] 9;",
			["PRIEST"] = "[bonusbar:1] 7;",
			["ROGUE"] = "[bonusbar:1] 7; [form:3] 7;",	
		},
		['visibility'] = "",
	},
	['bar2'] = {
		['enabled'] = false,
		['mouseover'] = false,
		['buttons'] = 12,
		['buttonsPerRow'] = 12,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = false,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,		
		['paging'] = {},
		['visibility'] = "[vehicleui] hide;show",
	},
	['bar3'] = {
		['enabled'] = true,
		['mouseover'] = false,
		['buttons'] = 6,
		['buttonsPerRow'] = 6,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,
		['paging'] = {},
		['visibility'] = "[vehicleui] hide;show",
	},
	['bar4'] = {
		['enabled'] = true,
		['mouseover'] = false,
		['buttons'] = 12,
		['buttonsPerRow'] = 1,
		['point'] = 'TOPRIGHT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,
		['paging'] = {},
		['visibility'] = "[vehicleui] hide;show",
	},
	['bar5'] = {
		['enabled'] = true,
		['mouseover'] = false,
		['buttons'] = 6,
		['buttonsPerRow'] = 6,
		['point'] = 'BOTTOMLEFT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,
		['paging'] = {},
		['visibility'] = "[vehicleui] hide;show",
	},
	['barPet'] = {
		['enabled'] = true,
		['mouseover'] = false,
		['buttons'] = NUM_PET_ACTION_SLOTS,
		['buttonsPerRow'] = 1,
		['point'] = 'TOPRIGHT',
		['backdrop'] = true,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,
		['visibility'] = "[pet,novehicleui,nobonusbar:5] show;hide",
	},
	['barShapeShift'] = {
		['enabled'] = true,
		['mouseover'] = false,
		['buttonsPerRow'] = NUM_SHAPESHIFT_SLOTS,
		['buttons'] = NUM_SHAPESHIFT_SLOTS,
		['point'] = 'TOPLEFT',
		['backdrop'] = false,
		['heightMult'] = 1,
		['widthMult'] = 1,
		["buttonsize"] = 30,
		["buttonspacing"] = 4,
	},
	['barTotem'] = {
		['enabled'] = true,
		['mouseover'] = false,
	},
};