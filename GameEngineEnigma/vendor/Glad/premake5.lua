project "Glad"
	kind "StaticLib"
	language "C"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLAD/glad.h",
		"include/KHR/khrplatform.h",
		"src/glad.c"
	}
		
	includedirs
	{
		"include"
	}
	
	
	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

	filter { "system:windows", "configurations:Release"	}
		buildoptions "/MT"
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		--	filter "system:linux"
--		pic "On"
--
--		systemversion "latest"
--		
--		files
--		{
--			"src/x11_init.c",
--			"src/x11_monitor.c",
--			"src/x11_window.c",
--			"src/xkb_unicode.c",
--			"src/posix_module.c",
--			"src/posix_time.c",
--			"src/posix_thread.c",
--			"src/posix_module.c",
--			"src/glx_context.c",
--			"src/egl_context.c",
--			"src/osmesa_context.c",
--			"src/linux_joystick.c"
--		}

--		defines
--		{
--			"_GLFW_X11"
--		}

--	filter "system:macosx"
--		pic "On"-

--		files
--		{
--			"src/cocoa_init.m",
--			"src/cocoa_monitor.m",
--			"src/cocoa_window.m",
--			"src/cocoa_joystick.m",
--			"src/cocoa_time.c",
--			"src/nsgl_context.m",
--			"src/posix_thread.c",
--			"src/posix_module.c",
--			"src/osmesa_context.c",
--			"src/egl_context.c"
--		}

	--	defines
	--	{
	--		"_GLFW_COCOA"
		--}