# LED Color Menu for FiveM

This script allows players to change their vehicle's neon LED colors via a NativeUI menu.

## Features

- Opening the menu via a keybind (default: **F5**)
- NativeUI scrolling menu for LED colors
- Current LED color is preselected upon opening
- Players cannot move or rotate while the menu is open
- Compatible with all vehicles
- Chat messages inform about successes or failures

---

## Installation

1. Download the script and paste it into your `resources` folder, e.g.:

2. Ensure **NativeUI** is present:

- NativeUI GitHub: [https://github.com/FrazzIe/NativeUILua](https://github.com/FrazzIe/NativeUILua)
- Ensure the `NativeUI.lua` file is loaded correctly.

3. Add the following resource to your `server.cfg`:

```cfg
ensure ledmenu
ensure NativeUI
