-- config pattern taken from https://www.youtube.com/watch?v=LZmN1NN71qQ
-- supposedly a good approach to handling multiple devices
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
	orientation =
    {
        default = "landscapeRight",
        supported = {"landscapeRight", "landscapeLeft"}
    },
	content = {
		width = aspectRatio > 1.5 and 320 or math.ceil(480 / aspectRatio),
		height = aspectRatio < 1.5 and 480 or math.ceil(320 * aspectRatio),
		scale = "letterBox",
		fps = 60,

		imageSuffix = {
			["@2x"] = 1.3
		}
	}   
}