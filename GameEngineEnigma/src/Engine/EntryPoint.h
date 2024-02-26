#pragma once

#ifdef ENG_PLATFORM_WINDOWS

extern eng::Application* eng::CreateApplication();

int main(int argc, char** argv)
{
	eng::Log::Init();
	ENG_CORE_WARN("Initialized Log");
	ENG_INFO("Hello");

	auto app = eng::CreateApplication();
	app->Run();
	delete app;
}

#endif
