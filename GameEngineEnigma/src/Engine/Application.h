#pragma once

#include "Core.h"

namespace eng {

	class ENG_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}
