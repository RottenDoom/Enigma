#include <Engine.h>

class ExampleLayer : public eng::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{

	}
	void OnUpdate() override
	{
		// ENG_INFO("ExampleLayer::Update");
	}

	void OnEvent(eng::Event& event) override
	{
		ENG_TRACE("{0}", event);
	}
};

class Sandbox : public eng::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new eng::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

eng::Application* eng::CreateApplication()
{
	return new Sandbox();
}