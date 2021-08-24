# modular_navigation

Modular navigation sets out to replicate as closely as possible the excellent navigation system in Angular in a simple declaritive style using the highly complex flutter navigation 2.0.

Modular Navigation is fully compatible with GetIt injection and works well with authentication mechanisms.

Modular Navigation fully supports route guards and also supports module-wide guards.

Modular Navigation is designed for future functionality for code splitting on flutter web when ready.

## Getting Started

1. Create a root module defining all of the defaults and any sub modules you need.
2. Implement MaterialApp.router and pass the parameters similar to how the example does it.
3. Every page in your app should inherit from ModularPage and define the parameters that it will accept.
4. Use context.navigateTo() extension method to navigate around your app with the strongly typed version of the pages.

## Help Wanted

Any help that you can provide would be greatly appreciated. Specifically the following areas would be of great assistance:

1. Add ModularLink example for late bound navigation to the example project.
2. Add Route Guard example to the example project.
3. Make the example project pages more expressive.
4. Add more documentation and screen shots for here.
5. Add unit tests.
