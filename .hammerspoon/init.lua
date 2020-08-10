local inputEnglish = "com.apple.keylayout.ABC"
local inputKorean = "com.apple.inputmethod.Korean.2SetKorean"
local inputJapanese = "com.apple.inputmethod.Kotoeri.Japanese"

function escEnglish()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	hs.eventtap.keyStroke({}, 'escape')
end

function toggle()
	local inputSource = hs.keycodes.currentSourceID()
	if inputSource == inputEnglish then
		hs.keycodes.currentSourceID(inputKorean)
	else
		hs.keycodes.currentSourceID(inputEnglish)
	end
end

hs.hotkey.bind({'control'}, 33, escEnglish)
hs.hotkey.bind({}, 'f13', toggle)
