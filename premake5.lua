workspace "GameEngineEnigma"
	architecture "x86_64"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "GameEngineEnigma/vendor/GLFW/include"
IncludeDir["Glad"] = "GameEngineEnigma/vendor/Glad/include"
IncludeDir["ImGui"] = "GameEngineEnigma/vendor/imgui"

include "GameEngineEnigma/vendor/GLFW"
include "GameEngineEnigma/vendor/Glad"
include "GameEngineEnigma/vendor/imgui"

project "GameEngineEnigma"
	location "GameEngineEnigma"
	kind "SharedLib"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	pchheader "engpch.h"
	pchsource "GameEngineEnigma/src/engpch.cpp"
	
	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}
	
	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib",
		"dwmapi.lib"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion = "latest"
		
		defines
		{
			"ENG_PLATFORM_WINDOWS",
			"ENG_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
		
	filter "configurations:Debug"
		defines "ENG_DEBUG"
		buildoptions "/MDd"
		symbols "On"
		
	filter "configurations:Release"
		defines "ENG_RELEASE"
		buildoptions "/MD"
		optimize "On"
		
	filter "configurations:Dist"
		defines "ENG_DIST"
		buildoptions "/MD"
		optimize "On"
		
project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"GameEngineEnigma/vendor/spdlog/include",
		"GameEngineEnigma/src"
	}
	
	links
	{
		"GameEngineEnigma"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion = "latest"
		
		defines
		{
			"ENG_PLATFORM_WINDOWS"
		}
		
	filter "configurations:Debug"
		defines "ENG_DEBUG"
		buildoptions "/MDd"
		symbols "On"
		
	filter "configurations:Release"
		defines "ENG_RELEASE"
		buildoptions "/MD"
		optimize "On"
		
	filter "configurations:Dist"
		defines "ENG_DIST"
		buildoptions "/MD"
		optimize "On"