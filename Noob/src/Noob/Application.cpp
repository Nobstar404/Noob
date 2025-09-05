#include "Application.h"

#include "Noob/Events/ApplicationEvent.h"
#include "Noob/Log.h"

namespace Noob {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}


	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		NB_TRACE(e);

		//NB_TRACE("Window resized to {}x{}", e.GetWidth(), e.GetHeight());

		while (true);
	}
}
