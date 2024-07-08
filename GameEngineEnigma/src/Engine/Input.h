#pragma once

#include "Engine/Core.h"
#include "Engine/KeyCodes.h"
#include "Engine/MouseButtonCodes.h"

namespace eng {
	class ENG_API Input
	{
	public:
		static bool IsKeyPressed(KeyCode key);

		static bool IsMouseButtonPressed(MouseCode button);
		static std::pair<float, float> GetMousePosition();
		static float GetMouseX();
		static float GetMouseY();
	};
}