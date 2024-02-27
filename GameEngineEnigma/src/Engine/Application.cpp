#include "engpch.h"
#include "Application.h"

#include "Engine/Events/ApplicationEvent.h"

#include "Engine/Log.h"

namespace eng {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizedEvent e(1280, 720);
		ENG_TRACE(e);

		while (true);
	}
}