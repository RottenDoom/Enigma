workspace "GameEngineEnigma"
	architecture "x86_64"
	startproject "Sandbox"
	
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "GameEngineEnigma/vendor/GLFW/include"
IncludeDir["Glad"] = "GameEngineEnigma/vendor/Glad/include"
IncludeDir["ImGui"] = "GameEngineEnigma/vendor/imgui"
IncludeDir["glm"] = "GameEngineEnigma/vendor/glm"


include "GameEngineEnigma/vendor/GLFW"
include "GameEngineEnigma/vendor/Glad"
include "GameEngineEnigma/vendor/imgui"

project "GameEngineEnigma"
	location "GameEngineEnigma"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime = "on"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	pchheader "engpch.h"
	pchsource "GameEngineEnigma/src/engpch.cpp"
	
	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"

	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
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
		systemversion = "latest"
		
		defines
		{
			"ENG_PLATFORM_WINDOWS",
			"ENG_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
		
	filter "configurations:Debug"
		defines "ENG_DEBUG"
		runtime "Debug"
		symbols "On"
		
	filter "configurations:Release"
		defines "ENG_RELEASE"
		runtime "Release"
		optimize "On"
		
	filter "configurations:Dist"
		defines "ENG_DIST"
		runtime "Release"
		optimize "On"
		
project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime = "on"
	
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
		"GameEngineEnigma/src",
		"GameEngineEnigma/vendor",
		"%{IncludeDir.glm}"

	}
	
	links
	{
		"GameEngineEnigma"
	}
	
	filter "system:windows"
		systemversion = "latest"
		
		defines
		{
			"ENG_PLATFORM_WINDOWS"
		}
		
	filter "configurations:Debug"
		defines "ENG_DEBUG"
		runtime "Debug"
		symbols "On"
		
	filter "configurations:Release"
		defines "ENG_RELEASE"
		runtime "Release"
		optimize "On"
		
	filter "configurations:Dist"
		defines "ENG_DIST"
		runtime "Release"
		optimize "On"