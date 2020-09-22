local koreanLayout = "2-Set Korean"
local englishLayout = "ABC"

function escEnglish()
	local currentLayout = hs.keycodes.currentLayout()
	if not (currentLayout == englishLayout) then
		hs.keycodes.setLayout(englishLayout)
	end
	hs.eventtap.keyStroke({}, 'escape')
end

function toggle()
	local currentLayout = hs.keycodes.currentLayout()
	if currentLayout == englishLayout then
		hs.keycodes.setMethod(koreanLayout)
	else
		hs.keycodes.setLayout(englishLayout)
	end
end

hs.hotkey.bind({}, 'f20', escEnglish)
hs.hotkey.bind({'control'}, 33, escEnglish)
hs.hotkey.bind({}, 'f19', toggle)
hs.hotkey.bind({'shift'}, 'f19', toggle)
