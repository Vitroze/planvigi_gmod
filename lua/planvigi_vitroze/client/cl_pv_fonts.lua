RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

surface.CreateFont( "PV_BreakingNews", {
    font     = "Montserrat",
    extended = true,
    size     = RX(36), 
    weight   = 1000
})

surface.CreateFont( "PV_BreakingNewsTitle", {
    font     = "Montserrat Black",
    extended = true,
    size     = RX(40),
    weight   = 1000
})

surface.CreateFont( "PV_BreakingNewsText", {
    font     = "Montserrat Medium",
    extended = true,
    size     = RX(24),
    weight   = 500
})

surface.CreateFont( "PV_PhoneText_US", {
    font     = "VT323",
    extended = true,
    size     = RX(22),
    weight   = 500
})


surface.CreateFont( "PV_TextMenu", {
    font     = "Montserrat",
    extended = true,
    size     = RX(42),
    weight   = 1000
})


surface.CreateFont( "PV_PhoneTitle_FR", {
    font     = "Archivo",
    extended = true,
    size     = RX(24),
    weight   = 1000
})


surface.CreateFont( "PV_TextePhone_FR", {
    font     = "Archivo Medium",
    extended = true,
    size     = RX(18),
    weight   = 1000
})