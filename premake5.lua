workspace "Noob"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

buildoptions { "/utf-8" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


project "Noob"
	location "Noob"
	kind "SharedLib"
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
		"Noob/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22621.0"

		defines
		{
			"NB_PLATFORM_WINDOWS",
			"NB_BUILD_DLL"
		}

		postbuildcommands
		{
			'"C:\\Windows\\System32\\xcopy.exe" /Q /Y /I "$(SolutionDir)bin\\Debug-windows-x86_64\\Noob\\Noob.dll" "$(SolutionDir)bin\\Debug-windows-x86_64\\Sandbox\\" > nul'
		}

	filter "configurations:Debug"
		defines "NB_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "NB_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "NB_DIST"
		symbols "On"

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
		"Noob/vendor/spdlog/include",
		"Noob/src"
	}
	
	links
	{
		"Noob"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22621.0"

		defines
		{
			"NB_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "NB_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "NB_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "NB_DIST"
		optimize "On"