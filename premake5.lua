project "LZ4"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("%{wks.location}/Build_Data/bin/" .. outputDir .. "/%{wks.name}")
	objdir ("%{wks.location}/Build_Data/bin-obj/" .. outputDir .. "/%{wks.name}")

	files
	{
		"lib/**",
	}

	includedirs
	{
		"lib", 
	}

	defines 
	{
		"LZ4_DLL_EXPORT=1",
	}

	filter "system:windows"
		systemversion "latest"
		
		defines
		{
			"WIN32",
		}

	filter "configurations:Debug"
		defines "FAE_DEBUG"
		runtime "Debug"
		symbols "on"
		
		defines
		{
			"_DEBUG",
		}

	filter "configurations:Release"
		defines "FAE_RELEASE"
		runtime "Release"
		optimize "on"
		
		defines
		{
			"NDEBUG",
		}

	filter "configurations:Dist"
		defines "FAE_DIST"
		runtime "Release"
		optimize "on"
		
		defines
		{
			"NDEBUG",
		}
