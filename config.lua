Config = {}

-- LED-Colour´s
Config.LEDs = {
    ['Red Light']     = { r = 255, g = 0,   b = 0   },
    ['Green Light']   = { r = 0,   g = 255, b = 0   },
    ['Blue Light']    = { r = 0,   g = 0,   b = 255 },
    ['Yellow Light']  = { r = 255, g = 255, b = 0   },
    ['Cyan Light']    = { r = 0,   g = 255, b = 255 },
    ['Magenta Light'] = { r = 255, g = 0,   b = 255 },
    ['White Light']   = { r = 255, g = 255, b = 255 }
}

-- Menu position (optional, NativeUI uses its own)
Config.Menu = {
    x = 725,
    y = 35
}

-- Localization
Config.Locales = {
    ['keybind']      = 'Open LED Color Menu',
    ['menuTitle']    = 'LED COLOR MENU',
    ['menuSubtitle'] = 'CHANGE YOUR LED COLOR',
    ['menuNoCar']    = 'You are not in a Vehicle!',
    ['menuNoLED']    = 'This Car doesn\'t support custom LEDs!',
    ['ledChanged']   = 'LED color changed to %s!',
    ['menuClose']    = 'Close Menu'
}

-- Defaultcolour for LED
Config.DefaultLED = { r = 255, g = 255, b = 255 } -- White
