#include "engpch.h"
#include "Application.h"

#include "Engine/Events/ApplicationEvent.h"

#include "Engine/Log.h"

namespace eng {

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Running)
		{
			m_Window->OnUpdate();
		}
	}
}