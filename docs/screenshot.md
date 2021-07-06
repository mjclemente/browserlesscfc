# `screenshot.cfc` Reference

#### `url( required string url )`

Set the url for the screenshot.

#### `authenticate( required string username, required string password )`

Set the authentication credentials, if necessary.

#### `options(  struct clip,  boolean fullPage,  boolean omitBackground,  numeric quality,  string type )`

Accepts and sets parameters that are available as options.

#### `fullPage(  boolean fullPage=true  )`

Convenience method for setting `options.fullPage`. Defaults to true, so calling this without an argument also enables the option.

#### `omitBackground(  boolean omitBackground=true  )`

Convenience method for setting `options.omitBackground`. Defaults to true, so calling this without an argument also enables the option.

#### `type( required string type )`

Convenience method for setting `options.type`. Valid values are `jpeg` and `png`.

#### `quality( required numeric quality )`

Convenience method for setting `options.quality`.

#### `viewport(  numeric i,  boolean hasTouch,  numeric height,  boolean isLandscape,  boolean isMobile,  numeric width )`

#### `deviceScaleFactor( required numeric deviceScaleFactor )`

Convenience method for setting `viewport.deviceScaleFactor`.

#### `hasTouch( required boolean hasTouch )`

Convenience method for setting `viewport.hasTouch`.

#### `viewportHeight( required numeric height )`

Convenience method for setting `viewport.height`.

#### `viewportWidth( required numeric width )`

Convenience method for setting `viewport.width`.

#### `isLandscape( required boolean isLandscape )`

Convenience method for setting `viewport.isLandscape`.

#### `isMobile( required boolean isMobile )`

Convenience method for setting `viewport.isMobile`.

#### `build()`

Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.
