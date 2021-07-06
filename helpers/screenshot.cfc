/**
* browserlesscfc
* Copyright 2021  Matthew J. Clemente, John Berquist
* Licensed under MIT (https://mit-license.org)
*/
component accessors="true" {

  property name="authenticate" default="";
  property name="addScriptTag" default="";
  property name="addStyleTag" default="";
  property name="cookies" default="";
  property name="gotoOptions" default="";
  property name="html" default="";
  property name="manipulate" default="";
  property name="options" default="";
  property name="rejectRequestPattern" default="";
  property name="rejectResourceTypes" default="";
  property name="requestInterceptors" default="";
  property name="setExtraHTTPHeaders" default="";
  property name="setJavaScriptEnabled" default="";
  property name="url" default="";
  property name="userAgent" default="";
  property name="viewport" default="";
  property name="waitFor" default="";

  /**
  * @hint No parameters can be passed to init this component. They must be built manually.
  */
  public any function init() {

    setAuthenticate( {} );
    setAddScriptTag( [] );
    setAddStyleTag( [] );
    setCookies( [] );
    setGotoOptions( {} );
    setManipulate( {} );
    setOptions( {} );
    setRejectRequestPattern( [] );
    setRejectResourceTypes( [] );
    setRequestInterceptors( [] );
    setSetExtraHTTPHeaders( {} );
    setViewport( {} );

    return this;
  }

  /**
  * @hint Set the url for the screenshot
  */
  public any function url( required string url ) {
    setUrl( arguments.url );
    return this;
  }

  /**
  * @hint Set the authentication credentials, if necessary
  */
  public any function authenticate( required string username, required string password ) {
    setAuthenticate(
      {
        "username": arguments.username,
        "password": arguments.password
      }
     );
    return this;
  }

  /**
  * @hint Accepts and sets parameters that are available as options
  */
  public any function options( struct clip, boolean fullPage, boolean omitBackground, numeric quality, string type ) {
    var options = {};
    if( !isNull( arguments.clip ) ){
      options["clip"] = arguments.clip;
    }
    if( !isNull( arguments.fullPage ) ){
      options["fullPage"] = arguments.fullPage;
    }
    if( !isNull( arguments.omitBackground ) ){
      options["omitBackground"] = arguments.omitBackground;
    }
    if( !isNull( arguments.quality ) ){
      options["quality"] = arguments.quality;
    }
    if( !isNull( arguments.type ) ){
      options["type"] = arguments.type;
    }

    setOptions( options );
    return this;
  }

  /**
  * @hint Convenience method for setting `options.fullPage`. Defaults to true, so calling this without an argument also enables the option.
  */
  public any function fullPage( boolean fullPage = true ) {
    var options = getOptions();
    options["fullPage"] = arguments.fullPage;
    setOptions( options );
    return this;
  }

  /**
  * @hint Convenience method for setting `options.omitBackground`. Defaults to true, so calling this without an argument also enables the option.
  */
  public any function omitBackground( boolean omitBackground = true ) {
    var options = getOptions();
    options["omitBackground"] = arguments.omitBackground;
    setOptions( options );
    return this;
  }

  /**
  * @hint Convenience method for setting `options.type`. Valid values are `jpeg` and `png`.
  */
  public any function type( required string type ) {
    var options = getOptions();
    options["type"] = arguments.type;
    setOptions( options );
    return this;
  }

  /**
  * @hint Convenience method for setting `options.quality`
  */
  public any function quality( required numeric quality ) {
    var options = getOptions();
    options["quality"] = arguments.quality;
    setOptions( options );
    return this;
  }

  public any function viewport( numeric i, boolean hasTouch, numeric height, boolean isLandscape, boolean isMobile, numeric width ){
    var settings = {};

    if( !isNull( arguments.deviceScaleFactora ) ){
      settings["deviceScaleFactor"] = arguments.deviceScaleFactor;
    }
    if( !isNull( arguments.hasTouch ) ){
      settings["hasTouch"] = arguments.hasTouch;
    }
    if( !isNull( arguments.height ) ){
      settings["height"] = arguments.height;
    }
    if( !isNull( arguments.width ) ){
      settings["width"] = arguments.width;
    }
    if( !isNull( arguments.isLandscape ) ){
      settings["isLandscape"] = arguments.isLandscape;
    }
    if( !isNull( arguments.isMobile ) ){
      settings["isMobile"] = arguments.isMobile;
    }
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.deviceScaleFactor`
  */
  public any function deviceScaleFactor( required numeric deviceScaleFactor ) {
    var settings = getViewport();
    settings["deviceScaleFactor"] = arguments.deviceScaleFactor;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.hasTouch`
  */
  public any function hasTouch( required boolean hasTouch ) {
    var settings = getViewport();
    settings["hasTouch"] = arguments.hasTouch;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.height`
  */
  public any function viewportHeight( required numeric height ) {
    var settings = getViewport();
    settings["height"] = arguments.height;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.width`
  */
  public any function viewportWidth( required numeric width ) {
    var settings = getViewport();
    settings["width"] = arguments.width;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.isLandscape`
  */
  public any function isLandscape( required boolean isLandscape ) {
    var settings = getViewport();
    settings["isLandscape"] = arguments.isLandscape;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Convenience method for setting `viewport.isMobile`
  */
  public any function isMobile( required boolean isMobile ) {
    var settings = getViewport();
    settings["isMobile"] = arguments.isMobile;
    setViewport( settings );
    return this;
  }

  /**
  * @hint Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.
  */
  public string function build() {

    var body = '';
    var properties = getPropertyValues();
    var count = properties.len();

    properties.each(
      function( property, index ) {

        var value = serializeJSON( property.value );
        body &= '"#property.key#": ' & value & '#index NEQ count ? "," : ""#';
      }
    );

    return '{' & body & '}';
  }

  private numeric function getUTCTimestamp( required date dateToConvert ) {
    return dateDiff( "s", variables.utcBaseDate, dateToConvert );
  }

  private date function parseUTCTimestamp( required numeric utcTimestamp ) {
    return dateAdd( "s", utcTimestamp, variables.utcBaseDate );
  }

  /**
  * @hint converts the array of properties to an array of their keys/values, while filtering those that have not been set
  */
  private array function getPropertyValues() {

    var propertyValues = getProperties().map(
      function( item, index ) {
        return {
          "key" : item.name,
          "value" : getPropertyValue( item.name )
        };
      }
    );

    return propertyValues.filter(
      function( item, index ) {
        return hasValue( item.value );
      }
    );
  }

  private array function getProperties() {

    var metaData = getMetaData( this );
    var properties = [];

    for( var prop in metaData.properties ) {
      properties.append( prop );
    }

    return properties;
  }

  private any function getPropertyValue( string key ){
    var method = this["get#key#"];
    var value = method();
    return value;
  }

  private boolean function hasValue( any value ) {
    if ( isNull( value ) ) return false;
    if ( isSimpleValue( value ) ) return len( value );
    if ( isStruct( value ) ) return !value.isEmpty();
    if ( isArray( value ) ) return value.len();

    return false;
  }
}
