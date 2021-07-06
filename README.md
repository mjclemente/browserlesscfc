# browserlesscfc

A CFML wrapper for the [browserless API](https://docs.browserless.io/docs/start.html). Control web browser automation for screenshots, pdf generation, testing, and more.

*Feel free to use the issue tracker to report bugs or suggest improvements!*

This was quickly put together for a side project. It isn't meant to be comprehensive or complete. Just a starting point, if people are interested in messing around with the browserless.io API via CFML.

## Acknowledgements

This project borrows heavily from the API frameworks built by [jcberquist](https://github.com/jcberquist). Thanks to John for all the inspiration!

## Table of Contents

- [Quick Start](#quick-start)
- [Setup and Authentication](#setup-and-authentication)
- [`browserlesscfc` Reference Manual](#reference-manual)
- [Reference Manual for `helpers.screenshot`](#reference-manual-for-helpersscreenshot)

### Quick Start

The following is a quick example of taking a screenshot (the only method that's currently implemented), using the `screenshot` helper component.

```cfc
browserless = new path.to.browserlesscfc.browserless( apiKey = 'xxx' );

options = new path.to.browserlesscfc.helpers.screenshot()
  .url( "https://blog.mattclemente.com" )
  .fullPage( false )
  .type( "jpeg" )
  .quality( 75 )
  .viewportHeight( 940 )
  .viewportWidth( 1680 );

flags = {
    "--window-size": "1680,940",
    "stealth": true
  };

jpg = browserless.screenshot( options, flags );

fileWrite('./test.jpg',jpg.data);
writeDump( var='#jpg#', abort='true' );
```

### Setup and Authentication

To get started with the Browserless.io API, you'll need an [API Token](https://docs.browserless.io/docs/token.html).

Once you have this, you can provide it to this wrapper manually when creating the component, as in the Quick Start example above, or via an environment variable named `BROWSERLESS_API_KEY`, which will get picked up automatically. This latter approach is generally preferable, as it keeps hardcoded credentials out of your codebase.

### Reference Manual

#### `screenshot( required any options, struct flags={} )`

Take a screenshot. The parameter `options` expects an instance of the `helpers.screenshot` component, but you can construct the struct/json yourself if you prefer. Additionally, for flexibility, you can simply pass in a url. *[Endpoint docs](https://chrome.browserless.io/docs/#/Browser%20API/post_screenshot)*

### Reference Manual for `helpers.screenshot`

The reference manual for all public methods in `helpers/screenshot.cfc` can be found in the `docs` directory, [in `screenshot.md`](https://github.com/mjclemente/browserlesscfc/blob/main/docs/screenshot.md).

Unless indicated, all methods are chainable. To better understand how these work, you'll want to read the [documentation regarding the /screenshot endpoint](https://docs.browserless.io/docs/screenshot.html) as well as the [generated Swagger UI for the endpoint](https://chrome.browserless.io/docs/#/Browser%20API/post_screenshot).

---
