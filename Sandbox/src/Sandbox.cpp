#include <Engine.h>
#include "imgui/imgui.h"

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
		if (eng::Input::IsKeyPressed(eng::Key::Tab)) {
			ENG_TRACE("Tab key pressed");
		}

	}

	virtual void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello World");
		ImGui::End();
	}

	void OnEvent(eng::Event& event) override
	{
		//ENG_INFO("{0}", event);

		if (event.GetEventType() == eng::EventType::KeyPressed) 
		{
			eng::KeyPressedEvent& e = (eng::KeyPressedEvent&)event;
			ENG_TRACE("{0}", (char)e.GetKeyCode());
		}
	}
};

class Sandbox : public eng::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

eng::Application* eng::CreateApplication()
{
	return new Sandbox();
}