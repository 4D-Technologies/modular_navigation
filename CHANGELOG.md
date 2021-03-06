## [0.0.30] - May 18th, 2022

- Upgrade to Dart 2.17/Flutter 3

## [0.0.29] - April 19th, 2022

- Upgrade to Dart 2.16/Flutter 2.10
- Fix issue with the example project on android and ios.

## [0.0.28] - September 10th, 2021

- Upgrade to Dart 2.14/Flutter 2.2
- Enable Flutter_lint
- Fix linting warnings/errors

## [0.0.27] - September 2, 2021

- Fix routes didn't allow override of parent guards in the constructors
- Add getIt support for creating routes so that getIt ensures strong types for parameters at all times, eliminating a possible type missmatch if not set correctly when generating routes.

## [0.0.26] - September 1, 2021

- Fix issue where refresh in a web browser didn't work and would redirect to home page.

## [0.0.25] - August 30, 2021

- Fix a bug that was preventing the web browser's URI from being updated with any query string parameters for page deep linking and refresh.
- Make guards recursive up the tree of modules unless explicitly blocked using override parameters or routes and sub modules.

## [0.0.23] - August 24th, 2021

- Remove context extensions that could lead to untyped navigation and bugs.

## [0.0.18] - August 23rd, 2021

- Enable equality operations on most objects.
- Enable create, createLink, and navigate on routes and refactor example to use these to navigate strongly without breaking the tree of requirements. This uses the createPage function internally so that when using code injection there is a single place for creating the pages.
- Add convience routes and pages to speed development and avoid boiler plate.

## [0.0.14] - August 20th, 2021

- Improve the overrrideInitialRoute function by removing futures because of https://github.com/flutter/flutter/issues/71106
- Add ModularLink and update extension methods to match the various different ways you can navigate.
- Added createLink to the Root module to allow easy creation of module links for lazy navigation
- Changed how SubModules are created to better handle pathing for matching everywhere

## [0.0.5]

- Add OptionalIdPageParameters for when a route can be used for a new item or to view an existing item.

## [0.0.4]

- Add Route Guards that allow things like LOGIN to function automatically. These can be added to both the module level and the specific route level. If added to both they will be called in module then route order.
- Routes now require the module to be passed to them so that they have information about where they came from.
- Example updated to show sub module route guard with rudamentary login. Note that guards can be asynchronous.
- navigateTo was made a FutureOr<void> to handle async cases.
- navigateToUri was added to allow redirecting to full uris that have been serialized.

## [0.0.2]

- Major overhaul with breaking changes that drastically simplifies the interface for everything
- Updates the example with a fully working cases

## [0.0.1]

- Initial Release
