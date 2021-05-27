unit Bing.Maps;

interface

{$modeswitch externalclass}

uses Web, JS, SysUtils;

type
  TAddress = class;
  TAnimatedFrameEventArgs = class;
  TAnimatedTileLayerOptions  = class;
  TBorderedMapElementStyle = class;
  TCustomMapStyle = class;
  TCustomOverlayOptions = class;
  TGroundOverlayOptions = class;
  THandlerId = class;
  TInfoboxEventArgs = class;
  TInfoboxOptions  = class;
  TMapElementStyle = class;
  TMapElements = class;
  TMapOptions = class;
  TMapTypeChangeEventArgs = class;
  TModuleOptions = class;
  TMouseEventArgs = class;
  TPanoramaInfo = class;
  TPolygonOptions = class;
  TPolylineOptions = class;
  TPrimitiveChangedEventArgs = class;
  TPrimitiveOptions = class;
  TPushpinOptions = class;
  TRange = class;
  TSettingsStyle = class;
  TStreetsideOptions  = class;
  TStyleUrl = class;
  TStylesOptions = class;
  TTileLayerOptions = class;
  TTileSourceOptions = class;
  TViewOptions = class;

  TMicrosoft = class external name 'Microsoft'
  public type
    TMaps = class external name 'Maps'
    public type
      TCustomOverlay = class;
      TInfobox = class;
      TLayer = class;
      TLocation = class;
      TLocationRect = class;
      TMap = class;
      TPoint = class;
      TPolygon = class;
      TPolyline = class;
      TPushpin = class;
      TTileSource = class;

      TLabelOverlay = (loHidden, loVisible);
      TMapTypeId = (mtAerial, mtBirdseye, mtCanvasDark, mtCanvasLight, mtGrayscale, mtMercator, mtOrdnanceSurvey, mtRoad, mtStreetside);
      TNavigationBarMode = (nbCompact, nbDefault, nbMinified);
      TNavigationBarOrientation = (nboHorizontal, nboVertical);
      TOverviewMapMode = (omExpanded, omHidden, omMinimized);
      TPixelReference = (prControl, prPage, prViewport);

      TPrimitive = class external name 'Primitive' abstract
      public
        function getCursor: String;
        function getVisible: Boolean;
        procedure setOptions(options: TPrimitiveOptions);
      end;

      TAnimatedTileLayer = class external name 'AnimatedTileLayer'
      public
        constructor new(options: TAnimatedTileLayerOptions);

        function getFrameRate: Double;
        function getLoadingScreen: TCustomOverlay;
        function getMaxTotalLoadTime: Double;
        function getTileSources: TArray<TTileSource>;
        function getVisible: Boolean;

        procedure pause;
        procedure play;
        procedure setOptions(options: TAnimatedTileLayerOptions);
        procedure stop;
      end;

      TColor = class external name 'Color'
      public
        a: Double;
        r: Double;
        g: Double;
        b: Double;

        constructor new(a: Double; r: Double; g: Double; b: Double);

        class function clone(color: TColor): TColor; overload;
        class function fromHex(hex: String): TColor;

        function clone: TColor; overload;
        function getOpacity: Double;
        function toHex: String;
        function toRgba: String;
      end;

      TLayer = class external name 'Layer'
      public
        metadata: JSValue;

        constructor new; overload;
        constructor new(id: String); overload;

        function getId: String;
        function getPrimitives: TArray<TPrimitive>;
        function getVisible: Boolean;
        function getZIndex: Double;
        function remove(primitive: TPrimitive): TPrimitive;
        function removeAt(index: Double): TPrimitive;

        procedure add(primitive: TPrimitive); overload;
        procedure add(primitive: TPrimitive; index: Double); overload;
        procedure add(primitive: TArray<TPrimitive>); overload;
        procedure add(primitive: TArray<TPrimitive>; index: Double); overload;
        procedure clear;
        procedure dispose;
        procedure setPrimitives(primitives: TArray<TPrimitive>);
        procedure setVisible(value: Boolean);
        procedure setZIndex(zIndex: Double);
      end;

      TCustomOverlay = class external name 'CustomOverlay' (TLayer)
      public
        _map: TMap;

        constructor new(options: TCustomOverlayOptions);

        function getHtmlElement: TJSHTMLElement;
        function getMap: TMap;

        procedure onAdd;
        procedure onLoad;
        procedure onRemove;
        procedure setHtmlElement(htmlElement: TJSHTMLElement);
      end;

      TEvents = class external name 'Events'
      public
        function addHandler(target: JSValue; eventName: String; handler: TProc<JSValue>): THandlerId; overload;
        function addHandler(target: TInfobox; eventName: String; handler: TProc<TInfoboxEventArgs>): THandlerId; overload;
        function addHandler(target: TLayer; eventName: String; handler: TProc<TMouseEventArgs>): THandlerId; overload;
        function addHandler(target: TMap; eventName: String; handler: TProc<TMapTypeChangeEventArgs>): THandlerId; overload;
        function addHandler(target: TMap; eventName: String; handler: TProc<TMouseEventArgs>): THandlerId; overload;
        function addHandler(target: TPolygon; eventName: String; handler: TProc<TMouseEventArgs>): THandlerId; overload;
        function addHandler(target: TPolygon; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>): THandlerId; overload;
        function addHandler(target: TPolyline; eventName: String; handler: TProc<TMouseEventArgs>): THandlerId; overload;
        function addHandler(target: TPolyline; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>): THandlerId; overload;
        function addHandler(target: TPushpin; eventName: String; handler: TProc<TMouseEventArgs>): THandlerId; overload;
        function addHandler(target: TPushpin; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>): THandlerId; overload;
        function addThrottledHandler(target: JSValue; eventName: String; handler: TProc<JSValue>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TInfobox; eventName: String; handler: TProc<TInfoboxEventArgs>): THandlerId; overload;
        function addThrottledHandler(target: TLayer; eventName: String; handler: TProc<TMouseEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TMap; eventName: String; handler: TProc<TMapTypeChangeEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TMap; eventName: String; handler: TProc<TMouseEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPolygon; eventName: String; handler: TProc<TMouseEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPolygon; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPolyline; eventName: String; handler: TProc<TMouseEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPolyline; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPushpin; eventName: String; handler: TProc<TMouseEventArgs>; throttleInterval: Double): THandlerId; overload;
        function addThrottledHandler(target: TPushpin; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>; throttleInterval: Double): THandlerId; overload;
        function hasHandler(target: JSValue; eventName: String): Boolean;

        procedure addOne(target: JSValue; eventName: String; handler: TProc<JSValue>); overload;
        procedure addOne(target: TInfobox; eventName: String; handler: TProc<TInfoboxEventArgs>); overload;
        procedure addOne(target: TLayer; eventName: String; handler: TProc<TMouseEventArgs>); overload;
        procedure addOne(target: TMap; eventName: String; handler: TProc<TMapTypeChangeEventArgs>); overload;
        procedure addOne(target: TMap; eventName: String; handler: TProc<TMouseEventArgs>); overload;
        procedure addOne(target: TPolygon; eventName: String; handler: TProc<TMouseEventArgs>); overload;
        procedure addOne(target: TPolygon; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>); overload;
        procedure addOne(target: TPolyline; eventName: String; handler: TProc<TMouseEventArgs>); overload;
        procedure addOne(target: TPolyline; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>); overload;
        procedure addOne(target: TPushpin; eventName: String; handler: TProc<TMouseEventArgs>); overload;
        procedure addOne(target: TPushpin; eventName: String; handler: TProc<TPrimitiveChangedEventArgs>); overload;
        procedure invoke(target: JSValue; evenName: String; args: JSValue);
        procedure removeHandler(handlerId: THandlerId);
      end;

      TGroundOverlay = class external name 'GroundOverlay' (TCustomOverlay)
      public
        metadata: JSValue; external name 'metadata';

        constructor new(options: TGroundOverlayOptions);

        function getBackgroundColor: TColor;
        function getBounds: TLocationRect;
        function getImageUrl: String;
        function getMap: TMap;
        function getOpacity: Double;
        function getRotation: Double;
        function getVisible: Boolean;

        procedure setOptions(options: TGroundOverlayOptions);
        procedure setVisible(visible: Boolean);
      end;

      THeading = class external name 'Heading'
      public
        class var East: Double;
        class var North: Double;
        class var South: Double;
        class var West: Double;
      end;

      TInfobox = class external name 'Infobox'
      public
        constructor new(location: TLocation; options: TInfoboxOptions);

        function getAnchor: TPoint;
        function getDescription: String;
        function getHeight: Double;
        function getHtmlContent: String;
        function getLocation: TLocation;
        function getMaxHeight: Double;
        function getMaxWidth: Double;
        function getOffset: TPoint;
        function getOptions: TInfoboxOptions;
        function getShowCloseButton: Boolean;
        function getShowPointer: Boolean;
        function getTitle: String;
        function getVisible: Boolean;
        function getWidth: Double;
        function getZIndex: Double;

        procedure setHtmlContent(content: String);
        procedure setLocation(loc: TLocation);
        procedure setMap(Map: TMap);
        procedure setOptions(options: TInfoboxOptions; ignoreDelay: Boolean);
      end;

      TLayerCollection = class external name 'LayerCollection'
      public
        length: Double;

        function indexOf(layer: TLayer): Double;

        procedure clear;
        procedure insert(layer: TLayer);
        procedure insertAll(layers: TArray<TLayer>);
        procedure remove(layer: TLayer);
        procedure removeAt(idx: Double);
      end;

      TLocation = class external name 'Location'
      public
        latitude: Double;
        longitude: Double;

        constructor new(latitude, longitude: Double);

        class function areEqual(location1: TLocation; location2: TLocation): Boolean;
        class function cloneFrom(source: TLocation): TLocation;
        class function normalizeLongitude(longitude: Double): Double;
        class function parseLatLong(str: String): TLocation;

        function clone: TLocation;
        function toString: String;
      end;

      TLocationRect = class external name 'LocationRect'
      public
        center: TLocation;
        height: Double;
        width: Double;

        constructor new(center: TLocation; width: Double; height: Double);

        class function fromCorners(northwest: TLocation; southeast: TLocation): TLocationRect;
        class function fromEdges(north: Double; west: Double; south: Double; east: Double): TLocationRect;
        class function fromLocations(locations: TArray<TLocation>): TLocationRect;
        class function fromShapes(shapes: TArray<TArray<TPrimitive>>): TLocationRect; overload;
        class function fromShapes(shapes: TArray<TPrimitive>): TLocationRect; overload;
        class function fromString(str: String): TLocationRect;
        class function merge(rect1: TLocationRect; rect2: TLocationRect): TLocationRect;

        function clone: TLocationRect;
        function contains(location: TLocation): Boolean;
        function crossesInternationalDateLine: Boolean;
        function getEast: Double;
        function getNorth: Double;
        function getNorthwest: TLocation;
        function getSouth: Double;
        function getSoutheast: TLocation;
        function getWest: Double;
        function intersects(rect: TLocationRect): Boolean;
        function splitByInternationalDateLine: TArray<TLocationRect>;
        function toString: String;

        procedure buffer(percentage: Double);
      end;

      TMap = class external name 'Map'
      public
        layers: TLayerCollection;

        constructor new(parentElement: String); overload;
        constructor new(parentElement: String; options: TMapOptions); overload;
        constructor new(parentElement: String; options: TViewOptions); overload;
        constructor new(parentElement: TJSHTMLElement); overload;
        constructor new(parentElement: TJSHTMLElement; options: TMapOptions); overload;
        constructor new(parentElement: TJSHTMLElement; options: TViewOptions); overload;

        class function getVersion: String;

        function getBounds: TLocationRect;
        function getCenter: TLocation;
        function getCulture: String;
        function getHeading: Double;
        function getHeight: Double;
        function getImageryId: String;
        function getMapTypeId: TMapTypeId;
        function getMetersPerPixel: Double;
        function getOptions: TMapOptions;
        function getPageX: Double;
        function getPageY: Double;
        function getPitch: Double;
        function getRootElement: TJSHTMLElement;
        function getUserRegion: String;
        function getWidth: Double;
        function getZoom: Double;
        function getZoomRange: TRange;
        function isMercator: Boolean;
        function isRotationEnabled: Boolean;
        function tryLocationToPixel(location: TArray<TLocation>; reference: JSValue): TArray<TPoint>;
        function tryPixelToLocation(point: TArray<TPoint>; reference: JSValue): TArray<TLocation>;

        class procedure getClosestPanorama(bounds: TLocationRect; success: TProc<TPanoramaInfo>; missingCoverage: TProc);

        procedure dispose;
        procedure getCopyrights(callback: TProc<TArray<String>>);
        procedure getCredentials(callback: TProc<String>);
        procedure setMapType(mapTypeId: TMapTypeId);
        procedure setOptions(options: TMapOptions);
        procedure setView(viewOptions: TViewOptions);
      end;

      TPoint = class external name 'Point'
      public
        x: Double;
        y: Double;

        constructor new(x: Double; y: Double);

        function add(point: TPoint): TPoint;
        function clone: TPoint;
        function equals(point: TPoint; tolerance: Double): Boolean;
        function subtract(point: TPoint): TPoint;
        function toString: String;
      end;

      TPointCompression = class external name 'ointCompression'
      public
        class function decode(value: String): TArray<TLocation>;
        class function encode(locations: TArray<TLocation>): String;
      end;

      TPolygon = class external name 'Polygon' (TPrimitive)
      public
        metadata: JSValue;

        constructor new(rings: TArray<TArray<TLocation>>; options: TPolygonOptions); overload;
        constructor new(rings: TArray<TLocation>; options: TPolygonOptions); overload;

        function getCursor: String;
        function getFillColor: TColor;
        function getGeneralizable: Boolean;
        function getLocations: TArray<TLocation>;
        function getRings: TArray<TArray<TLocation>>;
        function getStrokeColor: TColor;
        function getStrokeDashArray: TArray<Double>;
        function getStrokeDashArrayString: String; external name 'getStrokeDashArray';
        function getStrokeThickness: Double;
        function getVisible: Boolean;

        procedure setLocations(locations: TArray<TLocation>);
        procedure setOptions(options: TPolygonOptions);
        procedure setRings(rings: TArray<TArray<TLocation>>); overload;
        procedure setRings(rings: TArray<TLocation>); overload;
      end;

      TPolyline = class external name 'Polyline' (TPrimitive)
      public
        metadata: JSValue;

        constructor new(locations: TArray<TLocation>; options: TPolylineOptions);

        function getCursor: String;
        function getGeneralizable: Boolean;
        function getLocations: TArray<TLocation>;
        function getStrokeColor: TColor;
        function getStrokeDashArray: TArray<Double>;
        function getStrokeDashArrayString: String; external name 'getStrokeDashArray';
        function getStrokeThickness: Double;
        function getVisible: Boolean;

        procedure setLocations(locations: TArray<TLocation>);
        procedure setOptions(options: TPolylineOptions);
      end;

      TPushpin = class external name 'Pushpin' (TPrimitive)
      public
        metadata: JSValue;

        constructor new(location: TLocation; options: TPushpinOptions);

        function getAnchor: TPoint;
        function getClickedStyleEnabled: Boolean;
        function getColor: TColor;
        function getCursor: String;
        function getDraggable: Boolean;
        function getHoverStyleEnabled: Boolean;
        function getIcon: String;
        function getLocation: TLocation;
        function getRoundClickableArea: Boolean;
        function getSubTitle: String;
        function getText: String;
        function getTextOffset: TPoint;
        function getTitle: String;
        function getVisible: Boolean;

        procedure setLocation(location: TLocation);
        procedure setOptions(options: TPushpinOptions);
      end;

      TPyramidTileId = class external name 'PyramidTileId'
      public
        pixelHeight: Double;
        pixelWidth: Double;
        quadKey: String;
        x: Double;
        y: Double;
        zoom: Double;

        constructor new(x: Double; y: Double; zoom: Double; width: Double; height: Double);

        class function areEqual(tileId1: TPyramidTileId; tileId2: TPyramidTileId): Boolean;
        class function fromQuadKey(quadkey: String; width: Double; height: Double): TPyramidTileId;
      end;

      TTileLayer = class external name 'TileLayer' (TLayer)
      public
        metadata: JSValue;

        constructor new(options: TTileLayerOptions);

        function getOpacity: Double;
        function getTileSource: TTileSource;
        function getVisible: Boolean;
        function getZIndex: Double;

        procedure setOpacity(opacity: Double);
        procedure setOptions(options: TTileLayerOptions);
        procedure setVisible(show: Boolean);
        procedure setZIndex(idx: Double);
      end;

      TTileSource = class external name 'TileSource'
      public
        constructor new(options: TTileSourceOptions);

        function getBounds: TLocationRect;
        function getHeight: Double;
        function getMaxZoom: Double;
        function getMinZoom: Double;
        function getUriConstructor(tile: TPyramidTileId): String; overload;
        function getUriConstructor: String; overload;
        function getWidth: Double;
      end;
    public
      class var Credentials: String;

      procedure getIsBirdseyeAvailable(loc: TLocation; heading: Double; callback: TProc<Boolean>); overload;
      procedure getIsBirdseyeAvailable(loc: TLocation; heading: THeading; callback: TProc<Boolean>); overload;
      procedure loadModule(moduleName: TArray<String>; options: TModuleOptions); overload;
      procedure loadModule(moduleName: TArray<String>; options: TProc); overload;
      procedure moduleLoaded(moduleName: String);
      procedure registerModule(moduleName: String; url: String; styles: TStyleUrl);
    end;
  end;

  TAddress = class
  public
    addressLine: String;
    adminDistrict: String;
    countryRegion: String;
    countryRegionISO2: String;
    district: String;
    formattedAddress: String;
    locality: String;
    postalCode: String;
  end;

  TAnimatedFrameEventArgs = class
  public
    animatedTileLayer: TMicrosoft.TMaps.TAnimatedTileLayer;
    index: Double;
  end;

  TAnimatedTileLayerOptions = class
  public
    autoPlay: Boolean;
    frameRate: Double;
    loadingScreen: TMicrosoft.TMaps.TCustomOverlay;
    maxTotalLoadTime: Double;
    mercator: TArray<TMicrosoft.TMaps.TTileSource>;
    visible: Boolean;
  end;

  TCustomOverlayOptions = class
  public
    beneathLabels: Boolean;
  end;

  TGroundOverlayOptions = class(TCustomOverlayOptions)
  public
    backgroundColor: TMicrosoft.TMaps.TColor;
    bounds: TMicrosoft.TMaps.TLocationRect;
    imageUrl: String;
    opacity: Double;
    rotation: Double;
    visible: Boolean;
  end;

  THandlerId = class
  end;

  TInfoboxOptions  = class
  public
    description: String;
    closeDelayTime: Double;
    htmlContent: String;
    location: TMicrosoft.TMaps.TLocation;
    maxHeight: Double;
    maxWidth: Double;
    offset: TMicrosoft.TMaps.TPoint;
    showCloseButton: Boolean;
    showPointer: Boolean;
    title: String;
    visible: Boolean;
    zIndex: Double;
  end;

  TInfoboxEventArgs = class
  public
    eventName: String;
    pageX: Double;
    pageY: Double;
    target: TMicrosoft.TMaps.TInfobox;
    targetType: String;
    originalEvent: TJSMouseEvent;
  end;

  TMapOptions = class
  public
    allowHidingLabelsOfRoad: Boolean;
    allowInfoboxOverflow: Boolean;
    backgroundColor: TMicrosoft.TMaps.TColor;
    customMapStyle: TCustomMapStyle;
    disableBirdseye: Boolean;
    disableKeyboardInput: Boolean;
    disableMapTypeSelectorMouseOver: Boolean;
    disablePanning: Boolean;
    disableScrollWheelZoom: Boolean;
    disableStreetside: Boolean;
    disableStreetsideAutoCoverage: Boolean;
    disableZooming: Boolean;
    enableClickableLogo: Boolean;
    enableCORS: Boolean;
    enableHighDpi: Boolean;
    enableInertia: Boolean;
    liteMode: Boolean;
    maxBounds: TMicrosoft.TMaps.TLocationRect;
    maxZoom: Double;
    minZoom: Double;
    navigationBarMode: TMicrosoft.TMaps.TNavigationBarMode;
    navigationBarOrientation: TMicrosoft.TMaps.TNavigationBarOrientation;
    showBreadcrumb: Boolean;
    showDashboard: Boolean;
    showLocateMeButton: Boolean;
    showLogo: Boolean;
    showMapTypeSelector: Boolean;
    showScalebar: Boolean;
    showTrafficButton: Boolean;
    showTermsLink: Boolean;
    showZoomButtons: Boolean;
    streetsideOptions: TStreetsideOptions;
    supportedMapTypes: TArray<TMicrosoft.TMaps.TMapTypeId>;
  end;

  TMapTypeChangeEventArgs = class
  public
    newMapTypeId: TMicrosoft.TMaps.TMapTypeId;
    oldMapTypeId: TMicrosoft.TMaps.TMapTypeId;
    target: TMicrosoft.TMaps.TMap;
    targetType: String;
  end;

  TModuleOptions = class
  public
    errorCallback: TProc;
    credentials: String;
  end;

  TMouseEventArgs = class
  public
    eventName: String;
    isPrimary: Boolean;
    isSecondary: Boolean;
    layer: TMicrosoft.TMaps.TLayer;
    location: TMicrosoft.TMaps.TLocation;
    pageX: Double;
    pageY: Double;
    point: TMicrosoft.TMaps.TPoint;
    target: TMicrosoft.TMaps.TMap;
    targetPrimitive: TMicrosoft.TMaps.TPrimitive; external name 'target';
    targetType: String;
    wheelDelta: Double;
  end;

  TPanoramaInfo = class
  public
    cd: String;
  end;

  TPrimitiveChangedEventArgs = class
  public
    sender: TMicrosoft.TMaps.TPrimitive;
    name: String;
  end;

  TPrimitiveOptions = class
  public
    cursor: String;
    visible: Boolean;
  end;

  TPolylineOptions = class(TPrimitiveOptions)
  public
    generalizable: Boolean;
    strokeColor: TMicrosoft.TMaps.TColor;
    strokeDashArray: TArray<Double>;
    strokeDashArrayString: String; external name 'strokeDashArray';
    strokeThickness: Double;
  end;

  TPolygonOptions = class(TPolylineOptions)
  public
    fillColor: TMicrosoft.TMaps.TColor;
  end;

  TPushpinOptions = class(TPrimitiveOptions)
  public
    anchor: TMicrosoft.TMaps.TPoint;
    color: TMicrosoft.TMaps.TColor;
    draggable: Boolean;
    enableClickedStyle: Boolean;
    enableHoverStyle: Boolean;
    icon: String;
    roundClickableArea: Boolean;
    subTitle: String;
    title: String;
    text: String;
    textOffset: TMicrosoft.TMaps.TPoint;
  end;

  TRange = class
  public
    min: Double;
    max: Double;
  end;

  TStreetsideOptions  = class
  public
    disablePanoramaNavigation: Boolean;
    locationToLookAt: TMicrosoft.TMaps.TLocation;
    onErrorLoading: TProc;
    onSuccessLoading: TProc;
    overviewMapMode: TMicrosoft.TMaps.TOverviewMapMode;
    panoramaInfo: TPanoramaInfo;
    panoramaLookupRadius: Double;
    showCurrentAddress: Boolean;
    showExitButton: Boolean;
    showHeadingCompass: Boolean;
    showProblemReporting: Boolean;
    showZoomButtons: Boolean;
  end;

  TStylesOptions = class
  public
    pushpinOptions: TPushpinOptions;
    polylineOptions: TPolylineOptions;
    polygonOptions: TPolygonOptions;
  end;

  TStyleUrl = class
  public
    styleURLs: TArray<String>;
  end;

  TTileLayerOptions = class
  public
    enableCORS: Boolean;
    downloadTimeout: Double;
    mercator: TMicrosoft.TMaps.TTileSource;
    opacity: Double;
    useCredentialsForCORS: Boolean;
    visible: Boolean;
    zIndex: Double;
  end;

  TTileSourceOptions = class
  public
    bounds: TMicrosoft.TMaps.TLocationRect;
    maxZoom: Double;
    minZoom: Double;
    uriConstructor: String;
    uriConstructorFunction: TFunc<TMicrosoft.TMaps.TPyramidTileId, String>; external name 'uriConstructor';
  end;

  TViewOptions = class
  public
    bounds: TMicrosoft.TMaps.TLocationRect;
    center: TMicrosoft.TMaps.TLocation;
    centerOffset: TMicrosoft.TMaps.TPoint;
    heading: Double;
    labelOverlay: TMicrosoft.TMaps.TLabelOverlay;
    mapTypeId: TMicrosoft.TMaps.TMapTypeId;
    padding: Double;
    pitch: Double;
    zoom: Double;
  end;

  TMapElementStyle = class
  public
    fillColor: String;
    labelColor: String;
    labelOutlineColor: String;
    labelVisible: boolean;
    strokeColor: String;
    visible: Boolean;
  end;

  TBorderedMapElementStyle = class(TMapElementStyle)
  public
    borderOutlineColor: String;
    borderStrokeColor: String;
    borderVisible: Boolean;
  end;

  TSettingsStyle = class
  public
    landColor: String;
    shadedReliefVisible: Boolean;
  end;

  TMapElements = class
  public
    adminDistrict: TBorderedMapElementStyle;
    adminDistrictCapital: TMapElementStyle;
    airport: TMapElementStyle;
    area: TMapElementStyle;
    arterialRoad: TMapElementStyle;
    building: TMapElementStyle;
    business: TMapElementStyle;
    capital: TMapElementStyle;
    cemetery: TMapElementStyle;
    continent: TMapElementStyle;
    controlledAccessHighway: TMapElementStyle;
    countryRegion: TBorderedMapElementStyle;
    countryRegionCapital: TMapElementStyle;
    district: TBorderedMapElementStyle;
    education: TMapElementStyle;
    educationBuilding: TMapElementStyle;
    foodPoint: TMapElementStyle;
    forest: TMapElementStyle;
    golfCourse: TMapElementStyle;
    highSpeedRamp: TMapElementStyle;
    highway: TMapElementStyle;
    indigenousPeoplesReserve: TMapElementStyle;
    island: TMapElementStyle;
    majorRoad: TMapElementStyle;
    mapElement: TMapElementStyle;
    medical: TMapElementStyle;
    medicalBuilding: TMapElementStyle;
    military: TMapElementStyle;
    naturalPoint: TMapElementStyle;
    nautical: TMapElementStyle;
    neighborhood: TMapElementStyle;
    park: TMapElementStyle;
    peak: TMapElementStyle;
    playingField: TMapElementStyle;
    point: TMapElementStyle;
    pointOfInterest: TMapElementStyle;
    political: TBorderedMapElementStyle;
    populatedPlace: TMapElementStyle;
    railway: TMapElementStyle;
    ramp: TMapElementStyle;
    reserve: TMapElementStyle;
    river: TMapElementStyle;
    road: TMapElementStyle;
    roadExit: TMapElementStyle;
    runway: TMapElementStyle;
    sand: TMapElementStyle;
    shoppingCenter: TMapElementStyle;
    stadium: TMapElementStyle;
    street: TMapElementStyle;
    structure: TMapElementStyle;
    tollRoad: TMapElementStyle;
    trail: TMapElementStyle;
    transit: TMapElementStyle;
    transitBuilding: TMapElementStyle;
    transportation: TMapElementStyle;
    unpavedStreet: TMapElementStyle;
    vegetation: TMapElementStyle;
    volcanicPeak: TMapElementStyle;
    water: TMapElementStyle;
    waterPoint: TMapElementStyle;
    waterRoute: TMapElementStyle;
  end;

  TCustomMapStyle = class
  public
    elements: TMapElements;
    settings: TSettingsStyle;
    version: String;
  end;

function InitializeMap(Key: String): TJSPromise;

implementation

function InitializeMap(Key: String): TJSPromise;
begin
  Result := TJSPromise.New(
    procedure(Resolve, Reject: TJSPromiseResolver)
    var
      Script: TJSHTMLScriptElement;

    begin
      Script := TJSHTMLScriptElement(document.createElement('script'));
      Script.async := False;
      Script.src := Format('https://www.bing.com/maps/sdk/mapcontrol?key=%s', [Key]);
      Script.onload :=
        function(Event: TEventListenerEvent): Boolean
        var
          Options: TJSIdleCallbackOptions;

        begin
          Options := TJSIdleCallbackOptions.Create;
          Options.timeOut := 100;

          Window.requestIdleCallback(
            procedure (idleDeadline: TJSIdleDeadline)
            begin
              Resolve(True);
            end, Options);

          Result := True;
        end;

      document.head.appendChild(Script);
    end);
end;

end.

