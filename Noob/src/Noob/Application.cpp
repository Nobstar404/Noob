#include "nbpch.h"
#include "Application.h"

#include "Noob/Events/ApplicationEvent.h"
#include "Noob/Log.h"

#include <GLFW/glfw3.h>

namespace Noob {

	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		while (m_Runing)
		{
			glClearColor(1, 0, 0, 1);
			glClear(GL_COLOR_BUFFER_BIT);
			m_Window->OnUpdate();
		};
	}
}
