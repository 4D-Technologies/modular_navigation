# [0.0.3]

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
