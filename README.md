# modular_navigation

Modular navigation sets out to replicate as closely as possible the excellent navigation system in Angular in a simple declaritive style using the highly complex flutter navigation 2.0.

Modular Navigation is fully compatible with GetIt injection and works well with authentication mechanisms.

## Getting Started

1. Create a root module defining all of the defaults and any sub modules you need.
2. Implement MaterialApp.router and pass the parameters similar to how the example does it.
3. Every page in your app should inherit from ModularPage and define the parameters that it will accept.
4. Use context.navigateTo() extension method to navigate around your app with the strongly typed version of the pages.
