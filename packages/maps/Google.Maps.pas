unit Google.Maps;

interface

{$modeswitch externalclass}

uses JS, SysUtils, GeoJSON, Web;

type
  TAddFeatureEvent = class;
  TAutocompleteOptions = class;
  TAutocompletePrediction = class;
  TAutocompleteResponse = class;
  TAutocompleteSessionToken = class;
  TAutocompletionRequest = class;
  TCircleLiteral = class;
  TCircleOptions = class;
  TComponentRestrictions = class;
  TDataOptions = class;
  TDirectionsGeocodedWaypoint = class;
  TDirectionsLeg = class;
  TDirectionsRendererOptions = class;
  TDirectionsRequest = class;
  TDirectionsResult = class;
  TDirectionsRoute = class;
  TDirectionsStep = class;
  TDirectionsWaypoint = class;
  TDistance = class;
  TDistanceMatrixRequest = class;
  TDistanceMatrixResponse = class;
  TDistanceMatrixResponseElement = class;
  TDistanceMatrixResponseRow = class;
  TDrawingControlOptions = class;
  TDrawingManagerOptions = class;
  TDrivingOptions = class;
  TDuration = class;
  TElevationResult = class;
  TFeatureOptions = class;
  TFindPlaceFromPhoneNumberRequest = class;
  TFindPlaceFromQueryRequest = class;
  TFullscreenControlOptions = class;
  TGeoJsonOptions = class;
  TGeocoderAddressComponent = class;
  TGeocoderComponentRestrictions = class;
  TGeocoderGeometry = class;
  TGeocoderRequest = class;
  TGeocoderResponse = class;
  TGeocoderResult = class;
  TGroundOverlayOptions = class;
  THeatmapLayerOptions = class;
  TIcon = class;
  TIconMouseEvent = class;
  TIconSequence = class;
  TImageMapTypeOptions = class;
  TInfoWindowOptions = class;
  TKmlAuthor = class;
  TKmlFeatureData = class;
  TKmlLayerMetadata = class;
  TKmlLayerOptions = class;
  TKmlMouseEvent = class;
  TLatLngBoundsLiteral = class;
  TLatLngLiteral = class;
  TLocationElevationRequest = class;
  TLocationElevationResponse = class;
  TMapCanvasProjection = class;
  TMapMouseEvent = class;
  TMapOptions = class;
  TMapPanes = class;
  TMapRestriction = class;
  TMapType = class;
  TMapTypeControlOptions = class;
  TMapTypeStyle = class;
  TMapsEventListener = class;
  TMarkerLabel = class;
  TMarkerOptions = class;
  TMarkerShape = class;
  TMaxZoomResult = class;
  TMotionTrackingControlOptions = class;
  TMouseEvent = class;
  TOverlayCompleteEvent = class;
  TPadding = class;
  TPanControlOptions = class;
  TPanoProviderOptions = class;
  TPathElevationRequest = class;
  TPathElevationResponse = class;
  TPinOptions = class;
  TPlace = class;
  TPolyMouseEvent = class;
  TPolygonOptions = class;
  TPolylineOptions = class;
  TPredictionSubstring = class;
  TPredictionTerm = class;
  TProjection = class;
  TQueryAutocompletionRequest = class;
  TRectangleOptions = class;
  TRemoveFeatureEvent = class;
  TRemovePropertyEvent = class;
  TRotateControlOptions = class;
  TScaleControlOptions = class;
  TSearchBoxOptions = class;
  TSetGeometryEvent = class;
  TSetPropertyEvent = class;
  TStreetViewAddressControlOptions = class;
  TStreetViewControlOptions = class;
  TStreetViewLink = class;
  TStreetViewLocation = class;
  TStreetViewLocationRequest = class;
  TStreetViewPanoRequest = class;
  TStreetViewPanoramaData = class;
  TStreetViewPanoramaOptions = class;
  TStreetViewPov = class;
  TStreetViewResponse = class;
  TStreetViewTileData = class;
  TStructuredFormatting = class;
  TStyleOptions = class;
  TStyledMapTypeOptions = class;
  TSymbol = class;
  TTextSearchRequest = class;
  TTimeGoogle = class;
  TTrafficLayerOptions = class;
  TTransitAgency = class;
  TTransitDetails = class;
  TTransitFare = class;
  TTransitLine = class;
  TTransitOptions = class;
  TTransitStop = class;
  TTransitVehicle = class;
  TWeightedLocation = class;
  TZoomControlOptions = class;

  TGoogle = class external name 'google'
  public type
    TMaps = class external name 'maps'
    public type
      TLatLng = class;
      TLatLngBounds = class;
      TMap = class;
      TMapTypeRegistry = class;
      TOverlayType = class;
      TPlacesServiceStatus = class;
      TPoint = class;
      TSize = class;
      TStreetViewPanorama = class;

      TAnimation = (BOUNCE, DROP);
      TControlPosition = (BOTTOM_CENTER, BOTTOM_LEFT, BOTTOM_RIGHT, LEFT_BOTTOM, LEFT_CENTER, LEFT_TOP, RIGHT_BOTTOM, RIGHT_CENTER, RIGHT_TOP, TOP_CENTER, TOP_LEFT, TOP_RIGHT);
      TMapTypeControlStyle = (DEFAULT, DROPDOWN_MENU, HORIZONTAL_BAR);
      TStrokePosition = (CENTER, INSIDE, OUTSIDE);
      TSymbolPath = (BACKWARD_CLOSED_ARROW, BACKWARD_OPEN_ARROW, CIRCLE, FORWARD_CLOSED_ARROW, FORWARD_OPEN_ARROW);
      TUnitSystem = (IMPERIAL, METRIC);
      TRankBy = (DISTANCE, PROMINENCE);

      TMVCObject = class external name 'MVCObject'
      public
        function addListener(eventName: String; handler: TProc): TMapsEventListener;
        procedure bindTo(key: String; target: TMVCObject; targetKey: String; noNotify: Boolean);
        function get(key: String): JSValue;
        procedure notify(key: String);
        procedure &set(key: String; value: JSValue);
        procedure setValues(values: TJSObject);
        procedure unbind(key: String);
        procedure unbindAll;
      end;

      TBicyclingLayer = class external name 'BicyclingLayer' (TMVCObject)
      public
        function getMap: TMap;
        procedure setMap(map: TMap);
      end;

      TCircle = class external name 'Circle' (TMVCObject)
      public
        constructor new(opts: TCircleOptions);
        function getBounds: TLatLngBounds;
        function getCenter: TLatLng;
        function getDraggable: Boolean;
        function getEditable: Boolean;
        function getMap: TMap;
        function getRadius: Double;
        function getVisible: Boolean;
        procedure setCenter(center: TLatLng); overload;
        procedure setCenter(center: TLatLngLiteral); overload;
        procedure setDraggable(draggable: Boolean);
        procedure setEditable(editable: Boolean);
        procedure setMap(map: TMap);
        procedure setOptions(options: TCircleOptions);
        procedure setRadius(radius: Double);
        procedure setVisible(visible: Boolean);
      end;

      TData = class external name 'Data' (TMVCObject)
      public type
        TGeometry = class;
        TPolygon = class;

        TFeature = class external name 'Feature'
        public
          constructor new(options: TFeatureOptions);

          procedure forEachProperty(callback: TProc<JSValue, String>);
          function getGeometry: TGeometry;
          function getId: Double;
          function getIdString: String; external name 'getId';
          function getProperty(name: String): JSValue;
          procedure removeProperty(name: String);
          procedure setGeometry(newGeometry: TGeometry); overload;
          procedure setGeometry(newGeometry: TLatLng); overload;
          procedure setGeometry(newGeometry: TLatLngLiteral); overload;
          procedure setProperty(name: String; newValue: JSValue);
          procedure toGeoJson(callback: TProc<TJSObject>);
        end;

        TGeometry = class external name 'Geometry'
        public
          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getType: String;
        end;

        TGeometryCollection = class external name 'GeometryCollection' (TGeometry)
        public
          constructor new(elements: TArray<TGeometry>); overload;
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TGeometry>;
          function getAt(n: Double): TGeometry;
          function getLength: Double;
          function getType: String;
        end;

        TLineString = class external name 'LineString' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TLatLng>;
          function getAt(n: Double): TLatLng;
          function getLength: Double;
          function getType: String;
        end;

        TLinearRing = class external name 'LinearRing' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TLatLng>;
          function getAt(n: Double): TLatLng;
          function getLength: Double;
          function getType: String;
        end;

        TMultiLineString = class external name 'MultiLineString' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TLineString>;
          function getAt(n: Double): TLineString;
          function getLength: Double;
          function getType: String;
        end;

        TMultiPoint = class external name 'MultiPoint' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TLatLng>;
          function getAt(n: Double): TLatLng;
          function getLength: Double;
          function getType: String;
        end;

        TMultiPolygon = class external name 'MultiPolygon' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;
          constructor new(elements: TArray<TLinearRing>); overload;
          constructor new(elements: TArray<TPolygon>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);

          function getArray: TArray<TPolygon>;
          function getAt(n: Double): TPolygon;
          function getLength: Double;
          function getType: String;
        end;

        TPoint = class external name 'Point' (TGeometry)
        public
          constructor new(elements: TArray<TLatLng>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function get: TLatLng;
          function getType: String;
        end;

        TPolygon = class external name 'Polygon' (TGeometry)
        public
          constructor new(elements: TArray<TArray<TLatLng>>); overload;
          constructor new(elements: TArray<TLatLngLiteral>); overload;

          procedure forEachLatLng(callback: TProc<TLatLng>);
          function getArray: TArray<TLinearRing>;
          function getAt(n: Double): TLinearRing;
          function getLength: Double;
          function getType: String;
        end;
      public
        constructor new(options: TDataOptions);
        function add(feature: TFeature): TFeature; overload;
        function add(feature: TFeatureOptions): TFeature; overload;
        function addGeoJson(geoJson: TGeoJSONObject; options: TGeoJsonOptions): TArray<TFeature>;
        function contains(feature: TFeature): Boolean;
        procedure forEach(callback: TProc<TFeature>);
        function getControlPosition: TControlPosition;
        function getControls: TArray<String>;
        function getDrawingMode: String;
        function getFeatureById(id: Double): TFeature; overload;
        function getFeatureById(id: String): TFeature; overload;
        function getMap: TMap;
        function getStyle: TStyleOptions;
        function getStyleFunction: TFunc<TFeature, TStyleOptions>; external name 'getStyle';
        procedure loadGeoJson(url: String; options: TGeoJsonOptions; callback: TProc<TArray<TFeature>>);
        procedure overrideStyle(feature: TFeature; style: TStyleOptions);
        procedure remove(feature: TFeature);
        procedure revertStyle(feature: TFeature);
        procedure setControlPosition(controlPosition: TControlPosition);
        procedure setControls(controls: TArray<String>);
        procedure setDrawingMode(drawingMode: String);
        procedure setMap(map: TMap);
        procedure setStyle(style: TStyleOptions); overload;
        procedure setStyle(style: TFunc<TFeature, TStyleOptions>); overload;
        procedure toGeoJson(callback: TProc<TGeoJSONObject>);
      end;

      TDirectionsRenderer = class external name 'DirectionsRenderer' (TMVCObject)
      public
        constructor new(opts: TDirectionsRendererOptions);
        function getDirections: TDirectionsResult;
        function getMap: TMap;
        function getPanel: TJSNode;
        function getRouteIndex: Double;
        procedure setDirections(directions: TDirectionsResult);
        procedure setMap(map: TMap);
        procedure setOptions(options: TDirectionsRendererOptions);
        procedure setPanel(panel: TJSNode);
        procedure setRouteIndex(routeIndex: Double);
      end;

      TDirectionsStatus = class
      public const
        INVALID_REQUEST = 'INVALID_REQUEST';
        MAX_WAYPOINTS_EXCEEDED = 'MAX_WAYPOINTS_EXCEEDED';
        NOT_FOUND = 'NOT_FOUND';
        OK = 'OK';
        OVER_QUERY_LIMIT = 'OVER_QUERY_LIMIT';
        REQUEST_DENIED = 'REQUEST_DENIED';
        UNKNOWN_ERROR = 'UNKNOWN_ERROR';
        ZERO_RESULTS = 'ZERO_RESULTS';
      end;

      TDirectionsService = class external name 'DirectionsService'
      public
        function route(request: TDirectionsRequest; callback: TProc<TDirectionsResult, TDirectionsStatus>): TJSPromise;
      end;

      TDistanceMatrixService = class external name 'DistanceMatrixService'
      public type
        TDistanceMatrixStatus = (INVALID_REQUEST, MAX_DIMENSIONS_EXCEEDED, MAX_ELEMENTS_EXCEEDED, OK, OVER_QUERY_LIMIT, REQUEST_DENIED, UNKNOWN_ERROR);
      public
        function getDistanceMatrix(request: TDistanceMatrixRequest; callback: TProc<TDistanceMatrixResponse, TDistanceMatrixStatus>): TJSPromise;
      end;

      TElevationStatus = class
      public const
        INVALID_REQUEST = 'INVALID_REQUEST';
        OK = 'OK';
        OVER_QUERY_LIMIT = 'OVER_QUERY_LIMIT';
        REQUEST_DENIED = 'REQUEST_DENIED';
        UNKNOWN_ERROR = 'UNKNOWN_ERROR';
      end;

      TElevationService = class external name 'ElevationService'
      public
        function getElevationAlongPath(request: TPathElevationRequest; callback: TProc<TArray<TElevationResult>, TElevationStatus>): TJSPromise;
        function getElevationForLocations(request: TLocationElevationRequest; callback: TProc<TArray<TElevationResult>, TElevationStatus>): TJSPromise;
      end;

      TGeocoderStatus = class
      public const
        ERROR = 'ERROR';
        INVALID_REQUEST = 'INVALID_REQUEST';
        OK = 'OK';
        OVER_QUERY_LIMIT = 'OVER_QUERY_LIMIT';
        REQUEST_DENIED = 'REQUEST_DENIED';
        UNKNOWN_ERROR = 'UNKNOWN_ERROR';
        ZERO_RESULTS = 'ZERO_RESULTS';
      end;

      TGeocoder = class external name 'Geocoder'
      public
        function geocode(request: TGeocoderRequest; callback: TProc<TArray<TGeocoderResult>, TGeocoderStatus>): TJSPromise;
      end;

      TGroundOverlay = class external name 'GroundOverlay' (TMVCObject)
      public
        constructor new(url: String; bounds: TLatLngBounds; opts: TGroundOverlayOptions); overload;
        constructor new(url: String; bounds: TLatLngBoundsLiteral; opts: TGroundOverlayOptions); overload;
        function getBounds: TLatLngBounds;
        function getMap: TMap;
        function getOpacity: Double;
        function getUrl: String;
        procedure setMap(map: TMap);
        procedure setOpacity(opacity: Double);
      end;

      TImageMapType = class external name 'ImageMapType' (TMVCObject)
      public
        alt: String;
        maxZoom: Double;
        minZoom: Double;
        name: String;
        projection: TProjection;
        radius: Double;
        tileSize: TSize;

        constructor new(opts: TImageMapTypeOptions);

        function getOpacity: Double;
        function getTile(tileCoord: TPoint; zoom: Double; ownerDocument: TJSDocument): TJSNode;
        procedure releaseTile(tileDiv: TJSNode);
        procedure setOpacity(opacity: Double);
      end;

      TInfoWindow = class external name 'InfoWindow' (TMVCObject)
      public
        constructor new(opts: TInfoWindowOptions);
        procedure close;
        function getContent: TJSNode;
        function getContentString: String; external name 'getContent';
        function getPosition: TLatLng;
        function getZIndex: Double;
        procedure open(map: TMap; anchor: TMVCObject); overload;
        procedure open(map: TStreetViewPanorama; anchor: TMVCObject); overload;
        procedure setContent(content: TJSNode); overload;
        procedure setContent(content: String); overload;
        procedure setOptions(options: TInfoWindowOptions);
        procedure setPosition(position: TLatLng); overload;
        procedure setPosition(position: TLatLngLiteral); overload;
        procedure setZIndex(zIndex: Double);
      end;

      TKmlLayerStatus = class external name 'KmlLayerStatus'
      public const
        DOCUMENT_NOT_FOUND = 'DOCUMENT_NOT_FOUND';
        DOCUMENT_TOO_LARGE = 'DOCUMENT_TOO_LARGE';
        FETCH_ERROR = 'FETCH_ERROR';
        INVALID_DOCUMENT = 'INVALID_DOCUMENT';
        INVALID_REQUEST = 'INVALID_REQUEST';
        LIMITS_EXCEEDED = 'LIMITS_EXCEEDED';
        OK = 'OK';
        TIMED_OUT = 'TIMED_OUT';
        UNKNOWN = 'UNKNOWN';
      end;

      TKmlLayer = class external name 'KmlLayer' (TMVCObject)
      public
        constructor new(opts: TKmlLayerOptions);
        function getDefaultViewport: TLatLngBounds;
        function getMap: TMap;
        function getMetadata: TKmlLayerMetadata;
        function getStatus: TKmlLayerStatus;
        function getUrl: String;
        function getZIndex: Double;
        procedure setMap(map: TMap);
        procedure setOptions(options: TKmlLayerOptions);
        procedure setUrl(url: String);
        procedure setZIndex(zIndex: Double);
      end;

      TLatLng = class external name 'LatLng'
      public
        constructor new(lat, lng: Double); overload;
        constructor new(lat, lng: Double; lngOrNoWrap, noWrap: Boolean); overload;
        constructor new(latLngLiteral: TLatLngLiteral); overload;
        constructor new(latLngLiteral: TLatLngLiteral; lngOrNoWrap, noWrap: Boolean); overload;
        function equals(other: TLatLng): Boolean;
        function lat: Double;
        function lng: Double;
        function toJSON: TLatLngLiteral;
        function toString: String;
        function toUrlValue(precision: Double): String;
      end;

      TLatLngBounds = class external name 'LatLngBounds'
      public
        constructor new(sw, ne: TLatLng); overload;
        constructor new(sw, ne: TLatLngLiteral); overload;
        function contains(latLng: TLatLng): Boolean; overload;
        function contains(latLng: TLatLngLiteral): Boolean; overload;
        function equals(other: TLatLng): Boolean; overload;
        function equals(other: TLatLngBounds): Boolean; overload;
        function extend(point: TLatLng): TLatLngBounds; overload;
        function extend(point: TLatLngLiteral): TLatLngBounds; overload;
        function getCenter: TLatLng;
        function getNorthEast: TLatLng;
        function getSouthWest: TLatLng;
        function intersects(other: TLatLngBounds): Boolean; overload;
        function intersects(other: TLatLngBoundsLiteral): Boolean; overload;
        function isEmpty: Boolean;
        function toJSON: TLatLngBoundsLiteral;
        function toSpan: TLatLng;
        function toString: String;
        function toUrlValue(precision: Double): String;
        function union(other: TLatLngBounds): TLatLngBounds; overload;
        function union(other: TLatLngBoundsLiteral): TLatLngBounds; overload;
      end;

      TMVCArray<T> = class external name 'MVCArray' (TMVCObject)
      public
        constructor new(&array: TArray<T>);
        procedure clear;
        procedure forEach(callback: TProc<T, Double>);
        function getArray: TArray<T>;
        function getAt(i: Double): T;
        function getLength: Double;
        procedure insertAt(i: Double; elem: T);
        function pop: T;
        function push(elem: T): Double;
        function removeAt(i: Double): T;
        procedure setAt(i: Double; elem: T);
      end;

      TMapTypeId = class external name 'MapTypeId'
      public const
        HYBRID = 'HYBRID';
        ROADMAP = 'ROADMAP';
        SATELLITE = 'SATELLITE';
        TERRAIN = 'TERRAIN';
      end;

      TMap = class external name 'Map' (TMVCObject)
      public
        controls: TArray<TMVCArray<JSValue>>;
        data: TData;
        mapTypes: TMapTypeRegistry;
        overlayMapTypes: TMVCArray<JSValue>;

        constructor new(mapDiv: TJSHTMLElement; opts: TMapOptions);

        function getBounds: TLatLngBounds;
        function getCenter: TLatLng;
        function getClickableIcons: Boolean;
        function getDiv: TJSHTMLElement;
        function getHeading: Double;
        function getMapTypeId: String;
        function getProjection: TProjection;
        function getStreetView: TStreetViewPanorama;
        function getTilt: Double;
        function getZoom: Double;

        procedure fitBounds(bounds: TLatLngBounds; padding: Double); overload;
        procedure fitBounds(bounds: TLatLngBounds; padding: TPadding); overload;
        procedure fitBounds(bounds: TLatLngBoundsLiteral; padding: Double); overload;
        procedure fitBounds(bounds: TLatLngBoundsLiteral; padding: TPadding); overload;
        procedure panBy(x, y: Double);
        procedure panTo(latLng: TLatLng); overload;
        procedure panTo(latLng: TLatLngLiteral); overload;
        procedure panToBounds(bounds: TLatLngBounds; padding: Double); overload;
        procedure panToBounds(bounds: TLatLngBounds; padding: TPadding); overload;
        procedure panToBounds(bounds: TLatLngBoundsLiteral; padding: Double); overload;
        procedure panToBounds(bounds: TLatLngBoundsLiteral; padding: TPadding); overload;
        procedure setCenter(latlng: TLatLng); overload;
        procedure setCenter(latlng: TLatLngLiteral); overload;
        procedure setClickableIcons(value: Boolean);
        procedure setHeading(heading: Double);
        procedure setMapTypeId(mapTypeId: String);
        procedure setOptions(options: TMapOptions);
        procedure setStreetView(panorama: TStreetViewPanorama);
        procedure setTilt(tilt: Double);
        procedure setZoom(zoom: Double);
      end;

      TMapTypeRegistry = class external name 'MapTypeRegistry' (TMVCObject)
      public
        procedure &set(id: String; mapType: JSValue);
      end;

      TMarker = class external name 'Marker' (TMVCObject)
      public
        constructor new(opts: TMarkerOptions);
        function getAnimation: TAnimation;
        function getClickable: Boolean;
        function getCursor: String;
        function getDraggable: Boolean;
        function getIcon: JSValue;
        function getLabel: TMarkerLabel;
        function getMap: TMap;
        function getStreetViewPanorama: TStreetViewPanorama; external name 'getMap';
        function getOpacity: Double;
        function getPosition: TLatLng;
        function getShape: TMarkerShape;
        function getTitle: String;
        function getVisible: Boolean;
        function getZIndex: Double;
        procedure setAnimation(animation: TAnimation);
        procedure setClickable(flag: Boolean);
        procedure setCursor(cursor: String);
        procedure setDraggable(flag: Boolean);
        procedure setIcon(icon: String); overload;
        procedure setIcon(icon: TIcon); overload;
        procedure setIcon(icon: TSymbol); overload;
        procedure setLabel(&label: String); overload;
        procedure setLabel(&label: TMarkerLabel); overload;
        procedure setMap(map: TMap); overload;
        procedure setMap(map: TStreetViewPanorama); overload;
        procedure setOpacity(opacity: Double);
        procedure setOptions(options: TMarkerOptions);
        procedure setPosition(latlng: TLatLng); overload;
        procedure setPosition(latlng: TLatLngLiteral); overload;
        procedure setShape(shape: TMarkerShape);
        procedure setTitle(title: String);
        procedure setVisible(visible: Boolean);
        procedure setZIndex(zIndex: Double);

        class var MAX_ZINDEX: Double;
      end;

      TMaxZoomService = class external name 'MaxZoomService'
      public
        function getMaxZoomAtLatLng(latlng: TLatLng; callback: TProc<TMaxZoomResult>): TJSPromise; overload;
        function getMaxZoomAtLatLng(latlng: TLatLngLiteral; callback: TProc<TMaxZoomResult>): TJSPromise; overload;
      end;

      TOverlayView = class external name 'OverlayView' (TMVCObject)
      public
        procedure draw;
        function getMap: TMap;
        function getMapStreetViewPanorama: TStreetViewPanorama; external name 'getMap';
        function getPanes: TMapPanes;
        function getProjection: TMapCanvasProjection;
        procedure onAdd;
        procedure onRemove;
        procedure setMap(map: TMap); overload;
        procedure setMap(map: TStreetViewPanorama); overload;
        class procedure preventMapHitsAndGesturesFrom(this: JSValue; element: TJSHTMLElement);
        class procedure preventMapHitsFrom(this: JSValue; element: TJSHTMLElement);
      end;

      TPoint = class external name 'Point'
      public
        x: Double;
        y: Double;

        constructor new(x, y: Double);
        function equals(other: TPoint): Boolean;
        function toString: String;
      end;

      TPolygon = class external name 'Polygon' (TMVCObject)
      public
        constructor new(opts: TPolygonOptions);
        function getDraggable: Boolean;
        function getEditable: Boolean;
        function getMap: TMap;
        function getPath: TMVCArray<JSValue>;
        function getPaths: TMVCArray<JSValue>;
        function getVisible: Boolean;
        procedure setDraggable(draggable: Boolean);
        procedure setEditable(editable: Boolean);
        procedure setMap(map: TMap);
        procedure setOptions(options: TPolygonOptions);
        procedure setPath(path: TMVCArray<JSValue>); overload;
        procedure setPath(path: TArray<TLatLng>); overload;
        procedure setPath(path: TArray<TLatLngLiteral>); overload;
        procedure setPaths(paths: TMVCArray<JSValue>); overload;
        procedure setPaths(paths: TArray<JSValue>); overload;
        procedure setVisible(visible: Boolean);
      end;

      TPolyline = class external name 'Polyline' (TMVCObject)
      public
        constructor new(opts: TPolylineOptions);
        function getDraggable: Boolean;
        function getEditable: Boolean;
        function getMap: TMap;
        function getPath: TMVCArray<JSValue>;
        function getVisible: Boolean;
        procedure setDraggable(draggable: Boolean);
        procedure setEditable(editable: Boolean);
        procedure setMap(map: TMap);
        procedure setOptions(options: TPolylineOptions);
        procedure setPath(path: TMVCArray<JSValue>); overload;
        procedure setPath(path: TArray<TLatLng>); overload;
        procedure setPath(path: TArray<TLatLngLiteral>); overload;
        procedure setVisible(visible: Boolean);
      end;

      TRectangle = class external name 'Rectangle' (TMVCObject)
      public
        constructor new(opts: TRectangleOptions);
        function getBounds: TLatLngBounds;
        function getDraggable: Boolean;
        function getEditable: Boolean;
        function getMap: TMap;
        function getVisible: Boolean;
        procedure setBounds(bounds: TLatLngBounds); overload;
        procedure setBounds(bounds: TLatLngBoundsLiteral); overload;
        procedure setDraggable(draggable: Boolean);
        procedure setEditable(editable: Boolean);
        procedure setMap(map: TMap);
        procedure setOptions(options: TRectangleOptions);
        procedure setVisible(visible: Boolean);
      end;

      TSize = class external name 'Size'
      public
        height: Double;
        width: Double;

        constructor new(width, height: Double; widthUnit, heightUnit: String);
        function equals(other: TSize): Boolean;
        function toString: String;
      end;

      TStreetViewCoverageLayer = class external name 'StreetViewCoverageLayer' (TMVCObject)
      public
        function getMap: TMap;
        procedure setMap(map: TMap);
      end;

      TStreetViewStatus = class external name 'StreetViewStatus'
      public const
        OK = 'OK';
        UNKNOWN_ERROR = 'UNKNOWN_ERROR';
        ZERO_RESULTS = 'ZERO_RESULTS';
      end;

      TStreetViewPanorama = class external name 'StreetViewPanorama' (TMVCObject)
      public
        controls: TArray<TMVCArray<JSValue>>;

        constructor new(container: TJSHTMLElement; opts: TStreetViewPanoramaOptions);
        function getLinks: TArray<TStreetViewLink>;
        function getLocation: TStreetViewLocation;
        function getMotionTracking: Boolean;
        function getPano: String;
        function getPhotographerPov: TStreetViewPov;
        function getPosition: TLatLng;
        function getPov: TStreetViewPov;
        function getStatus: TStreetViewStatus;
        function getVisible: Boolean;
        function getZoom: Double;
        procedure registerPanoProvider(provider: TFunc<String, TStreetViewPanoramaData>; opt_options: TPanoProviderOptions);
        procedure setLinks(links: TArray<TStreetViewLink>);
        procedure setMotionTracking(motionTracking: Boolean);
        procedure setOptions(options: TStreetViewPanoramaOptions);
        procedure setPano(pano: String);
        procedure setPosition(latLng: TLatLng); overload;
        procedure setPosition(latLng: TLatLngLiteral); overload;
        procedure setPov(pov: TStreetViewPov);
        procedure setVisible(flag: Boolean);
        procedure setZoom(zoom: Double);
      end;

      TStreetViewService = class external name 'StreetViewService'
      public
        function getPanorama(request: TStreetViewLocationRequest; callback: TProc<TStreetViewPanoramaData, TStreetViewStatus>): TJSPromise; overload;
        function getPanorama(request: TStreetViewPanoRequest; callback: TProc<TStreetViewPanoramaData, TStreetViewStatus>): TJSPromise; overload;
      end;

      TStyledMapType = class external name 'StyledMapType' (TMVCObject)
      public
        alt: String;
        maxZoom: Double;
        minZoom: Double;
        name: String;
        projection: TProjection;
        radius: Double;
        tileSize: TSize;
        constructor new(styles: TArray<TMapTypeStyle>; options: TStyledMapTypeOptions);
        function getTile(tileCoord: TPoint; zoom: Double; ownerDocument: TJSDocument): TJSNode;
        procedure releaseTile(tile: TJSNode);
      end;

      TTrafficLayer = class external name 'TrafficLayer' (TMVCObject)
      public
        constructor new(opts: TTrafficLayerOptions);
        function getMap: TMap;
        procedure setMap(map: TMap);
        procedure setOptions(options: TTrafficLayerOptions);
      end;

      TTransitLayer = class external name 'TransitLayer' (TMVCObject)
      public
        function getMap: TMap;
        procedure setMap(map: TMap);
      end;

      TDrawingManager = class external name 'DrawingManager' (TMVCObject)
      public
        constructor new(options: TDrawingManagerOptions);
        function getDrawingMode: TOverlayType;
        function getMap: TMap;
        procedure setDrawingMode(drawingMode: TOverlayType);
        procedure setMap(map: TMap);
        procedure setOptions(options: TDrawingManagerOptions);
      end;

      TEvent = class external name 'event'
      public
        function addDomListener(instance: TJSObject; eventName: String; handler: TProc; capture: Boolean): TMapsEventListener;
        function addDomListenerOnce(instance: TJSObject; eventName: String; handler: TProc; capture: Boolean): TMapsEventListener;
        function addListener(instance: TJSObject; eventName: String; handler: TProc): TMapsEventListener;
        function addListenerOnce(instance: TJSObject; eventName: String; handler: TProc): TMapsEventListener;
        procedure clearInstanceListeners(instance: TJSObject);
        procedure clearListeners(instance: TJSObject; eventName: String);
        procedure removeListener(listener: TMapsEventListener);
        procedure trigger(instance: TJSObject; eventName: String); varargs;
      end;

      TGeometry = class external name 'geometry'
      public type
        TEncoding = class external name 'encoding'
        public
          function decodePath(encodedPath: String): TArray<TLatLng>;
          function encodePath(path: TArray<TLatLng>): String; overload;
          function encodePath(path: TMVCArray<JSValue>): String; overload;
        end;

        TPoly = class external name 'poly'
        public
          function containsLocation(point: TLatLng; polygon: TGoogle.TMaps.TPolygon): Boolean;
          function isLocationOnEdge(point: TLatLng; poly: TGoogle.TMaps.TPolygon; tolerance: Double): Boolean; overload;
          function isLocationOnEdge(point: TLatLng; poly: TGoogle.TMaps.TPolyline; tolerance: Double): Boolean; overload;
        end;

        TSpherical = class external name 'spherical'
        public
          function computeArea(path: TArray<TLatLng>; radius: Double): Double; overload;
          function computeArea(path: TMVCArray<JSValue>; radius: Double): Double; overload;
          function computeDistanceBetween(from: TLatLng; &to: TLatLng; radius: Double): Double;
          function computeHeading(from: TLatLng; &to: TLatLng): Double;
          function computeLength(path: TArray<TLatLng>; radius: Double): Double; overload;
          function computeLength(path: TMVCArray<JSValue>; radius: Double): Double; overload;
          function computeOffset(from: TLatLng; distance, heading, radius: Double): TLatLng;
          function computeOffsetOrigin(&to: TLatLng; distance, heading, radius: Double): TLatLng;
          function computeSignedArea(loop: TArray<TLatLng>; radius: Double): Double; overload;
          function computeSignedArea(loop: TMVCArray<JSValue>; radius: Double): Double; overload;
          function interpolate(from, &to: TLatLng; fraction: Double): TLatLng;
        end;
      end;

      TVisualization = class external name 'visualization'
      public type
        THeatmapLayer = class external name 'HeatmapLayer' (TMVCObject)
        public
          constructor new(opts: THeatmapLayerOptions);
          function getData: TMVCArray<JSValue>;
          function getMap: TMaps;
          procedure setData(data: TMVCArray<JSValue>); overload;
          procedure setData(data: TArray<TLatLng>); overload;
          procedure setData(data: TArray<TWeightedLocation>); overload;
          procedure setMap(map: TMap);
          procedure setOptions(options: THeatmapLayerOptions);
        end;
      end;

      TStreetViewPreference = class external name 'StreetViewPreference'
      public const
        BEST = 'BEST';
        NEAREST = 'NEAREST';
      end;

      TMaxZoomStatus = class external name 'MaxZoomStatus'
      public const
        ERROR = 'ERROR';
        OK = 'OK';
      end;

      TGeocoderLocationType = class external name 'GeocoderLocationType'
      public const
        APPROXIMATE = 'APPROXIMATE';
        GEOMETRIC_CENTER = 'GEOMETRIC_CENTER';
        RANGE_INTERPOLATED = 'RANGE_INTERPOLATED';
        ROOFTOP = 'ROOFTOP';
      end;

      TTrafficModel = class external name 'TrafficModel'
      public const
        BEST_GUESS = 'BEST_GUESS';
        OPTIMISTIC = 'OPTIMISTIC';
        PESSIMISTIC = 'PESSIMISTIC';
      end;

      TTransitMode = class external name 'TransitMode'
      public const
        BUS = 'BUS';
        RAIL = 'RAIL';
        SUBWAY = 'SUBWAY';
        TRAIN = 'TRAIN';
        TRAM = 'TRAM';
      end;

      TTransitRoutePreference = class external name 'TransitRoutePreference'
      public const
        FEWER_TRANSFERS = 'FEWER_TRANSFERS';
        LESS_WALKING = 'LESS_WALKING';
      end;

      TTravelMode = class external name 'TravelMode'
      public const
        BICYCLING = 'BICYCLING';
        DRIVING = 'DRIVING';
        TRANSIT = 'TRANSIT';
        WALKING = 'WALKING';
      end;

      TOverlayType = class external name 'OverlayType'
      public const
        CIRCLE = 'CIRCLE';
        MARKER = 'MARKER';
        POLYGON = 'POLYGON';
        POLYLINE = 'POLYLINE';
        RECTANGLE = 'RECTANGLE';
      end;

      TBusinessStatus = class external name 'BusinessStatus'
      public const
        CLOSED_PERMANENTLY = 'CLOSED_PERMANENTLY';
        CLOSED_TEMPORARILY = 'CLOSED_TEMPORARILY';
        OPERATIONAL = 'OPERATIONAL';
      end;

      TPlacesServiceStatus = class external name 'PlacesServiceStatus'
      public const
        INVALID_REQUEST = 'INVALID_REQUEST';
        NOT_FOUND = 'NOT_FOUND';
        OK = 'OK';
        OVER_QUERY_LIMIT = 'OVER_QUERY_LIMIT';
        REQUEST_DENIED = 'REQUEST_DENIED';
        UNKNOWN_ERROR = 'UNKNOWN_ERROR';
        ZERO_RESULTS = 'ZERO_RESULTS';
      end;

      TDistanceMatrixElementStatus = class
      public const
        NOT_FOUND = 'NOT_FOUND';
        OK = 'OK';
        ZERO_RESULTS = 'ZERO_RESULTS';
      end;

      TStreetViewSource = class
      public const
        DEFAULT = 'DEFAULT';
        OUTDOOR = 'OUTDOOR';
      end;

      TVehicleType = class
      public const
        BUS = 'BUS';
        CABLE_CAR = 'CABLE_CAR';
        COMMUTER_TRAIN = 'COMMUTER_TRAIN';
        COMMUTER_TRAINCOMMUTER_TRAINCOMMUTER_TRAINCOMMUTER_TRAINFERRY = 'COMMUTER_TRAINCOMMUTER_TRAINCOMMUTER_TRAINCOMMUTER_TRAINFERRY';
        FUNICULAR = 'FUNICULAR';
        GONDOLA_LIFT = 'GONDOLA_LIFT';
        HEAVY_RAIL = 'HEAVY_RAIL';
        HIGH_SPEED_TRAIN = 'HIGH_SPEED_TRAIN';
        INTERCITY_BUS = 'INTERCITY_BUS';
        METRO_RAIL = 'METRO_RAIL';
        MONORAIL = 'MONORAIL';
        OTHER = 'OTHER';
        RAIL = 'RAIL';
        SHARE_TAXI = 'SHARE_TAXI';
        SUBWAY = 'SUBWAY';
        TRAM = 'TRAM';
        TROLLEYBUS = 'TROLLEYBUS';
      end;
    public
      version: String;
    end;
  end;

  TCircleOptions = class
  public
    center: JSValue;
    clickable: Boolean;
    draggable: Boolean;
    editable: Boolean;
    fillColor: String;
    fillOpacity: Double;
    map: TGoogle.TMaps.TMap;
    radius: Double;
    strokeColor: String;
    strokeOpacity: Double;
    strokePosition: TGoogle.TMaps.TStrokePosition;
    strokeWeight: Double;
    visible: Boolean;
    zIndex: Double;
  end;

  TCircleLiteral = class(TCircleOptions)
  public
    center: JSValue;
    radius: Double;
  end;

  TAddFeatureEvent = class
  public
    feature: TGoogle.TMaps.TData.TFeature;
  end;

  TDataOptions = class
  public
    controlPosition: TGoogle.TMaps.TControlPosition;
    controls: TArray<String>;
    drawingMode: String;
    featureFactory: TFunc<TGoogle.TMaps.TData.TGeometry, TGoogle.TMaps.TData.TFeature>;
    map: TGoogle.TMaps.TMap;
    style: TStyleOptions;
    styleFunction: TFunc<TGoogle.TMaps.TData.TFeature, TStyleOptions>; external name 'style';
  end;

  TFeatureOptions = class
  public
    geometry: JSValue;
    id: Double;
    properties: TJSObject;
  end;

  TGeoJsonOptions = class
  public
    idPropertyName: String;
  end;

  TMapMouseEvent = class external name 'MapMouseEvent'
  public
    domEvent: TJSEvent;
    latLng: TGoogle.TMaps.TLatLng;
    procedure stop;
  end;

  TMouseEvent = class(TMapMouseEvent)
  public
    feature: TGoogle.TMaps.TData.TFeature;
  end;

  TRemoveFeatureEvent = class
  public
    feature: TGoogle.TMaps.TData.TFeature;
  end;

  TRemovePropertyEvent = class
  public
    feature: TGoogle.TMaps.TData.TFeature;
    name: String;
    oldValue: JSValue;
  end;

  TSetGeometryEvent = class
  public
    feature: TGoogle.TMaps.TData.TFeature;
    newGeometry: TGoogle.TMaps.TData.TGeometry;
    oldGeometry: TGoogle.TMaps.TData.TGeometry;
  end;

  TSetPropertyEvent = class
    feature: TGoogle.TMaps.TData.TFeature;
    name: String;
    newValue: JSValue;
    oldValue: JSValue;
  end;

  TStyleOptions = class
  public
    clickable: Boolean;
    cursor: String;
    draggable: Boolean;
    editable: Boolean;
    fillColor: String;
    fillOpacity: Double;
    icon: JSValue;
    shape: TMarkerShape;
    strokeColor: String;
    strokeOpacity: Double;
    strokeWeight: Double;
    title: String;
    visible: Boolean;
    zIndex: Double;
  end;

  TDirectionsGeocodedWaypoint = class
  public
    partial_match: Boolean;
    place_id: String;
    types: TArray<String>;
  end;

  TDirectionsLeg = class
  public
    arrival_time: TTimeGoogle;
    departure_time: TTimeGoogle;
    distance: TDistance;
    duration: TDuration;
    duration_in_traffic: TDuration;
    end_address: String;
    end_location: TGoogle.TMaps.TLatLng;
    start_address: String;
    start_location: TGoogle.TMaps.TLatLng;
    steps: TArray<TDirectionsStep>;
    via_waypoints: TArray<TGoogle.TMaps.TLatLng>;
  end;

  TDirectionsRendererOptions = class
  public
    directions: TDirectionsResult;
    draggable: Boolean;
    hideRouteList: Boolean;
    infoWindow: TGoogle.TMaps.TInfoWindow;
    map: TGoogle.TMaps.TMap;
    markerOptions: TMarkerOptions;
    panel: TJSNode;
    polylineOptions: google.maps.TPolylineOptions;
    preserveViewport: Boolean;
    routeIndex: Double;
    suppressBicyclingLayer: Boolean;
    suppressInfoWindows: Boolean;
    suppressMarkers: Boolean;
    suppressPolylines: Boolean;
  end;

  TDirectionsRequest = class
  public
    avoidFerries: Boolean;
    avoidHighways: Boolean;
    avoidTolls: Boolean;
    destination: JSValue;
    drivingOptions: TDrivingOptions;
    optimizeWaypoints: Boolean;
    origin: JSValue;
    provideRouteAlternatives: Boolean;
    region: String;
    transitOptions: TTransitOptions;
    travelMode: TGoogle.TMaps.TTravelMode;
    unitSystem: TGoogle.TMaps.TUnitSystem;
    waypoints: TArray<TDirectionsWaypoint>;
  end;

  TDirectionsResult = class
  public
    geocoded_waypoints: TArray<TDirectionsGeocodedWaypoint>;
    routes: TArray<TDirectionsRoute>;
  end;

  TDirectionsRoute = class
  public
    bounds: TGoogle.TMaps.TLatLngBounds;
    copyrights: String;
    fare: TArray<TTransitFare>;
    legs: TArray<TDirectionsLeg>;
    overview_path: TArray<TGoogle.TMaps.TLatLng>;
    overview_polyline: String;
    warnings: TArray<String>;
    waypoint_order: TArray<Double>;
  end;

  TDirectionsStep = class
    distance: TDistance;
    duration: TDuration;
    end_location: TGoogle.TMaps.TLatLng;
    instructions: String;
    path: TArray<TGoogle.TMaps.TLatLng>;
    start_location: TGoogle.TMaps.TLatLng;
    steps: TArray<TDirectionsStep>;
    transit: TTransitDetails;
    travel_mode: TGoogle.TMaps.TTravelMode;
  end;

  TDirectionsWaypoint = class
    location: JSValue;
    stopover: Boolean;
  end;

  TDistance = class
  public
    text: String;
    value: Double;
  end;

  TDistanceMatrixRequest = class
  public
    avoidFerries: Boolean;
    avoidHighways: Boolean;
    avoidTolls: Boolean;
    destinations: TArray<JSValue>;
    drivingOptions: TDrivingOptions;
    origins: TArray<JSValue>;
    region: String;
    transitOptions: TTransitOptions;
    travelMode: TGoogle.TMaps.TTravelMode;
    unitSystem: TGoogle.TMaps.TUnitSystem;
  end;

  TDistanceMatrixResponse = class
  public
    destinationAddresses: TArray<String>;
    originAddresses: TArray<String>;
    rows: TArray<TDistanceMatrixResponseRow>;
  end;

  TDistanceMatrixResponseElement = class
  public
    distance: TDistance;
    duration: TDuration;
    duration_in_traffic: TDuration;
    fare: TTransitFare;
    status: TGoogle.TMaps.TDistanceMatrixElementStatus;
  end;

  TDistanceMatrixResponseRow = class
  public
    elements: TArray<TDistanceMatrixResponseElement>;
  end;

  TDrivingOptions = class
  public
    departureTime: String;
    trafficModel: TGoogle.TMaps.TTrafficModel;
  end;

  TDuration = class
  public
    text: String;
    value: Double;
  end;

  TElevationResult = class
  public
    elevation: Double;
    location: TGoogle.TMaps.TLatLng;
    resolution: Double;
  end;

  TFullscreenControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TGeocoderAddressComponent = class
  public
    long_name: String;
    short_name: String;
    types: TArray<String>;
  end;

  TGeocoderComponentRestrictions = class
  public
    administrativeArea: String;
    country: String;
    locality: String;
    postalCode: String;
    route: String;
  end;

  TGeocoderGeometry = class
  public
    bounds: TGoogle.TMaps.TLatLngBounds;
    location: TGoogle.TMaps.TLatLng;
    location_type: TGoogle.TMaps.TGeocoderLocationType;
    viewport: TGoogle.TMaps.TLatLngBounds;
  end;

  TGeocoderRequest = class
  public
    address: String;
    bounds: JSValue;
    componentRestrictions: TGeocoderComponentRestrictions;
    location: JSValue;
    placeId: String;
    region: String;
  end;

  TGeocoderResponse = class
  public
    results: TArray<TGeocoderResult>;
  end;

  TGeocoderResult = class
  public
    address_components: TArray<TGeocoderAddressComponent>;
    formatted_address: String;
    geometry: TGeocoderGeometry;
    partial_match: Boolean;
    place_id: String;
    postcode_localities: TArray<String>;
    types: TArray<String>;
  end;

  TGroundOverlayOptions = class
  public
    clickable: Boolean;
    map: TGoogle.TMaps.TMap;
    opacity: Double;
  end;

  TIcon = class
  public
    anchor: TGoogle.TMaps.TPoint;
    labelOrigin: TGoogle.TMaps.TPoint;
    origin: TGoogle.TMaps.TPoint;
    scaledSize: TGoogle.TMaps.TSize;
    size: TGoogle.TMaps.TSize;
    url: String;
  end;

  TIconMouseEvent = class(TMapMouseEvent)
  public
    placeId: String;
  end;

  TIconSequence = class
  public
    fixedRotation: Boolean;
    icon: TSymbol;
    offset: String;
    &repeat: String;
  end;

  TImageMapTypeOptions = class
  public
    alt: String;
    getTileUrl: TFunc<TGoogle.TMaps.TPoint, Double, String>;
    maxZoom: Double;
    minZoom: Double;
    name: String;
    opacity: Double;
    tileSize: TGoogle.TMaps.TSize;
  end;

  TInfoWindowOptions = class
  public
    content: JSValue;
    disableAutoPan: Boolean;
    maxWidth: Double;
    minWidth: Double;
    pixelOffset: TGoogle.TMaps.TSize;
    position: JSValue;
    zIndex: Double;
  end;

  TKmlAuthor = class
  public
    email: String;
    name: String;
    uri: String;
  end;

  TKmlFeatureData = class
  public
    author: TKmlAuthor;
    description: String;
    id: String;
    infoWindowHtml: String;
    name: String;
    snippet: String;
  end;

  TKmlLayerMetadata = class
  public
    author: TKmlAuthor;
    description: String;
    hasScreenOverlays: Boolean;
    name: String;
    snippet: String;
  end;

  TKmlLayerOptions = class
  public
    clickable: Boolean;
    map: TGoogle.TMaps.TMap;
    preserveViewport: Boolean;
    screenOverlays: Boolean;
    suppressInfoWindows: Boolean;
    url: String;
    zIndex: Double;
  end;

  TKmlMouseEvent = class
  public
    featureData: TKmlFeatureData;
    latLng: TGoogle.TMaps.TLatLng;
    pixelOffset: TGoogle.TMaps.TSize;
  end;

  TLatLngBoundsLiteral = class
  public
    east: Double;
    north: Double;
    south: Double;
    west: Double;
  end;

  TLatLngLiteral = class
  public
    lat: Double;
    lng: Double;

    constructor Create(Lat, Lng: Double);
  end;

  TLocationElevationRequest = class
  public
    locations: TArray<JSValue>;
  end;

  TLocationElevationResponse = class
  public
    results: TArray<TElevationResult>;
  end;

  TMapCanvasProjection = class external name 'MapCanvasProjection' abstract
  public
    function fromContainerPixelToLatLng(pixel: TGoogle.TMaps.TPoint; nowrap: Boolean): TGoogle.TMaps.TLatLng;
    function fromDivPixelToLatLng(pixel: TGoogle.TMaps.TPoint; nowrap: Boolean): TGoogle.TMaps.TLatLng;
    function fromLatLngToContainerPixel(latLng: TGoogle.TMaps.TLatLng): TGoogle.TMaps.TPoint;
    function fromLatLngToDivPixel(latLng: TGoogle.TMaps.TLatLng): TGoogle.TMaps.TPoint;
    function getWorldWidth: Double;
  end;

  TMapOptions = class
  private
    FFullscreenControlOptions: TFullscreenControlOptions; external name 'fullscreenControlOptions';
    Frestriction: TMapRestriction; external name 'restriction';
    FzoomControlOptions: TZoomControlOptions; external name 'zoomControlOptions';
    FscaleControlOptions: TScaleControlOptions; external name 'scaleControlOptions';
    FmapTypeControlOptions: TMapTypeControlOptions; external name 'mapTypeControlOptions';
    FpanControlOptions: TPanControlOptions; external name 'panControlOptions';
    FstreetViewControlOptions: TStreetViewControlOptions; external name 'streetViewControlOptions';
    FrotateControlOptions: TRotateControlOptions; external name 'rotateControlOptions';

    function GetRestriction: TMapRestriction;
    function GetRotateControlOptions: TRotateControlOptions;
    function GetScaleControlOptions: TScaleControlOptions;
    function GetStreetViewControlOptions: TStreetViewControlOptions;
    function GetZoomControlOptions: TZoomControlOptions;
    function GetfullscreenControlOptions: TFullscreenControlOptions;
    function GetmapTypeControlOptions: TMapTypeControlOptions;
    function GetpanControlOptions: TPanControlOptions;
  public
    backgroundColor: String;
    center: JSValue;
    clickableIcons: Boolean;
    controlSize: Double;
    disableDefaultUI: Boolean;
    disableDoubleClickZoom: Boolean;
    draggableCursor: String;
    draggingCursor: String;
    fullscreenControl: Boolean;
    gestureHandling: String;
    heading: Double;
    keyboardShortcuts: Boolean;
    mapTypeControl: Boolean;
    mapTypeId: String;
    maxZoom: Double;
    minZoom: Double;
    noClear: Boolean;
    panControl: Boolean;
    rotateControl: Boolean;
    scaleControl: Boolean;
    scrollwheel: Boolean;
    streetView: TGoogle.TMaps.TStreetViewPanorama;
    streetViewControl: Boolean;
    styles: TArray<TMapTypeStyle>;
    tilt: Double;
    zoom: Double;
    zoomControl: Boolean;

    property fullscreenControlOptions: TFullscreenControlOptions read GetfullscreenControlOptions write FfullscreenControlOptions;
    property mapTypeControlOptions: TMapTypeControlOptions read GetmapTypeControlOptions write FmapTypeControlOptions;
    property panControlOptions: TPanControlOptions read GetpanControlOptions write FpanControlOptions;
    property rotateControlOptions: TRotateControlOptions read GetrotateControlOptions write FrotateControlOptions;
    property streetViewControlOptions: TStreetViewControlOptions read GetstreetViewControlOptions write FstreetViewControlOptions;
    property restriction: TMapRestriction read Getrestriction write Frestriction;
    property scaleControlOptions: TScaleControlOptions read GetscaleControlOptions write FscaleControlOptions;
    property zoomControlOptions: TZoomControlOptions read GetzoomControlOptions write FzoomControlOptions;
  end;

  TMapPanes = class
  public
    floatPane: TJSHTMLElement;
    mapPane: TJSHTMLElement;
    markerLayer: TJSHTMLElement;
    overlayLayer: TJSHTMLElement;
    overlayMouseTarget: TJSHTMLElement;
  end;

  TMapRestriction = class
  public
    latLngBounds: JSValue;
    strictBounds: Boolean;
  end;

  TMapType = class external name 'MapType' abstract
  public
    alt: String;
    maxZoom: Double;
    minZoom: Double;
    name: String;
    projection: TProjection;
    radius: Double;
    tileSize: TGoogle.TMaps.TSize;
    procedure releaseTile(tile: TJSNode);
    function getTile(tileCoord: TGoogle.TMaps.TPoint; zoom: Double; ownerDocument: TJSDocument): TJSNode;
  end;

  TMapTypeControlOptions = class
  public
    mapTypeIds: TArray<String>;
    position: TGoogle.TMaps.TControlPosition;
    style: TGoogle.TMaps.TMapTypeControlStyle;
  end;

  TMapTypeStyle = class
  public
    elementType: String;
    featureType: String;
    stylers: TArray<TJSObject>;
  end;

  TMapsEventListener = class external name 'MapsEventListener' abstract
  public
    procedure remove;
  end;

  TPadding = class
  public
    bottom: Double;
    left: Double;
    right: Double;
    top: Double;
  end;

  TPanControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TPanoProviderOptions = class
  public
    cors: Boolean;
  end;

  TPathElevationRequest = class
  public
    path: TArray<JSValue>;
    samples: Double;
  end;

  TPathElevationResponse = class
  public
    results: TArray<TElevationResult>;
  end;

  TPlace = class
  public
    location: JSValue;
    placeId: String;
    query: String;
  end;

  TPolyMouseEvent = class(TMapMouseEvent)
  public
    edge: Double;
    path: Double;
    vertex: Double;
  end;

  TMarkerLabel = class
  public
    className: String;
    color: String;
    fontFamily: String;
    fontSize: String;
    fontWeight: String;
    text: String;
  end;

  TMarkerOptions = class
  public
    anchorPoint: TGoogle.TMaps.TPoint;
    animation: TGoogle.TMaps.TAnimation;
    clickable: Boolean;
    crossOnDrag: Boolean;
    cursor: String;
    draggable: Boolean;
    icon: JSValue;
    &label: JSValue;
    map: TGoogle.TMaps.TMap;
    mapStreetViewPanorama: TGoogle.TMaps.TStreetViewPanorama; external name 'map';
    opacity: Double;
    optimized: Boolean;
    position: JSValue;
    shape: TMarkerShape;
    title: String;
    visible: Boolean;
    zIndex: Double;
  end;

  TMarkerShape = class
  public
    coords: TArray<Double>;
    &type: String;
  end;

  TMaxZoomResult = class
  public
    status: TGoogle.TMaps.TMaxZoomStatus;
    zoom: Double;
  end;

  TPolygonOptions = class
  public
    clickable: Boolean;
    draggable: Boolean;
    editable: Boolean;
    fillColor: String;
    fillOpacity: Double;
    geodesic: Boolean;
    map: TGoogle.TMaps.TMap;
    paths: JSValue;
    strokeColor: String;
    strokeOpacity: Double;
    strokePosition: TGoogle.TMaps.TStrokePosition;
    strokeWeight: Double;
    visible: Boolean;
    zIndex: Double;
  end;

  TPolylineOptions = class
  public
    clickable: Boolean;
    draggable: Boolean;
    editable: Boolean;
    geodesic: Boolean;
    icons: TArray<TIconSequence>;
    map: TGoogle.TMaps.TMap;
    path: TArray<JSValue>;
    strokeColor: String;
    strokeOpacity: Double;
    strokeWeight: Double;
    visible: Boolean;
    zIndex: Double;
  end;

  TProjection = class external name 'Projection' abstract
  public
    function fromLatLngToPoint(latLng: TGoogle.TMaps.TLatLng; point: TGoogle.TMaps.TPoint): TGoogle.TMaps.TPoint;
    function fromPointToLatLng(pixel: TGoogle.TMaps.TPoint; noWrap: Boolean): TGoogle.TMaps.TLatLng;
  end;

  TRectangleOptions = class
  public
    bounds: JSValue;
    clickable: Boolean;
    draggable: Boolean;
    editable: Boolean;
    fillColor: String;
    fillOpacity: Double;
    map: TGoogle.TMaps.TMap;
    strokeColor: String;
    strokeOpacity: Double;
    strokePosition: TGoogle.TMaps.TStrokePosition;
    strokeWeight: Double;
    visible: Boolean;
    zIndex: Double;
  end;

  TRotateControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TScaleControlOptions = class
  public type
    TScaleControlStyle = (scDEFAULT);
  public
    style: TScaleControlStyle;
  end;

  TMotionTrackingControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TStreetViewAddressControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TStreetViewControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TStreetViewLink = class
  public
    description: String;
    heading: Double;
    pano: String;
  end;

  TStreetViewLocation = class
  public
    description: String;
    latLng: TGoogle.TMaps.TLatLng;
    pano: String;
    shortDescription: String;
  end;

  TStreetViewLocationRequest = class
  public
    location: JSValue;
    preference: TGoogle.TMaps.TStreetViewPreference;
    radius: Double;
    source: TGoogle.TMaps.TStreetViewSource;
  end;

  TStreetViewPanoRequest = class
  public
    pano: String;
  end;

  TStreetViewPanoramaData = class
  public
    copyright: String;
    imageDate: String;
    links: TArray<TStreetViewLink>;
    location: TStreetViewLocation;
    tiles: TStreetViewTileData;
  end;

  TStreetViewPanoramaOptions = class
  public
    addressControl: Boolean;
    addressControlOptions: TStreetViewAddressControlOptions;
    clickToGo: Boolean;
    controlSize: Double;
    disableDefaultUI: Boolean;
    disableDoubleClickZoom: Boolean;
    enableCloseButton: Boolean;
    fullscreenControl: Boolean;
    fullscreenControlOptions: TFullscreenControlOptions;
    imageDateControl: Boolean;
    linksControl: Boolean;
    motionTracking: Boolean;
    motionTrackingControl: Boolean;
    motionTrackingControlOptions: TMotionTrackingControlOptions;
    panControl: Boolean;
    panControlOptions: TPanControlOptions;
    pano: String;
    position: JSValue;
    pov: TStreetViewPov;
    scrollwheel: Boolean;
    showRoadLabels: Boolean;
    visible: Boolean;
    zoom: Double;
    zoomControl: Boolean;
    zoomControlOptions: TZoomControlOptions;
  end;

  TStreetViewPov = class
  public
    heading: Double;
    pitch: Double;
  end;

  TStreetViewResponse = class
  public
    data: TStreetViewPanoramaData;
  end;

  TStreetViewTileData = class
  public
    centerHeading: Double;
    tileSize: TGoogle.TMaps.TSize;
    worldSize: TGoogle.TMaps.TSize;

    function getTileUrl(pano: String; tileZoom: Double; tileX: Double; tileY: Double): String; virtual; abstract;
  end;

  TStyledMapTypeOptions = class
  public
    alt: String;
    maxZoom: Double;
    minZoom: Double;
    name: String;
  end;

  TSymbol = class
  public
    anchor: TGoogle.TMaps.TPoint;
    fillColor: String;
    fillOpacity: Double;
    labelOrigin: TGoogle.TMaps.TPoint;
    path: JSValue;
    rotation: Double;
    scale: Double;
    strokeColor: String;
    strokeOpacity: Double;
    strokeWeight: Double;
  end;

  TTimeGoogle = class
  public
    text: String;
    time_zone: String;
    value: String;
  end;

  TTrafficLayerOptions = class
  public
    autoRefresh: Boolean;
    map: TGoogle.TMaps.TMap;
  end;

  TTransitAgency = class
  public
    name: String;
    phone: String;
    url: String;
  end;

  TTransitDetails = class
  public
    arrival_stop: TTransitStop;
    arrival_time: TTimeGoogle;
    departure_stop: TTransitStop;
    departure_time: TTimeGoogle;
    headsign: String;
    headway: Double;
    line: TTransitLine;
    num_stops: Double;
    trip_short_name: String;
  end;

  TTransitFare = class
  public
    currency: String;
    value: Double;
  end;

  TTransitLine = class
  public
    agencies: TArray<TTransitAgency>;
    color: String;
    icon: String;
    name: String;
    short_name: String;
    text_color: String;
    url: String;
    vehicle: TTransitVehicle;
  end;

  TTransitOptions = class
  public
    arrivalTime: String;
    departureTime: String;
    modes: TArray<TGoogle.TMaps.TTransitMode>;
    routingPreference: TArray<TGoogle.TMaps.TTransitRoutePreference>;
  end;

  TTransitStop = class
  public
    location: TGoogle.TMaps.TLatLng;
    name: String;
  end;

  TTransitVehicle = class
  public
    icon: String;
    local_icon: String;
    name: String;
    &type: TGoogle.TMaps.TVehicleType;
  end;

  TZoomControlOptions = class
  public
    position: TGoogle.TMaps.TControlPosition;
  end;

  TDrawingControlOptions = class
  public
    drawingModes: TArray<TGoogle.TMaps.TOverlayType>;
    position: TGoogle.TMaps.TControlPosition;
  end;

  TDrawingManagerOptions = class
  public
    circleOptions: TCircleOptions;
    drawingControl: Boolean;
    drawingControlOptions: TDrawingControlOptions;
    drawingMode: TGoogle.TMaps.TOverlayType;
    map: TGoogle.TMaps.TMap;
    markerOptions: TMarkerOptions;
    polygonOptions: TPolygonOptions;
    polylineOptions: TPolylineOptions;
    rectangleOptions: TRectangleOptions;
  end;

  TOverlayCompleteEvent = class
  public
    overlay: JSValue;
    &type: TGoogle.TMaps.TOverlayType;
  end;

  TPinOptions = class
  public
    background: String;
    glyphColor: String;
    scale: Double;
  end;

  TAutocompleteOptions = class
  public
    bounds: JSValue;
    componentRestrictions: TComponentRestrictions;
    fields: TArray<String>;
    strictBounds: Boolean;
    types: TArray<String>;
  end;

  TAutocompletePrediction = class
  public
    description: String;
    distance_meters: Double;
    matched_substrings: TArray<TPredictionSubstring>;
    place_id: String;
    structured_formatting: TStructuredFormatting;
    terms: TArray<TPredictionTerm>;
    types: TArray<String>;
  end;

  TAutocompleteResponse = class
  public
    predictions: TArray<TAutocompletePrediction>;
  end;

  TAutocompleteSessionToken = class
  end;

  TAutocompletionRequest = class
  public
    bounds: JSValue;
    componentRestrictions: TComponentRestrictions;
    input: String;
    location: TGoogle.TMaps.TLatLng;
    offset: Double;
    origin: JSValue;
    radius: Double;
    sessionToken: TAutocompleteSessionToken;
    types: TArray<String>;
  end;

  TComponentRestrictions = class
  public
    country: TArray<String>;
  end;

  TFindPlaceFromPhoneNumberRequest = class
  public
    fields: TArray<String>;
    locationBias: JSValue;
    phoneNumber: String;
  end;

  TFindPlaceFromQueryRequest = class
  public
    fields: TArray<String>;
    locationBias: JSValue;
    query: String;
  end;

  TPredictionSubstring = class
  public
    length: Double;
    offset: Double;
  end;

  TPredictionTerm = class
  public
    offset: Double;
    value: String;
  end;

  TQueryAutocompletionRequest = class
  public
    bounds: JSValue;
    input: String;
    location: TGoogle.TMaps.TLatLng;
    offset: Double;
    radius: Double;
  end;

  TSearchBoxOptions = class
  public
    bounds: JSValue;
  end;

  TStructuredFormatting = class
  public
    main_text: String;
    main_text_matched_substrings: TArray<TPredictionSubstring>;
    secondary_text: String;
  end;

  TTextSearchRequest = class
  public
    bounds: JSValue;
    location: JSValue;
    query: String;
    radius: Double;
    &type: String;
  end;

  THeatmapLayerOptions = class
  public
    data: JSValue;
    dissipating: Boolean;
    gradient: TArray<String>;
    map: TGoogle.TMaps.TMap;
    maxIntensity: Double;
    opacity: Double;
    radius: Double;
  end;

  TWeightedLocation = class
  public
    location: TGoogle.TMaps.TLatLng;
    weight: Double;
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
      Script.OnLoad :=
        function(Event: TEventListenerEvent): Boolean
        begin
          Window.RequestIdleCallback(
            procedure (idleDeadline: TJSIdleDeadline)
            begin
              Resolve(True);
            end);

          Result := True;
        end;
      Script.src := Format('https://maps.googleapis.com/maps/api/js?key=%s', [Key]);
      Script.type_ := 'text/javascript';

      document.head.appendChild(Script);
    end);
end;

{ TLatLngLiteral }

constructor TLatLngLiteral.Create(Lat, Lng: Double);
begin
  Self.Lat := Lat;
  Self.Lng := Lng;
end;

{ TMapOptions }

function TMapOptions.GetfullscreenControlOptions: TFullscreenControlOptions;
begin
  if not Assigned(FfullscreenControlOptions) then
    FfullscreenControlOptions := TFullscreenControlOptions.Create;

  Result := FfullscreenControlOptions;
end;

function TMapOptions.GetmapTypeControlOptions: TMapTypeControlOptions;
begin
  if not Assigned(FmapTypeControlOptions) then
    FmapTypeControlOptions := TMapTypeControlOptions.Create;

  Result := FmapTypeControlOptions;
end;

function TMapOptions.GetpanControlOptions: TPanControlOptions;
begin
  if not Assigned(FpanControlOptions) then
    FpanControlOptions := TPanControlOptions.Create;

  Result := FpanControlOptions;
end;

function TMapOptions.GetRestriction: TMapRestriction;
begin
  if not Assigned(FRestriction) then
    FRestriction := TMapRestriction.Create;

  Result := FRestriction;
end;

function TMapOptions.GetRotateControlOptions: TRotateControlOptions;
begin
  if not Assigned(FRotateControlOptions) then
    FRotateControlOptions := TRotateControlOptions.Create;

  Result := FRotateControlOptions;
end;

function TMapOptions.GetScaleControlOptions: TScaleControlOptions;
begin
  if not Assigned(FScaleControlOptions) then
    FScaleControlOptions := TScaleControlOptions.Create;

  Result := FScaleControlOptions;
end;

function TMapOptions.GetZoomControlOptions: TZoomControlOptions;
begin
  if not Assigned(FZoomControlOptions) then
    FZoomControlOptions := TZoomControlOptions.Create;

  Result := FZoomControlOptions;
end;

function TMapOptions.GetStreetViewControlOptions: TStreetViewControlOptions;
begin
  if not Assigned(FStreetViewControlOptions) then
    FStreetViewControlOptions := TStreetViewControlOptions.Create;

  Result := FStreetViewControlOptions;
end;

end.

