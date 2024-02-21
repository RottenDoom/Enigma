#include <Engine.h>

class Sandbox : public eng::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

eng::Application* eng::CreateApplication()
{
	return new Sandbox();
}