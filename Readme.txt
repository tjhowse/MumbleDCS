DCS Mumble Link
Author: Travis Howse
Email: tjhowse@gmail.com

This program and associated plugin create an interface between the radio systems in the DCS:A-10C simulator and the group VOIP program Mumble.

Version 0.1:
At present it only works for the UHF radio. To hear other pilots on your flight, tune your UHF radio to the same frequency as them.

Future versions:
Support for other radios.
Less fiddly install process.

Setup:
Copy MumbleExportDCS.lua into "...\DCS A-10C\Config\Export\".
Add "dofile("./Config/Export/MumbleExportDCS.lua")" to the end of "Export.lua", in that directory.
Open Mumble's settings and go to the "Audio Output" tab. Enable the "Advanced" checkbox in the bottom left if you can't see "Audio Output".
Enable "Positional Audio" at the top of the page.
Drag the sliders for "Minimum Distance" and "Maximum Distance" to 1m. Set "Minimum Volume" to 0%.
Go to the "Plugins" tab. Tick the "Link to Game and Transmit Position" box.
Apply Mumble settings.
Download MumbleDCS.exe and the DLLs, put them into a folder together.
Run MumbleDCS.exe.
Start DCS.
Enjoy.