#pragma once

#include "Core.h"
#include <spdlog/spdlog.h>
#include <spdlog/fmt/ostr.h>


namespace eng {

	class ENG_API Log
	{
	
	public:
		static void Init();

		static std::shared_ptr<spdlog::logger>& GetCoreLogger();
		static std::shared_ptr<spdlog::logger>& GetClientLogger();

	private:
		// fixed https://stackoverflow.com/questions/73511416/using-a-static-class-fuction-causes-a-linker-error-thanks-to-an-unresolved-exte
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger; // https://github.com/gabime/spdlog/issues/1505 this might be helpfull
	};

}

// Core log macros
#define ENG_CORE_WARN(...)      ::eng::Log::GetCoreLogger()->info(__VA_ARGS__)
#define ENG_CORE_INFO(...)      ::eng::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define ENG_CORE_TRACE(...)     ::eng::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ENG_CORE_ERROR(...)     ::eng::Log::GetCoreLogger()->error(__VA_ARGS__)
#define ENG_CORE_CRITICAL(...)  ::eng::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client log macros
#define ENG_WARN(...)      ::eng::Log::GetClientLogger()->info(__VA_ARGS__)
#define ENG_INFO(...)      ::eng::Log::GetClientLogger()->warn(__VA_ARGS__)
#define ENG_TRACE(...)     ::eng::Log::GetClientLogger()->error(__VA_ARGS__)
#define ENG_ERROR(...)     ::eng::Log::GetClientLogger()->error(__VA_ARGS__)
#define ENG_CRITICAL(...)  ::eng::Log::GetClientLogger()->critical(__VA_ARGS__)