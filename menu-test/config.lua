-- config pattern taken from https://www.youtube.com/watch?v=LZmN1NN71qQ
-- supposedly a good approach to handle scaling across multiple devices
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
	content = {
		-- can change static values (320 & 480) to alter global scale (should keep same 2:3 ratio)
		width = aspectRatio > 1.5 and 320 or math.ceil(480 / aspectRatio),
		height = aspectRatio < 1.5 and 480 or math.ceil(320 * aspectRatio),
		scale = "letterBox",
		fps = 60,

		imageSuffix = {
			["@2x"] = 1.3
		}
	}   
}