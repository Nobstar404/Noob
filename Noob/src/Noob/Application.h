#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Window.h"

namespace Noob {

	class NOOB_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	private:
		std::unique_ptr<Window> m_Window;
		bool m_Runing;
	};

	// to be define in client
	Application* CreateApplication();

}

