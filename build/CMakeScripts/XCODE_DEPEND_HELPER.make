# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.boing.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/boing.app/Contents/MacOS/boing
/Users/yumeng/Desktop/specularAA/build/examples/Debug/boing.app/Contents/MacOS/boing:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/boing.app/Contents/MacOS/boing


PostBuild.clipboard.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/clipboard
/Users/yumeng/Desktop/specularAA/build/tests/Debug/clipboard:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/clipboard


PostBuild.cursor.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/cursor
/Users/yumeng/Desktop/specularAA/build/tests/Debug/cursor:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/cursor


PostBuild.empty.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/empty.app/Contents/MacOS/empty
/Users/yumeng/Desktop/specularAA/build/tests/Debug/empty.app/Contents/MacOS/empty:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/empty.app/Contents/MacOS/empty


PostBuild.events.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/events
/Users/yumeng/Desktop/specularAA/build/tests/Debug/events:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/events


PostBuild.gamma.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/gamma.app/Contents/MacOS/gamma
/Users/yumeng/Desktop/specularAA/build/tests/Debug/gamma.app/Contents/MacOS/gamma:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/gamma.app/Contents/MacOS/gamma


PostBuild.gears.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/gears.app/Contents/MacOS/gears
/Users/yumeng/Desktop/specularAA/build/examples/Debug/gears.app/Contents/MacOS/gears:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/gears.app/Contents/MacOS/gears


PostBuild.glfw.Debug:
/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.dylib:
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.dylib


PostBuild.glfwinfo.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/glfwinfo
/Users/yumeng/Desktop/specularAA/build/tests/Debug/glfwinfo:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/glfwinfo


PostBuild.heightmap.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/heightmap.app/Contents/MacOS/heightmap
/Users/yumeng/Desktop/specularAA/build/examples/Debug/heightmap.app/Contents/MacOS/heightmap:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/heightmap.app/Contents/MacOS/heightmap


PostBuild.icon.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/icon.app/Contents/MacOS/icon
/Users/yumeng/Desktop/specularAA/build/tests/Debug/icon.app/Contents/MacOS/icon:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/icon.app/Contents/MacOS/icon


PostBuild.iconify.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/iconify
/Users/yumeng/Desktop/specularAA/build/tests/Debug/iconify:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/iconify


PostBuild.inputlag.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/inputlag.app/Contents/MacOS/inputlag
/Users/yumeng/Desktop/specularAA/build/tests/Debug/inputlag.app/Contents/MacOS/inputlag:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/inputlag.app/Contents/MacOS/inputlag


PostBuild.joysticks.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/joysticks.app/Contents/MacOS/joysticks
/Users/yumeng/Desktop/specularAA/build/tests/Debug/joysticks.app/Contents/MacOS/joysticks:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/joysticks.app/Contents/MacOS/joysticks


PostBuild.monitors.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/monitors
/Users/yumeng/Desktop/specularAA/build/tests/Debug/monitors:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/monitors


PostBuild.msaa.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/msaa
/Users/yumeng/Desktop/specularAA/build/tests/Debug/msaa:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/msaa


PostBuild.offscreen.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/offscreen
/Users/yumeng/Desktop/specularAA/build/examples/Debug/offscreen:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/offscreen


PostBuild.opacity.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/opacity.app/Contents/MacOS/opacity
/Users/yumeng/Desktop/specularAA/build/tests/Debug/opacity.app/Contents/MacOS/opacity:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/opacity.app/Contents/MacOS/opacity


PostBuild.particles.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/particles.app/Contents/MacOS/particles
/Users/yumeng/Desktop/specularAA/build/examples/Debug/particles.app/Contents/MacOS/particles:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/particles.app/Contents/MacOS/particles


PostBuild.reopen.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/reopen
/Users/yumeng/Desktop/specularAA/build/tests/Debug/reopen:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/reopen


PostBuild.sharing.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/sharing.app/Contents/MacOS/sharing
/Users/yumeng/Desktop/specularAA/build/examples/Debug/sharing.app/Contents/MacOS/sharing:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/sharing.app/Contents/MacOS/sharing


PostBuild.simple.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/simple.app/Contents/MacOS/simple
/Users/yumeng/Desktop/specularAA/build/examples/Debug/simple.app/Contents/MacOS/simple:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/simple.app/Contents/MacOS/simple


PostBuild.splitview.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/splitview.app/Contents/MacOS/splitview
/Users/yumeng/Desktop/specularAA/build/examples/Debug/splitview.app/Contents/MacOS/splitview:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/splitview.app/Contents/MacOS/splitview


PostBuild.tearing.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/tearing.app/Contents/MacOS/tearing
/Users/yumeng/Desktop/specularAA/build/tests/Debug/tearing.app/Contents/MacOS/tearing:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/tearing.app/Contents/MacOS/tearing


PostBuild.threads.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/threads.app/Contents/MacOS/threads
/Users/yumeng/Desktop/specularAA/build/tests/Debug/threads.app/Contents/MacOS/threads:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/threads.app/Contents/MacOS/threads


PostBuild.timeout.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/timeout.app/Contents/MacOS/timeout
/Users/yumeng/Desktop/specularAA/build/tests/Debug/timeout.app/Contents/MacOS/timeout:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/timeout.app/Contents/MacOS/timeout


PostBuild.title.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/title.app/Contents/MacOS/title
/Users/yumeng/Desktop/specularAA/build/tests/Debug/title.app/Contents/MacOS/title:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/title.app/Contents/MacOS/title


PostBuild.triangle-vulkan.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/triangle-vulkan
/Users/yumeng/Desktop/specularAA/build/tests/Debug/triangle-vulkan:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/triangle-vulkan


PostBuild.wave.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/examples/Debug/wave.app/Contents/MacOS/wave
/Users/yumeng/Desktop/specularAA/build/examples/Debug/wave.app/Contents/MacOS/wave:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Debug/wave.app/Contents/MacOS/wave


PostBuild.windows.Debug:
PostBuild.glfw.Debug: /Users/yumeng/Desktop/specularAA/build/tests/Debug/windows.app/Contents/MacOS/windows
/Users/yumeng/Desktop/specularAA/build/tests/Debug/windows.app/Contents/MacOS/windows:\
	/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Debug/windows.app/Contents/MacOS/windows


PostBuild.boing.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/boing.app/Contents/MacOS/boing
/Users/yumeng/Desktop/specularAA/build/examples/Release/boing.app/Contents/MacOS/boing:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/boing.app/Contents/MacOS/boing


PostBuild.clipboard.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/clipboard
/Users/yumeng/Desktop/specularAA/build/tests/Release/clipboard:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/clipboard


PostBuild.cursor.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/cursor
/Users/yumeng/Desktop/specularAA/build/tests/Release/cursor:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/cursor


PostBuild.empty.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/empty.app/Contents/MacOS/empty
/Users/yumeng/Desktop/specularAA/build/tests/Release/empty.app/Contents/MacOS/empty:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/empty.app/Contents/MacOS/empty


PostBuild.events.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/events
/Users/yumeng/Desktop/specularAA/build/tests/Release/events:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/events


PostBuild.gamma.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/gamma.app/Contents/MacOS/gamma
/Users/yumeng/Desktop/specularAA/build/tests/Release/gamma.app/Contents/MacOS/gamma:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/gamma.app/Contents/MacOS/gamma


PostBuild.gears.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/gears.app/Contents/MacOS/gears
/Users/yumeng/Desktop/specularAA/build/examples/Release/gears.app/Contents/MacOS/gears:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/gears.app/Contents/MacOS/gears


PostBuild.glfw.Release:
/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.dylib:
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.dylib


PostBuild.glfwinfo.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/glfwinfo
/Users/yumeng/Desktop/specularAA/build/tests/Release/glfwinfo:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/glfwinfo


PostBuild.heightmap.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/heightmap.app/Contents/MacOS/heightmap
/Users/yumeng/Desktop/specularAA/build/examples/Release/heightmap.app/Contents/MacOS/heightmap:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/heightmap.app/Contents/MacOS/heightmap


PostBuild.icon.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/icon.app/Contents/MacOS/icon
/Users/yumeng/Desktop/specularAA/build/tests/Release/icon.app/Contents/MacOS/icon:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/icon.app/Contents/MacOS/icon


PostBuild.iconify.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/iconify
/Users/yumeng/Desktop/specularAA/build/tests/Release/iconify:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/iconify


PostBuild.inputlag.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/inputlag.app/Contents/MacOS/inputlag
/Users/yumeng/Desktop/specularAA/build/tests/Release/inputlag.app/Contents/MacOS/inputlag:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/inputlag.app/Contents/MacOS/inputlag


PostBuild.joysticks.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/joysticks.app/Contents/MacOS/joysticks
/Users/yumeng/Desktop/specularAA/build/tests/Release/joysticks.app/Contents/MacOS/joysticks:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/joysticks.app/Contents/MacOS/joysticks


PostBuild.monitors.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/monitors
/Users/yumeng/Desktop/specularAA/build/tests/Release/monitors:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/monitors


PostBuild.msaa.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/msaa
/Users/yumeng/Desktop/specularAA/build/tests/Release/msaa:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/msaa


PostBuild.offscreen.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/offscreen
/Users/yumeng/Desktop/specularAA/build/examples/Release/offscreen:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/offscreen


PostBuild.opacity.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/opacity.app/Contents/MacOS/opacity
/Users/yumeng/Desktop/specularAA/build/tests/Release/opacity.app/Contents/MacOS/opacity:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/opacity.app/Contents/MacOS/opacity


PostBuild.particles.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/particles.app/Contents/MacOS/particles
/Users/yumeng/Desktop/specularAA/build/examples/Release/particles.app/Contents/MacOS/particles:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/particles.app/Contents/MacOS/particles


PostBuild.reopen.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/reopen
/Users/yumeng/Desktop/specularAA/build/tests/Release/reopen:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/reopen


PostBuild.sharing.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/sharing.app/Contents/MacOS/sharing
/Users/yumeng/Desktop/specularAA/build/examples/Release/sharing.app/Contents/MacOS/sharing:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/sharing.app/Contents/MacOS/sharing


PostBuild.simple.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/simple.app/Contents/MacOS/simple
/Users/yumeng/Desktop/specularAA/build/examples/Release/simple.app/Contents/MacOS/simple:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/simple.app/Contents/MacOS/simple


PostBuild.splitview.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/splitview.app/Contents/MacOS/splitview
/Users/yumeng/Desktop/specularAA/build/examples/Release/splitview.app/Contents/MacOS/splitview:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/splitview.app/Contents/MacOS/splitview


PostBuild.tearing.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/tearing.app/Contents/MacOS/tearing
/Users/yumeng/Desktop/specularAA/build/tests/Release/tearing.app/Contents/MacOS/tearing:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/tearing.app/Contents/MacOS/tearing


PostBuild.threads.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/threads.app/Contents/MacOS/threads
/Users/yumeng/Desktop/specularAA/build/tests/Release/threads.app/Contents/MacOS/threads:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/threads.app/Contents/MacOS/threads


PostBuild.timeout.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/timeout.app/Contents/MacOS/timeout
/Users/yumeng/Desktop/specularAA/build/tests/Release/timeout.app/Contents/MacOS/timeout:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/timeout.app/Contents/MacOS/timeout


PostBuild.title.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/title.app/Contents/MacOS/title
/Users/yumeng/Desktop/specularAA/build/tests/Release/title.app/Contents/MacOS/title:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/title.app/Contents/MacOS/title


PostBuild.triangle-vulkan.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/triangle-vulkan
/Users/yumeng/Desktop/specularAA/build/tests/Release/triangle-vulkan:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/triangle-vulkan


PostBuild.wave.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/examples/Release/wave.app/Contents/MacOS/wave
/Users/yumeng/Desktop/specularAA/build/examples/Release/wave.app/Contents/MacOS/wave:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/Release/wave.app/Contents/MacOS/wave


PostBuild.windows.Release:
PostBuild.glfw.Release: /Users/yumeng/Desktop/specularAA/build/tests/Release/windows.app/Contents/MacOS/windows
/Users/yumeng/Desktop/specularAA/build/tests/Release/windows.app/Contents/MacOS/windows:\
	/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/Release/windows.app/Contents/MacOS/windows


PostBuild.boing.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/boing.app/Contents/MacOS/boing
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/boing.app/Contents/MacOS/boing:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/boing.app/Contents/MacOS/boing


PostBuild.clipboard.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/clipboard
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/clipboard:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/clipboard


PostBuild.cursor.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/cursor
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/cursor:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/cursor


PostBuild.empty.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/empty.app/Contents/MacOS/empty
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/empty.app/Contents/MacOS/empty:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/empty.app/Contents/MacOS/empty


PostBuild.events.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/events
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/events:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/events


PostBuild.gamma.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/gamma.app/Contents/MacOS/gamma
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/gamma.app/Contents/MacOS/gamma:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/gamma.app/Contents/MacOS/gamma


PostBuild.gears.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/gears.app/Contents/MacOS/gears
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/gears.app/Contents/MacOS/gears:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/gears.app/Contents/MacOS/gears


PostBuild.glfw.MinSizeRel:
/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.dylib:
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.dylib


PostBuild.glfwinfo.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/glfwinfo
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/glfwinfo:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/glfwinfo


PostBuild.heightmap.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/heightmap.app/Contents/MacOS/heightmap
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/heightmap.app/Contents/MacOS/heightmap:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/heightmap.app/Contents/MacOS/heightmap


PostBuild.icon.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/icon.app/Contents/MacOS/icon
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/icon.app/Contents/MacOS/icon:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/icon.app/Contents/MacOS/icon


PostBuild.iconify.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/iconify
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/iconify:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/iconify


PostBuild.inputlag.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/inputlag.app/Contents/MacOS/inputlag
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/inputlag.app/Contents/MacOS/inputlag:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/inputlag.app/Contents/MacOS/inputlag


PostBuild.joysticks.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/joysticks.app/Contents/MacOS/joysticks
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/joysticks.app/Contents/MacOS/joysticks:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/joysticks.app/Contents/MacOS/joysticks


PostBuild.monitors.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/monitors
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/monitors:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/monitors


PostBuild.msaa.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/msaa
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/msaa:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/msaa


PostBuild.offscreen.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/offscreen
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/offscreen:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/offscreen


PostBuild.opacity.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/opacity.app/Contents/MacOS/opacity
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/opacity.app/Contents/MacOS/opacity:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/opacity.app/Contents/MacOS/opacity


PostBuild.particles.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/particles.app/Contents/MacOS/particles
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/particles.app/Contents/MacOS/particles:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/particles.app/Contents/MacOS/particles


PostBuild.reopen.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/reopen
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/reopen:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/reopen


PostBuild.sharing.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/sharing.app/Contents/MacOS/sharing
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/sharing.app/Contents/MacOS/sharing:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/sharing.app/Contents/MacOS/sharing


PostBuild.simple.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/simple.app/Contents/MacOS/simple
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/simple.app/Contents/MacOS/simple:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/simple.app/Contents/MacOS/simple


PostBuild.splitview.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/splitview.app/Contents/MacOS/splitview
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/splitview.app/Contents/MacOS/splitview:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/splitview.app/Contents/MacOS/splitview


PostBuild.tearing.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/tearing.app/Contents/MacOS/tearing
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/tearing.app/Contents/MacOS/tearing:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/tearing.app/Contents/MacOS/tearing


PostBuild.threads.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/threads.app/Contents/MacOS/threads
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/threads.app/Contents/MacOS/threads:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/threads.app/Contents/MacOS/threads


PostBuild.timeout.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/timeout.app/Contents/MacOS/timeout
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/timeout.app/Contents/MacOS/timeout:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/timeout.app/Contents/MacOS/timeout


PostBuild.title.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/title.app/Contents/MacOS/title
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/title.app/Contents/MacOS/title:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/title.app/Contents/MacOS/title


PostBuild.triangle-vulkan.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/triangle-vulkan
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/triangle-vulkan:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/triangle-vulkan


PostBuild.wave.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/wave.app/Contents/MacOS/wave
/Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/wave.app/Contents/MacOS/wave:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/MinSizeRel/wave.app/Contents/MacOS/wave


PostBuild.windows.MinSizeRel:
PostBuild.glfw.MinSizeRel: /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/windows.app/Contents/MacOS/windows
/Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/windows.app/Contents/MacOS/windows:\
	/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/MinSizeRel/windows.app/Contents/MacOS/windows


PostBuild.boing.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/boing.app/Contents/MacOS/boing
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/boing.app/Contents/MacOS/boing:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/boing.app/Contents/MacOS/boing


PostBuild.clipboard.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/clipboard
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/clipboard:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/clipboard


PostBuild.cursor.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/cursor
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/cursor:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/cursor


PostBuild.empty.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/empty.app/Contents/MacOS/empty
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/empty.app/Contents/MacOS/empty:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/empty.app/Contents/MacOS/empty


PostBuild.events.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/events
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/events:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/events


PostBuild.gamma.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/gamma.app/Contents/MacOS/gamma
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/gamma.app/Contents/MacOS/gamma:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/gamma.app/Contents/MacOS/gamma


PostBuild.gears.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/gears.app/Contents/MacOS/gears
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/gears.app/Contents/MacOS/gears:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/gears.app/Contents/MacOS/gears


PostBuild.glfw.RelWithDebInfo:
/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.dylib:
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.dylib


PostBuild.glfwinfo.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/glfwinfo
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/glfwinfo:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/glfwinfo


PostBuild.heightmap.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/heightmap.app/Contents/MacOS/heightmap
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/heightmap.app/Contents/MacOS/heightmap:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/heightmap.app/Contents/MacOS/heightmap


PostBuild.icon.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/icon.app/Contents/MacOS/icon
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/icon.app/Contents/MacOS/icon:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/icon.app/Contents/MacOS/icon


PostBuild.iconify.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/iconify
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/iconify:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/iconify


PostBuild.inputlag.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/inputlag.app/Contents/MacOS/inputlag
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/inputlag.app/Contents/MacOS/inputlag:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/inputlag.app/Contents/MacOS/inputlag


PostBuild.joysticks.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/joysticks.app/Contents/MacOS/joysticks
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/joysticks.app/Contents/MacOS/joysticks:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/joysticks.app/Contents/MacOS/joysticks


PostBuild.monitors.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/monitors
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/monitors:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/monitors


PostBuild.msaa.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/msaa
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/msaa:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/msaa


PostBuild.offscreen.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/offscreen
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/offscreen:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/offscreen


PostBuild.opacity.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/opacity.app/Contents/MacOS/opacity
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/opacity.app/Contents/MacOS/opacity:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/opacity.app/Contents/MacOS/opacity


PostBuild.particles.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/particles.app/Contents/MacOS/particles
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/particles.app/Contents/MacOS/particles:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/particles.app/Contents/MacOS/particles


PostBuild.reopen.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/reopen
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/reopen:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/reopen


PostBuild.sharing.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/sharing.app/Contents/MacOS/sharing
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/sharing.app/Contents/MacOS/sharing:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/sharing.app/Contents/MacOS/sharing


PostBuild.simple.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/simple.app/Contents/MacOS/simple
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/simple.app/Contents/MacOS/simple:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/simple.app/Contents/MacOS/simple


PostBuild.splitview.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/splitview.app/Contents/MacOS/splitview
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/splitview.app/Contents/MacOS/splitview:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/splitview.app/Contents/MacOS/splitview


PostBuild.tearing.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/tearing.app/Contents/MacOS/tearing
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/tearing.app/Contents/MacOS/tearing:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/tearing.app/Contents/MacOS/tearing


PostBuild.threads.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/threads.app/Contents/MacOS/threads
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/threads.app/Contents/MacOS/threads:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/threads.app/Contents/MacOS/threads


PostBuild.timeout.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/timeout.app/Contents/MacOS/timeout
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/timeout.app/Contents/MacOS/timeout:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/timeout.app/Contents/MacOS/timeout


PostBuild.title.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/title.app/Contents/MacOS/title
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/title.app/Contents/MacOS/title:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/title.app/Contents/MacOS/title


PostBuild.triangle-vulkan.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/triangle-vulkan
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/triangle-vulkan:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/triangle-vulkan


PostBuild.wave.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/wave.app/Contents/MacOS/wave
/Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/wave.app/Contents/MacOS/wave:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/examples/RelWithDebInfo/wave.app/Contents/MacOS/wave


PostBuild.windows.RelWithDebInfo:
PostBuild.glfw.RelWithDebInfo: /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/windows.app/Contents/MacOS/windows
/Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/windows.app/Contents/MacOS/windows:\
	/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib
	/bin/rm -f /Users/yumeng/Desktop/specularAA/build/tests/RelWithDebInfo/windows.app/Contents/MacOS/windows




# For each target create a dummy ruleso the target does not have to exist
/Users/yumeng/Desktop/specularAA/build/src/Debug/libglfw.3.3.dylib:
/Users/yumeng/Desktop/specularAA/build/src/MinSizeRel/libglfw.3.3.dylib:
/Users/yumeng/Desktop/specularAA/build/src/RelWithDebInfo/libglfw.3.3.dylib:
/Users/yumeng/Desktop/specularAA/build/src/Release/libglfw.3.3.dylib:
