unit Leaflet.Maps;

interface

{$modeswitch externalclass}

uses JS, Web, SysUtils, GeoJSON;

type
  TAttributionOptions = class;
  TCircleMarkerOptions = class;
  TControlOptions = class;
  TDefaultMapPanes = class;
  TDivIconOptions = class;
  TDivOverlayOptions = class;
  TDragEndEvent = class;
  TError = class;
  TErrorEvent = class;
  TFitBoundsOptions = class;
  TGeoJSONEvent = class;
  TGeoJSONOptions = class;
  TGridLayerOptions = class;
  TIconOptions = class;
  TImageOverlayOptions = class;
  TInteractiveLayerOptions = class;
  TInvalidateSizeOptions = class;
  TLatLngLiteral = class;
  TLayerEvent = class;
  TLayerOptions = class;
  TLayersControlEvent = class;
  TLayersObject = class;
  TLayersOptions = class;
  TLeafletEvent = class;
  TLeafletKeyboardEvent = class;
  TLeafletMouseEvent = class;
  TLocateOptions = class;
  TLocationEvent = class;
  TMapOptions = class;
  TMarkerOptions = class;
  TPanInsideOptions = class;
  TPanOptions = class;
  TPathOptions = class;
  TPolylineOptions = class;
  TPopupEvent = class;
  TPopupOptions = class;
  TRendererOptions = class;
  TResizeEvent = class;
  TScaleOptions = class;
  TTileErrorEvent = class;
  TTileEvent = class;
  TTileLayerOptions = class;
  TTooltipEvent = class;
  TTooltipOptions = class;
  TVideoOverlayOptions = class;
  TWMSOptions = class;
  TWMSParams = class;
  TZoomAnimEvent = class;
  TZoomControlOptions = class;
  TZoomOptions = class;
  TZoomPanOptions = class;

  TLatLngTuple = array[0..1] of Double;
//  TPointTuple = array[0..1] of Double;
  TPointTuple = String;

  TBoundsLiteral = array[0..1] of TPointTuple;

  TLeaflet = class external name 'L'
  public type
    TBounds = class;
    TLatLng = class;
    TLatLngBounds = class;
    TLayerGroup = class;
    TMap = class;
    TPoint = class;
    TPopup = class;
    TTooltip = class;

    TLatLngBoundsLiteral = TArray<TLatLngTuple>;

    TClass = class external name 'Class'
    public
      class function addInitHook(initHookFn: TProc): TClass; overload;
      class function addInitHook(methodName: String): TClass; varargs; overload;
      class function extend(props: JSValue): TClass;
      class function include(props: JSValue): TClass;
      class function mergeOptions(props: JSValue): TClass;
    end;

    TTransformation = class external name 'Transformation'
    public
      constructor new(a, b, c, d: Double);

      function transform(point: TPoint): TPoint; overload;
      function transform(point: TPoint; scale: Double): TPoint; overload;
      function untransform(point: TPoint): TPoint; overload;
      function untransform(point: TPoint; scale: Double): TPoint; overload;
    end;

    TLineUtil = class external name 'LineUtil'
    public
      function simplify(points: TArray<TPoint>; tolerance: Double): TArray<TPoint>;
      function pointToSegmentDistance(p, p1,p2: TPoint): Double;
      function closestPointOnSegment(p, p1, p2: TPoint): TPoint;
      function isFlat(latlngs: TArray<TLatLng>): Boolean; overload;
      function isFlat(latlngs: TArray<TLatLngLiteral>): Boolean; overload;
      function isFlat(latlngs: TArray<TLatLngTuple>): Boolean; overload;
      function clipSegment(a, b: TPoint; bounds: TBounds): TArray<TPoint>; overload;
      function clipSegment(a, b: TPoint; bounds: TBounds; useLastCode: Boolean): TArray<TPoint>; overload;
      function clipSegment(a, b: TPoint; bounds: TBounds; useLastCode, round: Boolean): TArray<TPoint>; overload;
    end;

    TPolyUtil = class external name 'PolyUtil'
    public
      function clipPolygon(points: TArray<TPoint>; bounds: TBounds): TArray<TPoint>; overload;
      function clipPolygon(points: TArray<TPoint>; bounds: TBoundsLiteral): TArray<TPoint>; overload;
      function clipPolygon(points: TArray<TPoint>; bounds: TBounds; round: Boolean): TArray<TPoint>; overload;
      function clipPolygon(points: TArray<TPoint>; bounds: TBoundsLiteral; round: Boolean): TArray<TPoint>; overload;
    end;

    TDomUtil = class external name 'DomUtil'
    public
      TRANSFORM: String;
      TRANSITION: String;
      TRANSITION_END: String;

      function get(element: String): TJSHTMLElement; overload;
      function get(element: TJSHTMLElement): TJSHTMLElement; overload;
      function getStyle(el: TJSHTMLElement; styleAttrib: String): String;
      function create(tagName: String): TJSHTMLElement; overload;
      function create(tagName: String; className: String): TJSHTMLElement; overload;
      function create(tagName: String; className: String; container: TJSHTMLElement): TJSHTMLElement; overload;
      procedure remove(el: TJSHTMLElement);
      procedure empty(el: TJSHTMLElement);
      procedure toFront(el: TJSHTMLElement);
      procedure toBack(el: TJSHTMLElement);
      function hasClass(el: TJSHTMLElement; name: String): Boolean;
      procedure addClass(el: TJSHTMLElement; name: String);
      procedure removeClass(el: TJSHTMLElement; name: String);
      procedure setClass(el: TJSHTMLElement; name: String);
      function getClass(el: TJSHTMLElement): String;
      procedure setOpacity(el: TJSHTMLElement; opacity: Double);
      function testProp(props: TArray<String>): String;
      procedure setTransform(el: TJSHTMLElement; offset: TPoint; scale: Double);
      procedure setPosition(el: TJSHTMLElement; position: TPoint);
      function getPosition(el: TJSHTMLElement): TPoint;
      procedure disableTextSelection();
      procedure enableTextSelection();
      procedure disableImageDrag();
      procedure enableImageDrag();
      procedure preventOutline(el: TJSHTMLElement);
      procedure restoreOutline();
    end;

    TCRS = class external name 'CRS'
    public class var
      EPSG3395: TCRS;
      EPSG3857: TCRS;
      EPSG4326: TCRS;
      EPSG900913: TCRS;
      Earth: TCRS;
      Simple: TCRS;
    public
      code: String;
      wrapLng: TArray<Double>;
      wrapLat: TArray<Double>;
      infinite: Boolean;

      function latLngToPoint(latlng: TLatLng; zoom: Double): TPoint; overload;
      function latLngToPoint(latlng: TLatLngLiteral; zoom: Double): TPoint; overload;
      function latLngToPoint(latlng: TLatLngTuple; zoom: Double): TPoint; overload;
      function pointToLatLng(point: TPoint; zoom: Double): TLatLng; overload;
      function pointToLatLng(point: TPointTuple; zoom: Double): TLatLng; overload;
      function project(latlng: TLatLng): TPoint; overload;
      function project(latlng: TLatLngLiteral): TPoint; overload;
      function unproject(point: TPoint): TLatLng; overload;
      function unproject(point: TPointTuple): TLatLng; overload;
      function scale(zoom: Double): Double;
      function zoom(scale: Double): Double;
      function getProjectedBounds(zoom: Double): TBounds;
      function distance(latlng1, latlng2: TLatLng): Double; overload;
      function distance(latlng1, latlng2: TLatLngLiteral): Double; overload;
      function distance(latlng1, latlng2: TLatLngTuple): Double; overload;
      function wrapLatLng(latlng: TLatLng): TLatLng; overload;
      function wrapLatLng(latlng: TLatLngLiteral): TLatLng; overload;
    end;

    TProjection = class external name 'Projection'
    public
      bounds: TBounds;

      const LonLat: TProjection;
      const Mercator: TProjection;
      const SphericalMercator: TProjection;

      function project(latlng: TLatLng): TPoint; overload;
      function project(latlng: TLatLngLiteral): TPoint; overload;
      function unproject(point: TPoint): TLatLng; overload;
      function unproject(point: TPointTuple): TLatLng; overload;
    end;

    TLatLng = class external name 'LatLng'
    public
      lat: Double;
      lng: Double;
      alt: Double;

      constructor new(latitude, longitude: Double); overload;
      constructor new(latitude, longitude, altitude: Double); overload;

      function clone(): TLatLng;
      function distanceTo(otherLatLng: TLatLng): Double; overload;
      function distanceTo(otherLatLng: TLatLngLiteral): Double; overload;
      function distanceTo(otherLatLng: TLatLngTuple): Double; overload;
      function equals(otherLatLng: TLatLng): Boolean; overload;
      function equals(otherLatLng: TLatLng; maxMargin: Double): Boolean; overload;
      function equals(otherLatLng: TLatLngLiteral): Boolean; overload;
      function equals(otherLatLng: TLatLngLiteral; maxMargin: Double): Boolean; overload;
      function equals(otherLatLng: TLatLngTuple): Boolean; overload;
      function equals(otherLatLng: TLatLngTuple; maxMargin: Double): Boolean; overload;
      function toBounds(sizeInMeters: Double): TLatLngBounds;
      function toString(): String;
      function wrap(): TLatLng;
    end;

    TLatLngBounds = class external name 'LatLngBounds'
    public
      constructor new(southWest, northEast: TLatLng); overload;
      constructor new(southWest, northEast: TLatLngLiteral); overload;
      constructor new(southWest, northEast: TLatLngTuple); overload;
      constructor new(latlngs: TLatLngBoundsLiteral); overload;

      function extend(latlngOrBounds: TLatLng): TLatLngBounds; overload;
      function extend(latlngOrBounds: TLatLngLiteral): TLatLngBounds; overload;
      function extend(latlngOrBounds: TLatLngTuple): TLatLngBounds; overload;
      function extend(latlngOrBounds: TLatLngBounds): TLatLngBounds; overload;
      function extend(latlngOrBounds: TLatLngBoundsLiteral): TLatLngBounds; overload;
      function pad(bufferRatio: Double): TLatLngBounds; // does this modify the current instance or does it return a new one?
      function getCenter(): TLatLng;
      function getSouthWest(): TLatLng;
      function getNorthEast(): TLatLng;
      function getNorthWest(): TLatLng;
      function getSouthEast(): TLatLng;
      function getWest(): Double;
      function getSouth(): Double;
      function getEast(): Double;
      function getNorth(): Double;
      function contains(otherBoundsOrLatLng: TLatLngBounds): Boolean; overload;
      function contains(otherBoundsOrLatLng: TLatLngBoundsLiteral): Boolean; overload;
      function contains(otherBoundsOrLatLng: TLatLng): Boolean; overload;
      function contains(otherBoundsOrLatLng: TLatLngLiteral): Boolean; overload;
      function contains(otherBoundsOrLatLng: TLatLngTuple): Boolean; overload;
      function intersects(otherBounds: TLatLngBounds): Boolean; overload;
      function intersects(otherBounds: TLatLngBoundsLiteral): Boolean; overload;
      function overlaps(otherBounds: TLatLngBounds): Boolean; overload;
      function overlaps(otherBounds: TLatLngBoundsLiteral): Boolean; overload;
      function toBBoxString(): String;
      function equals(otherBounds: TLatLngBounds): Boolean; overload;
      function equals(otherBounds: TLatLngBoundsLiteral): Boolean; overload;
      function isValid(): Boolean;
    end;

    TPoint = class external name 'TPoint'
    public
      x: Double;
      y: Double;

      constructor new(x, y: Double); overload;
      constructor new(x, y: Double; round: Boolean); overload;
      function clone(): TPoint;
      function add(otherPoint: TPoint): TPoint; overload;
      function add(otherPoint: TPointTuple): TPoint; overload;
      function subtract(otherPoint: TPoint): TPoint; overload;
      function subtract(otherPoint: TPointTuple): TPoint; overload;
      function divideBy(num: Double): TPoint;
      function multiplyBy(num: Double): TPoint;
      function scaleBy(scale: TPoint): TPoint; overload;
      function scaleBy(scale: TPointTuple): TPoint; overload;
      function unscaleBy(scale: TPoint): TPoint; overload;
      function unscaleBy(scale: TPointTuple): TPoint; overload;
      function round(): TPoint;
      function floor(): TPoint;
      function ceil(): TPoint;
      function distanceTo(otherPoint: TPoint): Double; overload;
      function distanceTo(otherPoint: TPointTuple): Double; overload;
      function equals(otherPoint: TPoint): Boolean; overload;
      function equals(otherPoint: TPointTuple): Boolean; overload;
      function contains(otherPoint: TPoint): Boolean; overload;
      function contains(otherPoint: TPointTuple): Boolean; overload;
      function toString(): String;
    end;

    TCoords = class external name 'Coords' (TPoint)
    public
      z: Double;
    end;

    TBounds = class external name 'Bounds'
    public
      min: TPoint;
      max: TPoint;

      constructor new(points: TArray<TPoint>); overload;
      constructor new(points: TBoundsLiteral); overload;
      constructor new(topLeft, bottomRight: TPoint); overload;
      constructor new(topLeft, bottomRight: TPointTuple); overload;
      function extend(point: TPoint): TBounds; overload;
      function extend(point: TPointTuple): TBounds; overload;
      function getCenter(round: Boolean): TPoint;
      function getBottomLeft(): TPoint;
      function getBottomRight(): TPoint;
      function getTopLeft(): TPoint;
      function getTopRight(): TPoint;
      function getSize(): TPoint;
      function contains(pointOrBounds: TBounds): Boolean; overload;
      function contains(pointOrBounds: TBoundsLiteral): Boolean; overload;
      function contains(pointOrBounds: TPoint): Boolean; overload;
      function contains(pointOrBounds: TPointTuple): Boolean; overload;
      function intersects(otherBounds: TBounds): Boolean; overload;
      function intersects(otherBounds: TBoundsLiteral): Boolean; overload;
      function overlaps(otherBounds: TBounds): Boolean; overload;
      function overlaps(otherBounds: TBoundsLiteral): Boolean; overload;
    end;

    // Event handler types
    TDragEndEventHandlerFn = TProc<TDragEndEvent>;
    TErrorEventHandlerFn = TProc<TErrorEvent>;
    TLayerEventHandlerFn = TProc<TLayerEvent>;
    TLayersControlEventHandlerFn = TProc<TLayersControlEvent>;
    TLeafletEventHandlerFn = TProc<TLeafletEvent>;
    TLeafletKeyboardEventHandlerFn = TProc<TLeafletKeyboardEvent>;
    TLeafletMouseEventHandlerFn = TProc<TLeafletMouseEvent>;
    TLocationEventHandlerFn = TProc<TLocationEvent>;
    TPopupEventHandlerFn = TProc<TPopupEvent>;
    TResizeEventHandlerFn = TProc<TResizeEvent>;
    TTileErrorEventHandlerFn = TProc<TTileErrorEvent>;
    TTileEventHandlerFn = TProc<TTileEvent>;
    TTooltipEventHandlerFn = TProc<TTooltipEvent>;
    TZoomAnimEventHandlerFn = TProc<TZoomAnimEvent>;

    TLeafletEventHandlerFnMap = class external name 'LeafletEventHandlerFnMap'
    public
      baselayerchange: TLayersControlEventHandlerFn;
      overlayadd: TLayersControlEventHandlerFn;
      overlayremove: TLayersControlEventHandlerFn;

      layeradd: TLayerEventHandlerFn;
      layerremove: TLayerEventHandlerFn;

      zoomlevelschange: TLeafletEventHandlerFn;
      unload: TLeafletEventHandlerFn;
      viewreset: TLeafletEventHandlerFn;
      load: TLeafletEventHandlerFn;
      zoomstart: TLeafletEventHandlerFn;
      movestart: TLeafletEventHandlerFn;
      zoom: TLeafletEventHandlerFn;
      move: TLeafletEventHandlerFn;
      zoomend: TLeafletEventHandlerFn;
      moveend: TLeafletEventHandlerFn;
      autopanstart: TLeafletEventHandlerFn;
      dragstart: TLeafletEventHandlerFn;
      drag: TLeafletEventHandlerFn;
      add: TLeafletEventHandlerFn;
      remove: TLeafletEventHandlerFn;
      loading: TLeafletEventHandlerFn;
      error: TLeafletEventHandlerFn;
      update: TLeafletEventHandlerFn;
      down: TLeafletEventHandlerFn;
      predrag: TLeafletEventHandlerFn;

      resize: TResizeEventHandlerFn;

      popupopen: TPopupEventHandlerFn;
      popupclose: TPopupEventHandlerFn;

      tooltipopen: TTooltipEventHandlerFn;
      tooltipclose: TTooltipEventHandlerFn;

      locationerror: TErrorEventHandlerFn;

      locationfound: TLocationEventHandlerFn;

      click: TLeafletMouseEventHandlerFn;
      dblclick: TLeafletMouseEventHandlerFn;
      mousedown: TLeafletMouseEventHandlerFn;
      mouseup: TLeafletMouseEventHandlerFn;
      mouseover: TLeafletMouseEventHandlerFn;
      mouseout: TLeafletMouseEventHandlerFn;
      mousemove: TLeafletMouseEventHandlerFn;
      contextmenu: TLeafletMouseEventHandlerFn;
      preclick: TLeafletMouseEventHandlerFn;

      keypress: TLeafletKeyboardEventHandlerFn;
      keydown: TLeafletKeyboardEventHandlerFn;
      keyup: TLeafletKeyboardEventHandlerFn;

      zoomanim: TZoomAnimEventHandlerFn;

      dragend: TDragEndEventHandlerFn;

      tileunload: TTileEventHandlerFn;
      tileloadstart: TTileEventHandlerFn;
      tileload: TTileEventHandlerFn;

      tileerror: TTileErrorEventHandlerFn;
    end;

    TEvented = class external name 'Evented' (TClass)
    public
      function addEventListener(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TTileErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function addEventListener(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function addEventParent(obj: TEvented): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TTileErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function addOneTimeEventListener(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function clearAllEventListeners(): TEvented; overload;
      function fire(&type: String; data: JSValue): TEvented; overload;
      function fire(&type: String; data: JSValue; propagate: Boolean): TEvented; overload;
      function fireEvent(&type: String; data: JSValue): TEvented; overload;
      function fireEvent(&type: String; data: JSValue; propagate: Boolean): TEvented; overload;
      function hasEventListeners(&type: String): Boolean;
      function listens(&type: String): Boolean; overload;
      function off(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TTileErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function off(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function off(): TEvented; overload;
      function off(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function &on(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TTileErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function &on(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function once(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function once(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function once(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function removeEventListener(&type: String; fn: TDragEndEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLayerEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLayersControlEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLeafletEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLeafletKeyboardEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLeafletMouseEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TLocationEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TPopupEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TResizeEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TTileErrorEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TTileEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TTooltipEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(&type: String; fn: TZoomAnimEventHandlerFn; context: JSValue): TEvented; overload;
      function removeEventListener(eventMap: TLeafletEventHandlerFnMap): TEvented; overload;
      function removeEventParent(obj: TEvented): TEvented; overload;
    end;

    TDraggable = class external name 'Draggable' (TEvented)
    public
      constructor new(element, dragStartTarget: TJSHTMLElement; preventOutline: Boolean);

      procedure enable();
      procedure disable();
      procedure finishDrag();
    end;

    TLayer = class external name 'Layer' (TEvented)
    public
      constructor new(options: TLayerOptions);

      function addTo(map: TMap): TLayer; overload;
      function addTo(map: TLayerGroup): TLayer; overload;
      function remove(): TLayer;
      function removeFrom(map: TMap): TLayer;
      function getPane(name: String): TJSHTMLElement;

      // Popup methods
      function bindPopup(content: TFunc<TLayer, String>; options: TPopupOptions): TLayer; overload;
      function bindPopup(content: TFunc<TLayer, TJSHTMLElement>; options: TPopupOptions): TLayer; overload;
      function bindPopup(content: String; options: TPopupOptions): TLayer; overload;
      function bindPopup(content: TJSHTMLElement; options: TPopupOptions): TLayer; overload;
      function bindPopup(content: TPopup; options: TPopupOptions): TLayer; overload;
      function unbindPopup(): TLayer;
      function openPopup(latlng: TLatLng): TLayer; overload;
      function openPopup(latlng: TLatLngLiteral): TLayer; overload;
      function openPopup(latlng: TLatLngTuple): TLayer; overload;
      function closePopup(): TLayer;
      function togglePopup(): TLayer;
      function isPopupOpen(): Boolean;
      function setPopupContent(content: String): TLayer; overload;
      function setPopupContent(content: TJSHTMLElement): TLayer; overload;
      function setPopupContent(content: TPopup): TLayer; overload;
      function getPopup(): TPopup;

      // Tooltip methods
      function bindTooltip(content: TFunc<TLayer, String>; options: TTooltipOptions): TLayer; overload;
      function bindTooltip(content: TFunc<TLayer, TJSHTMLElement>; options: TTooltipOptions): TLayer; overload;
      function bindTooltip(content: TTooltip; options: TTooltipOptions): TLayer; overload;
      function bindTooltip(content: String; options: TTooltipOptions): TLayer; overload;
      function bindTooltip(content: TJSHTMLElement; options: TTooltipOptions): TLayer; overload;
      function unbindTooltip(): TLayer;
      function openTooltip(latlng: TLatLng): TLayer; overload;
      function openTooltip(latlng: TLatLngLiteral): TLayer; overload;
      function openTooltip(latlng: TLatLngTuple): TLayer; overload;
      function closeTooltip(): TLayer;
      function toggleTooltip(): TLayer;
      function isTooltipOpen(): Boolean;
      function setTooltipContent(content: String): TLayer; overload;
      function setTooltipContent(content: TJSHTMLElement): TLayer; overload;
      function setTooltipContent(content: TTooltip): TLayer; overload;
      function getTooltip(): TTooltip;

      // Extension methods
      function onAdd(map: TMap): TLayer;
      function onRemove(map: TMap): TLayer;
      function getEvents(): TJSObject;
      function getAttribution(): String;
      function beforeAdd(map: TMap): TLayer;
    end;

    TDoneCallback = TProc<TError, TJSHTMLElement>;

    TGridLayer = class external name 'GridLayer' (TLayer)
    public
      constructor new(options: TGridLayerOptions);
      function bringToFront(): TGridLayer;
      function bringToBack(): TGridLayer;
      function getContainer(): TJSHTMLElement;
      function setOpacity(opacity: Double): TGridLayer;
      function setZIndex(zIndex: Double): TGridLayer;
      function isLoading(): Boolean;
      function redraw(): TGridLayer;
      function getTileSize(): TPoint;
    end;

    TTileLayer = class external name 'TileLayer' (TGridLayer)
    public type
      TWMS = class external name 'WMS' (TTileLayer)
      public
        wmsParams: TWMSParams;
        options: TWMSOptions;

        constructor new(baseUrl: String; options: TWMSOptions);
        function setParams(params: TWMSParams; noRedraw: Boolean): TWMS;
      end;
    public
      options: TTileLayerOptions;

      constructor new(urlTemplate: String; options: TTileLayerOptions);
      function setUrl(url: String; noRedraw: Boolean): TTileLayer;
      function getTileUrl(coords: TCoords): String;
      function wms(baseUrl: String; options: TWMSOptions): TWMS;
    end;

    TImageOverlay = class external name 'ImageOverlay' (TLayer)
    public
      options: TImageOverlayOptions;

      constructor new(imageUrl: String; bounds: TLatLngBounds; options: TImageOverlayOptions); overload;
      constructor new(imageUrl: String; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions); overload;
      function setOpacity(opacity: Double): TImageOverlay;
      function bringToFront(): TImageOverlay;
      function bringToBack(): TImageOverlay;
      function setUrl(url: String): TImageOverlay;

      function setBounds(bounds: TLatLngBounds): TImageOverlay;

      function setZIndex(value: Double): TImageOverlay;

      function getBounds(): TLatLngBounds;

      function getElement(): TJSHTMLImageElement;
    end;

    TSVGOverlay = class external name 'SVGOverlay' (TLayer)
    public
      options: TImageOverlayOptions;

      constructor new(svgImage: String; bounds: TLatLngBounds; options: TImageOverlayOptions); overload;
      constructor new(svgImage: String; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions); overload;
      constructor new(svgImage: TJSHTMLElement; bounds: TLatLngBounds; options: TImageOverlayOptions); overload;
      constructor new(svgImage: TJSHTMLElement; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions); overload;

      function setOpacity(opacity: Double): TSVGOverlay;
      function bringToFront(): TSVGOverlay;
      function bringToBack(): TSVGOverlay;
      function setUrl(url: String): TSVGOverlay;

      function setBounds(bounds: TLatLngBounds): TSVGOverlay;

      function setZIndex(value: Double): TSVGOverlay;

      function getBounds(): TLatLngBounds;

      function getElement(): TJSHTMLElement;
    end;

    TVideoOverlay = class external name 'VideoOverlay' (TLayer)
    public
      options: TVideoOverlayOptions;

      constructor new(video: String; bounds: TLatLngBounds; options: TVideoOverlayOptions); overload;
      constructor new(video: String; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions); overload;
      constructor new(video: TArray<String>; bounds: TLatLngBounds; options: TVideoOverlayOptions); overload;
      constructor new(video: TArray<String>; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions); overload;
      constructor new(video: TJSHTMLVideoElement; bounds: TLatLngBounds; options: TVideoOverlayOptions); overload;
      constructor new(video: TJSHTMLVideoElement; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions); overload;

      function setOpacity(opacity: Double): TVideoOverlay;
      function bringToFront(): TVideoOverlay;
      function bringToBack(): TVideoOverlay;
      function setUrl(url: String): TVideoOverlay;

      function setBounds(bounds: TLatLngBounds): TVideoOverlay;

      function getBounds(): TLatLngBounds;

      function getElement(): TJSHTMLVideoElement;
    end;

    TPath = class external name 'Path' abstract (TLayer)
    public
      options: TPathOptions;

      function redraw(): TPath;
      function setStyle(style: TPathOptions): TPath;
      function bringToFront(): TPath;
      function bringToBack(): TPath;
      function getElement(): TJSHTMLElement;
    end;

    TPolyline = class external name 'Polyline' (TPath)
    public
      feature: TFeature;
      options: TPolylineOptions;

      constructor new(latlngs: TArray<TLatLng>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLng>>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TLatLngLiteral>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLngLiteral>>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TLatLngTuple>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLngTuple>>; options: TPolylineOptions); overload;

      function toGeoJSON(precision: Double): TFeature;
      function getLatLngs(): JSValue;
      function setLatLngs(latlngs: TArray<TLatLng>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TLatLngLiteral>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TLatLngTuple>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TLatLng>>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TLatLngLiteral>>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TLatLngTuple>>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TArray<TLatLng>>>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TArray<TLatLngLiteral>>>): TPolyline; overload;
      function setLatLngs(latlngs: TArray<TArray<TArray<TLatLngTuple>>>): TPolyline; overload;
      function isEmpty(): Boolean;
      function getCenter(): TLatLng;
      function getBounds(): TLatLngBounds;
      function addLatLng(latlng: TLatLng): TPolyline; overload;
      function addLatLng(latlng: TLatLngLiteral): TPolyline; overload;
      function addLatLng(latlng: TLatLngTuple): TPolyline; overload;
      function addLatLng(latlng: TLatLng; latlngs: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TLatLngLiteral; latlngs: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TLatLngTuple; latlngs: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLngLiteral>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLngTuple>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLng>; latlngs: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLngLiteral>; latlngs: TArray<TLatLng>): TPolyline; overload;
      function addLatLng(latlng: TArray<TLatLngTuple>; latlngs: TArray<TLatLng>): TPolyline; overload;
      function closestLayerPoint(p: TPoint): TPoint;
    end;

    TPolygon = class external name 'Polygon' (TPolyline)
    public
      constructor new(latlngs: TArray<TLatLng>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLng>>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TLatLngLiteral>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLngLiteral>>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TLatLngTuple>; options: TPolylineOptions); overload;
      constructor new(latlngs: TArray<TArray<TLatLngTuple>>; options: TPolylineOptions); overload;
    end;

    TRectangle = class external name 'Rectangle' (TPolygon)
    public
      constructor new(latLngBounds: TLatLngBounds; options: TPolylineOptions); overload;
      constructor new(latLngBounds: TLatLngBoundsLiteral; options: TPolylineOptions); overload;

      function setBounds(latLngBounds: TLatLngBounds): TRectangle; overload;
      function setBounds(latLngBounds: TLatLngBoundsLiteral): TRectangle; overload;
    end;

    TCircleMarker = class external name 'CircleMarker' (TPath)
    public
      options: TCircleMarkerOptions;
      feature: TFeature;

      constructor new(latlng: TLatLng; options: TCircleMarkerOptions); overload;
      constructor new(latlng: TLatLngLiteral; options: TCircleMarkerOptions); overload;
      constructor new(latlng: TLatLngTuple; options: TCircleMarkerOptions); overload;

      function toGeoJSON(precision: Double): TFeature;
      function setLatLng(latLng: JSValue): TCircleMarker;
      function getLatLng(): TLatLng;
      function setRadius(radius: Double): TCircleMarker;
      function getRadius(): Double;
    end;

    TCircle = class external name 'Circle' (TCircleMarker)
    public
      constructor new(latlng: TLatLng; options: TCircleMarkerOptions); overload;
      constructor new(latlng: TLatLngLiteral; options: TCircleMarkerOptions); overload;
      constructor new(latlng: TLatLngTuple; options: TCircleMarkerOptions); overload;

      function getBounds(): TLatLngBounds;
    end;

    TRenderer = class external name 'Renderer' (TLayer)
    public
      options: TRendererOptions;

      constructor new(options: TRendererOptions);
    end;

    TSVG = class external name 'SVG' (TRenderer)
    public
      class function create(name: String): TJSHTMLElement;
      class function pointsToPath(rings: TPoint; close: Boolean): String; overload;
      class function pointsToPath(rings: TArray<TPointTuple>; close: Boolean): String; overload;
    end;

    TCanvas = class external name 'Canvas' (TRenderer)
    end;

    TLayerGroup = class external name 'LayerGroup' (TLayer)
    public
      feature: JSValue;

      constructor new(layers: TArray<TLayer>); overload;
      constructor new(layers: TArray<TLayer>; options: TLayerOptions); overload;
      constructor new; overload;

      function addLayer(layer: TLayer): TLayerGroup;
      function clearLayers(): TLayerGroup;
      function eachLayer(fn: TProc<TLayer>; context: JSValue): TLayerGroup;
      function getLayer(id: Double): TLayer;
      function getLayerId(layer: TLayer): Double;
      function getLayers(): TArray<TLayer>;
      function hasLayer(layer: TLayer): Boolean;
      function invoke(methodName: String): TLayerGroup; varargs;
      function removeLayer(layer: TLayer): TLayerGroup;
      function setZIndex(zIndex: Double): TLayerGroup;
      function toGeoJSON(precision: Double): JSValue; overload;
      function toGeoJSON: JSValue; overload;
    end;

    TFeatureGroup = class external name 'FeatureGroup' (TLayerGroup)
    public
      function bringToBack(): TFeatureGroup;
      function bringToFront(): TFeatureGroup;
      function getBounds(): TLatLngBounds;
      function setStyle(style: TPathOptions): TFeatureGroup;
    end;

    TStyleFunction = TFunc<TFeature, TPathOptions>;

    TGeoJSON = class external name 'GeoJSON' (TFeatureGroup)
    public
      options: TGeoJSONOptions;

      constructor new(geojson: TGeoJsonObject; options: TGeoJSONOptions);

      class function asFeature(geojson: TFeature): TFeature;
      class function coordsToLatLng(coords: TArray<Double>): TLatLng;
      class function coordsToLatLngs(coords: TArray<JSValue>; levelsDeep: Double; coordsToLatLng: TFunc<TArray<Double>, TLatLng>): TArray<JSValue>; // Using TArray<JSValue> to avoid artificially limiting valid calls
      class function geometryToLayer(featureData: TFeature; options: TGeoJSONOptions): TLayer;
      class function latLngToCoords(latlng: TLatLng): TArray<Double>;
      class function latLngsToCoords(latlngs: TArray<JSValue>; levelsDeep: Double; closed: Boolean): TArray<JSValue>;  // Using TArray<JSValue> to avoid artificially limiting valid calls

      function addData(data: TGeoJsonObject): TLayer;
      function resetStyle(layer: TLayer): TLayer;
      function setStyle(style: TPathOptions): TGeoJSON; overload;
      function setStyle(style: TStyleFunction): TGeoJSON; overload;
    end;

    TControl = class external name 'Control' (TClass)
    public type
      TZoom = class external name 'Zoom' (TControl)
      public
        options: TZoomControlOptions;
        constructor new(options: TZoomControlOptions);
      end;

      TAttribution = class external name 'Attribution' (TControl)
      public
        options: TAttributionOptions;

        constructor new(options: TAttributionOptions);
        function setPrefix(prefix: String): TAttribution;
        function addAttribution(text: String): TAttribution;
        function removeAttribution(text: String): TAttribution;
      end;

      TLayers = class external name 'Layers' (TControl)
      public
        options: TLayersOptions;

        constructor new; overload;
        constructor new(baseLayers: TLayersObject); overload;
        constructor new(baseLayers, overlays: TLayersObject); overload;
        constructor new(baseLayers, overlays: TLayersObject; options: TLayersOptions); overload;

        function addBaseLayer(layer: TLayer; name: String): TLayers;
        function addOverlay(layer: TLayer; name: String): TLayers;
        function removeLayer(layer: TLayer): TLayers;
        function expand(): TLayers;
        function collapse(): TLayers;
      end;

      TScale = class external name 'Scale' (TControl)
      public
        options: TScaleOptions;
        constructor new(options: TScaleOptions);
      end;
    public
      // Extension methods
      onAdd: TFunc<TMap, TJSHTMLElement>;
      onRemove: TProc<TMap>;
      options: TControlOptions;

      constructor new(options: TControlOptions);
      function getPosition(): String;
      function setPosition(position: String): TControl;
      function getContainer(): TJSHTMLElement;
      function addTo(map: TMap): TControl;
      function remove(): TControl;
      function zoom(options: TZoomControlOptions): TZoom;
      function attribution(options: TAttributionOptions): TAttribution;
      function layers(baseLayers, overlays: TLayersObject; options: TLayersOptions): TLayers;
      function scale(options: TScaleOptions): TScale;
    end;

    TDivOverlay = class external name 'DivOverlay' abstract (TLayer)
    public
      options: TDivOverlayOptions;

      constructor new; overload;
      constructor new(options: TDivOverlayOptions); overload;
      constructor new(options: TDivOverlayOptions; source: TLayer); overload;
      function getLatLng(): TLatLng;
      function setLatLng(latlng: TLatLng): TDivOverlay; overload;
      function setLatLng(latlng: TLatLngLiteral): TDivOverlay; overload;
      function setLatLng(latlng: TLatLngTuple): TDivOverlay; overload;
      function getContent(): JSValue;
      function setContent(htmlContent: TFunc<TLayer, String>): TDivOverlay; overload;
      function setContent(htmlContent: TFunc<TLayer, TJSHTMLElement>): TDivOverlay; overload;
      function setContent(htmlContent: String): TDivOverlay; overload;
      function setContent(htmlContent: TJSHTMLElement): TDivOverlay; overload;
      function getElement(): TJSHTMLElement;
      procedure update();
      function isOpen(): Boolean;
      function bringToFront(): TDivOverlay;
      function bringToBack(): TDivOverlay;
    end;

    TPopup = class external name 'Popup' (TDivOverlay)
    public
      options: TPopupOptions;

      constructor new; overload;
      constructor new(options: TPopupOptions); overload;
      constructor new(options: TPopupOptions; source: TLayer); overload;
      function openOn(map: TMap): TPopup;
    end;

    TTooltip = class external name 'Tooltip' (TDivOverlay)
    public
      options: TTooltipOptions;

      constructor new; overload;
      constructor new(options: TTooltipOptions); overload;
      constructor new(options: TTooltipOptions; source: TLayer); overload;

      procedure setOpacity(val: Double);
    end;

    THandler = class external name 'Handler' (TClass)
    public
      // Extension methods
      addHooks: TProc;
      removeHooks: TProc;

      constructor new(map: TMap);

      function disable(): THandler;
      function enable(): THandler;
      function enabled(): Boolean;
    end;

    THandlerClass = class of THandler;

    TDomEvent = class external name 'DomEvent'
    public type
      TEventHandlerFn = TProc<TLeafletEvent>;
    public
      function addListener(el: TJSHTMLElement; types: String; fn: TEventHandlerFn; context: JSValue): TDomEvent;
      function disableClickPropagation(el: TJSHTMLElement): TDomEvent;
      function disableScrollPropagation(el: TJSHTMLElement): TDomEvent;
      function getMousePosition(ev: TLeafletMouseEvent; container: TJSHTMLElement): TPoint;
      function getWheelDelta(ev: TLeafletEvent): Double;
      function off(el: TJSHTMLElement; types: String; fn: TEventHandlerFn; context: JSValue): TDomEvent;
      function &on(el: TJSHTMLElement; types: String; fn: TEventHandlerFn; context: JSValue): TDomEvent;
      function preventDefault(ev: TLeafletEvent): TDomEvent;
      function removeListener(el: TJSHTMLElement; types: String; fn: TEventHandlerFn; context: JSValue): TDomEvent;
      function stop(ev: TLeafletEvent): TDomEvent;
      function stopPropagation(ev: TLeafletEvent): TDomEvent;
    end;

    TMap = class external name 'Map' (TEvented)
    public
      // Properties
      attributionControl: TLeaflet.TControl.TAttribution;
      boxZoom: THandler;
      doubleClickZoom: THandler;
      dragging: THandler;
      keyboard: THandler;
      scrollWheelZoom: THandler;
      tap: THandler;
      touchZoom: THandler;
      zoomControl: TControl.TZoom;

      options: TMapOptions;

      constructor new(element: String); overload;
      constructor new(element: String; options: TMapOptions); overload;
      constructor new(element: TJSHTMLElement); overload;
      constructor new(element: TJSHTMLElement; options: TMapOptions); overload;

      function getRenderer(layer: TPath): TRenderer;

      // Methods for layers and controls
      function addControl(control: TControl): TMap;
      function addLayer(layer: TLayer): TMap;
      function closePopup(popup: TPopup): TMap;
      function closeTooltip(tooltip: TTooltip): TMap;
      function eachLayer(fn: TProc<TLayer>; context: JSValue): TMap;
      function hasLayer(layer: TLayer): Boolean;
      function openPopup(content: String; latlng: TLatLng; options: TPopupOptions): TMap; overload;
      function openPopup(content: String; latlng: TLatLngLiteral; options: TPopupOptions): TMap; overload;
      function openPopup(content: String; latlng: TLatLngTuple; options: TPopupOptions): TMap; overload;
      function openPopup(content: TJSHTMLElement; latlng: TLatLng; options: TPopupOptions): TMap; overload;
      function openPopup(content: TJSHTMLElement; latlng: TLatLngLiteral; options: TPopupOptions): TMap; overload;
      function openPopup(content: TJSHTMLElement; latlng: TLatLngTuple; options: TPopupOptions): TMap; overload;
      function openPopup(popup: TPopup): TMap; overload;
      function openTooltip(content: String; latlng: TLatLng; options: TTooltipOptions): TMap; overload;
      function openTooltip(content: String; latlng: TLatLngLiteral; options: TTooltipOptions): TMap; overload;
      function openTooltip(content: String; latlng: TLatLngTuple; options: TTooltipOptions): TMap; overload;
      function openTooltip(content: TJSHTMLElement; latlng: TLatLng; options: TTooltipOptions): TMap; overload;
      function openTooltip(content: TJSHTMLElement; latlng: TLatLngLiteral; options: TTooltipOptions): TMap; overload;
      function openTooltip(content: TJSHTMLElement; latlng: TLatLngTuple; options: TTooltipOptions): TMap; overload;
      function openTooltip(tooltip: TTooltip): TMap; overload;
      function removeControl(control: TControl): TMap;
      function removeLayer(layer: TLayer): TMap;

      // Methods for modifying map state
      function fitBounds(bounds: TLatLngBounds; options: TFitBoundsOptions): TMap; overload;
      function fitBounds(bounds: TLatLngBoundsLiteral; options: TFitBoundsOptions): TMap; overload;
      function fitWorld(options: TFitBoundsOptions): TMap;
      function flyTo(latlng: TLatLng; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function flyTo(latlng: TLatLngLiteral; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function flyTo(latlng: TLatLngTuple; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function flyToBounds(bounds: TLatLngBounds): TMap; overload;
      function flyToBounds(bounds: TLatLngBounds; options: TFitBoundsOptions): TMap; overload;
      function flyToBounds(bounds: TLatLngBoundsLiteral): TMap; overload;
      function flyToBounds(bounds: TLatLngBoundsLiteral; options: TFitBoundsOptions): TMap; overload;
      function invalidateSize(options: Boolean): TMap; overload;
      function invalidateSize(options: TInvalidateSizeOptions): TMap; overload;
      function panBy(offset: TPoint; options: TPanOptions): TMap; overload;
      function panBy(offset: TPointTuple; options: TPanOptions): TMap; overload;
      function panInside(latLng: JSValue; options: TPanInsideOptions): TMap;
      function panInsideBounds(bounds: TLatLngBounds; options: TPanOptions): TMap; overload;
      function panInsideBounds(bounds: TLatLngBoundsLiteral; options: TPanOptions): TMap; overload;
      function panTo(latlng: TLatLng; options: TPanOptions): TMap; overload;
      function panTo(latlng: TLatLngLiteral; options: TPanOptions): TMap; overload;
      function panTo(latlng: TLatLngTuple; options: TPanOptions): TMap; overload;
      function setMaxBounds(bounds: TLatLngBounds): TMap; overload;
      function setMaxBounds(bounds: TLatLngBoundsLiteral): TMap; overload;
      function setMaxZoom(zoom: Double): TMap;
      function setMinZoom(zoom: Double): TMap;
      function setView(center: TLatLngLiteral; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function setView(center: TLatLngTuple; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function setView(center: TLatLng; zoom: Double; options: TZoomPanOptions): TMap; overload;
      function setZoom(zoom: Double; options: TZoomPanOptions): TMap;
      function setZoomAround(position: TLatLng; zoom: Double; options: TZoomOptions): TMap; overload;
      function setZoomAround(position: TLatLngLiteral; zoom: Double; options: TZoomOptions): TMap; overload;
      function setZoomAround(position: TLatLngTuple; zoom: Double; options: TZoomOptions): TMap; overload;
      function setZoomAround(position: TPoint; zoom: Double; options: TZoomOptions): TMap; overload;
      function stop(): TMap;
      function zoomIn(delta: Double; options: TZoomOptions): TMap;
      function zoomOut(delta: Double; options: TZoomOptions): TMap;

      // Other methods
      function addHandler(name: String; HandlerClass: THandlerClass): TMap; // Alternatively; HandlerClass: new(map: TMap) => THandler
      function createPane(name: String; container: TJSHTMLElement): TJSHTMLElement;
      function getContainer(): TJSHTMLElement;
      function getPane(pane: String): TJSHTMLElement; overload;
      function getPane(pane: TJSHTMLElement): TJSHTMLElement; overload;
      function getPanes(): TDefaultMapPanes;
      function remove(): TMap;
      function whenReady(fn: TProc; context: JSValue): TMap;

      // Methods for getting map state
      function getBounds(): TLatLngBounds;
      function getBoundsZoom(bounds: TLatLngBounds; inside: Boolean; padding: TPoint): Double; overload;
      function getBoundsZoom(bounds: TLatLngBoundsLiteral; inside: Boolean; padding: TPoint): Double; overload;
      function getCenter(): TLatLng;
      function getMaxZoom(): Double;
      function getMinZoom(): Double;
      function getPixelBounds(): TBounds;
      function getPixelOrigin(): TPoint;
      function getPixelWorldBounds(zoom: Double): TBounds;
      function getSize(): TPoint;
      function getZoom(): Double;

      // Conversion methods
      function containerPointToLatLng(point: TPoint): TLatLng; overload;
      function containerPointToLatLng(point: TPointTuple): TLatLng; overload;
      function containerPointToLayerPoint(point: TPoint): TPoint; overload;
      function containerPointToLayerPoint(point: TPointTuple): TPoint; overload;
      function distance(latlng1, latlng2: TLatLng): Double; overload;
      function distance(latlng1, latlng2: TLatLngLiteral): Double; overload;
      function distance(latlng1, latlng2: TLatLngTuple): Double; overload;
      function getScaleZoom(scale: Double; fromZoom: Double): Double;
      function getZoomScale(toZoom: Double; fromZoom: Double): Double;
      function latLngToContainerPoint(latlng: TLatLng): TPoint; overload;
      function latLngToContainerPoint(latlng: TLatLngLiteral): TPoint; overload;
      function latLngToContainerPoint(latlng: TLatLngTuple): TPoint; overload;
      function latLngToLayerPoint(latlng: TLatLng): TPoint; overload;
      function latLngToLayerPoint(latlng: TLatLngLiteral): TPoint; overload;
      function latLngToLayerPoint(latlng: TLatLngTuple): TPoint; overload;
      function layerPointToContainerPoint(point: TPoint): TPoint; overload;
      function layerPointToContainerPoint(point: TPointTuple): TPoint; overload;
      function layerPointToLatLng(point: TPoint): TLatLng; overload;
      function layerPointToLatLng(point: TPointTuple): TLatLng; overload;
      function mouseEventToContainerPoint(ev: TLeafletMouseEvent): TPoint;
      function mouseEventToLatLng(ev: TLeafletMouseEvent): TLatLng;
      function mouseEventToLayerPoint(ev: TLeafletMouseEvent): TPoint;
      function project(latlng: TLatLng; zoom: Double): TPoint; overload;
      function project(latlng: TLatLngLiteral; zoom: Double): TPoint; overload;
      function project(latlng: TLatLngTuple; zoom: Double): TPoint; overload;
      function unproject(point: TPoint; zoom: Double): TLatLng; overload;
      function unproject(point: TPointTuple; zoom: Double): TLatLng; overload;
      function wrapLatLng(latlng: TLatLng): TLatLng; overload;
      function wrapLatLng(latlng: TLatLngLiteral): TLatLng; overload;
      function wrapLatLng(latlng: TLatLngTuple): TLatLng; overload;
      function wrapLatLngBounds(bounds: TLatLngBounds): TLatLngBounds;

      // Geolocation methods
      function locate(options: TLocateOptions): TMap;
      function stopLocate(): TMap;
    end;

    TIcon = class external name 'Icon'
    public
      options: TIconOptions;

      constructor new(options: TIconOptions);

      function createIcon(oldIcon: TJSHTMLElement): TJSHTMLElement;
      function createShadow(oldIcon: TJSHTMLElement): TJSHTMLElement;
    end;

    TDefaultIcon = class external name 'Icon.Default' (TIcon)
    public
      constructor new; overload;
      constructor new(options: TIconOptions); overload;
    end;

    TDivIcon = class external name 'DivIcon' (TIcon)
    public
      options: TDivIconOptions;

      constructor new(options: TDivIconOptions);
    end;

    TMarker = class external name 'Marker' (TLayer)
    public
      // Properties
      options: TMarkerOptions;
      dragging: THandler;
      feature: TFeature;

      constructor new(latlng: TLatLng; options: TMarkerOptions); overload;
      constructor new(latlng: TLatLngLiteral; options: TMarkerOptions); overload;
      constructor new(latlng: TLatLngTuple; options: TMarkerOptions); overload;

      function toGeoJSON(precision: Double): TFeature;
      function getLatLng(): TLatLng;
      function setLatLng(latlng: TLatLng): TMarker; overload;
      function setLatLng(latlng: TLatLngLiteral): TMarker; overload;
      function setLatLng(latlng: TLatLngTuple): TMarker; overload;
      function setZIndexOffset(offset: Double): TMarker;
      function getIcon(): JSValue;
      function setIcon(icon: JSValue): TMarker;
      function setOpacity(opacity: Double): TMarker;
      function getElement(): TJSHTMLElement;
    end;

    TBrowser = class external name 'Browser'
    public const
      ie: Boolean;
      ielt9: Boolean;
      edge: Boolean;
      webkit: Boolean;
      android: Boolean;
      android23: Boolean;
      androidStock: Boolean;
      opera: Boolean;
      chrome: Boolean;
      gecko: Boolean;
      safari: Boolean;
      opera12: Boolean;
      win: Boolean;
      ie3d: Boolean;
      webkit3d: Boolean;
      gecko3d: Boolean;
      any3d: Boolean;
      mobile: Boolean;
      mobileWebkit: Boolean;
      mobileWebkit3d: Boolean;
      msPointer: Boolean;
      pointer: Boolean;
      touch: Boolean;
      mobileOpera: Boolean;
      mobileGecko: Boolean;
      retina: Boolean;
      canvas: Boolean;
      svg: Boolean;
      vml: Boolean;
    end;

    TUtil = class external name 'Util'
    public
      function extend(dest: JSValue): JSValue; varargs;

      function stamp(obj: JSValue): Double;
      function throttle(fn: TProc; time: Double; context: JSValue): TProc;
      function wrapNum(num: Double; range: TArray<Double>; includeMax: Boolean): Double;
      function falseFn(): Boolean;
      function formatNum(num: Double; digits: Double): Double;
      function trim(str: String): String;
      function splitWords(str: String): TArray<String>;
      function setOptions(obj: JSValue; options: JSValue): JSValue;
      function getParamString(obj: JSValue; existingUrl: String; uppercase: Boolean): String;
      function template(str: String; data: JSValue): String;
      function isArray(obj: JSValue): Boolean;
      function indexOf(&array: TArray<JSValue>; el: JSValue): Double;
      function requestAnimFrame(fn: TProc<Double>; context: JSValue; immediate: Boolean): Double;
      procedure cancelAnimFrame(id: Double);
    end;
  public
    lastId: Double;
    emptyImageUrl: String;

    function bounds(topLeft, bottomRight: TPoint): TBounds; overload;
    function bounds(topLeft, bottomRight: TPointTuple): TBounds; overload;
    function bounds(points: TArray<TPoint>): TBounds; overload;
    function bounds(points: TBoundsLiteral): TBounds; overload;
    function canvas(options: TRendererOptions): TCanvas;
    function circle(latlng: TLatLng; options: TCircleMarkerOptions): TCircle; overload;
    function circle(latlng: TLatLngLiteral; options: TCircleMarkerOptions): TCircle; overload;
    function circle(latlng: TLatLngTuple; options: TCircleMarkerOptions): TCircle; overload;
    function circleMarker(latlng: TLatLng; options: TCircleMarkerOptions): TCircleMarker; overload;
    function circleMarker(latlng: TLatLngLiteral; options: TCircleMarkerOptions): TCircleMarker; overload;
    function circleMarker(latlng: TLatLngTuple; options: TCircleMarkerOptions): TCircleMarker; overload;
    function divIcon(options: TDivIconOptions): TDivIcon;
    function featureGroup(layers: TArray<TLayer>): TFeatureGroup;
    function geoJSON(geojson: TGeoJsonObject; options: TGeoJSONOptions): TGeoJSON;
    function gridLayer(options: TGridLayerOptions): TGridLayer;
    function icon(options: TIconOptions): TIcon;
    function imageOverlay(imageUrl: String; bounds: TLatLngBounds; options: TImageOverlayOptions): TImageOverlay; overload;
    function imageOverlay(imageUrl: String; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions): TImageOverlay; overload;
    function latLng(coords: TArray<Double>): TLatLng; overload;
    function latLng(latitude, longitude: Double): TLatLng; overload;
    function latLng(latitude, longitude, altitude: Double): TLatLng; overload;
    function latLngBounds(southWest, northEast: TLatLng): TLatLngBounds; overload;
    function latLngBounds(southWest, northEast: TLatLngLiteral): TLatLngBounds; overload;
    function latLngBounds(southWest, northEast: TLatLngTuple): TLatLngBounds; overload;
    function latLngBounds(latlngs: TArray<TLatLng>): TLatLngBounds; overload;
    function latLngBounds(latlngs: TArray<TLatLngLiteral>): TLatLngBounds; overload;
    function latLngBounds(latlngs: TArray<TLatLngTuple>): TLatLngBounds; overload;
    function layerGroup: TLayerGroup; overload;
    function layerGroup(layers: TArray<TLayer>): TLayerGroup; overload;
    function layerGroup(layers: TArray<TLayer>; options: TLayerOptions): TLayerGroup; overload;
    function map(element: String; options: TMapOptions): TMap; overload;
    function map(element: TJSHTMLElement; options: TMapOptions): TMap; overload;
    function marker(latlng: TLatLng; options: TMarkerOptions): TMarker; overload;
    function marker(latlng: TLatLngLiteral; options: TMarkerOptions): TMarker; overload;
    function marker(latlng: TLatLngTuple; options: TMarkerOptions): TMarker; overload;
    function point(x, y: Double): TPoint; overload;
    function point(x, y: Double; round: Boolean): TPoint; overload;
    function point(coords: TPointTuple): TPoint; overload;
    function polyline(latlngs: TArray<TLatLng>; options: TPolylineOptions): TPolyline; overload;
    function polyline(latlngs: TArray<TArray<TLatLng>>; options: TPolylineOptions): TPolyline; overload;
    function polyline(latlngs: TArray<TLatLngLiteral>; options: TPolylineOptions): TPolyline; overload;
    function polyline(latlngs: TArray<TArray<TLatLngLiteral>>; options: TPolylineOptions): TPolyline; overload;
    function polyline(latlngs: TArray<TLatLngTuple>; options: TPolylineOptions): TPolyline; overload;
    function polyline(latlngs: TArray<TArray<TLatLngTuple>>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TLatLng>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TArray<TLatLng>>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TLatLngLiteral>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TArray<TLatLngLiteral>>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TLatLngTuple>; options: TPolylineOptions): TPolyline; overload;
    function polygon(latlngs: TArray<TArray<TLatLngTuple>>; options: TPolylineOptions): TPolyline; overload;
    function popup: TPopup; overload;
    function popup(options: TPopupOptions): TPopup; overload;
    function popup(options: TPopupOptions; source: TLayer): TPopup; overload;
    function rectangle(latLngBounds: TLatLngBounds; options: TPolylineOptions): TRectangle; overload;
    function rectangle(latLngBounds: TLatLngBoundsLiteral; options: TPolylineOptions): TRectangle; overload;
    function svg(options: TRendererOptions): TSVG;
    function svgOverlay(svgImage: String; bounds: TLatLngBounds; options: TImageOverlayOptions): TSVGOverlay; overload;
    function svgOverlay(svgImage: String; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions): TSVGOverlay; overload;
    function svgOverlay(svgImage: TJSHTMLElement; bounds: TLatLngBounds; options: TImageOverlayOptions): TSVGOverlay; overload;
    function svgOverlay(svgImage: TJSHTMLElement; bounds: TLatLngBoundsLiteral; options: TImageOverlayOptions): TSVGOverlay; overload;
    function tileLayer(urlTemplate: String; options: TTileLayerOptions): TTileLayer;
    function tooltip: TTooltip; overload;
    function tooltip(options: TTooltipOptions): TTooltip; overload;
    function tooltip(options: TTooltipOptions; source: TLayer): TTooltip; overload;
    function videoOverlay(video: String; bounds: TLatLngBounds; options: TVideoOverlayOptions): TVideoOverlay; overload;
    function videoOverlay(video: String; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions): TVideoOverlay; overload;
    function videoOverlay(video: TArray<String>; bounds: TLatLngBounds; options: TVideoOverlayOptions): TVideoOverlay; overload;
    function videoOverlay(video: TArray<String>; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions): TVideoOverlay; overload;
    function videoOverlay(video: TJSHTMLVideoElement; bounds: TLatLngBounds; options: TVideoOverlayOptions): TVideoOverlay; overload;
    function videoOverlay(video: TJSHTMLVideoElement; bounds: TLatLngBoundsLiteral; options: TVideoOverlayOptions): TVideoOverlay; overload;
  end;

  TLatLngLiteral = class
  public
    lat: Double;
    lng: Double;
  end;

  TLayerOptions = class
  public
    pane: String;
    attribution: String;
  end;

  TInteractiveLayerOptions = class(TLayerOptions)
  public
    interactive: Boolean;
    bubblingMouseEvents: Boolean;
  end;

  TGridLayerOptions = class(TLayerOptions)
  public
    tileSize: TPoint;
    tileSizeNumber: Double; external name 'tileSize';
    opacity: Double;
    updateWhenIdle: Boolean;
    updateWhenZooming: Boolean;
    updateInterval: Double;
    attribution: String;
    zIndex: Double;
    bounds: JSValue;
    minZoom: Double;
    maxZoom: Double;
    noWrap: Boolean;
    pane: String;
    className: String;
    keepBuffer: Double;
  end;

  TTileLayerOptions = class(TGridLayerOptions)
  public
    id: String;
    accessToken: String;
    minZoom: Double;
    maxZoom: Double;
    maxNativeZoom: Double;
    minNativeZoom: Double;
    subdomains: TArray<String>;
    errorTileUrl: String;
    zoomOffset: Double;
    tms: Boolean;
    zoomReverse: Boolean;
    detectRetina: Boolean;
    crossOrigin: String;
  end;

  TWMSOptions = class(TTileLayerOptions)
  public
    layers: String;
    styles: String;
    format: String;
    transparent: Boolean;
    version: String;
    crs: TLeaflet.TCRS;
    uppercase: Boolean;
  end;

  TWMSParams = class
  public
    format: String;
    layers: String;
    request: String;
    service: String;
    styles: String;
    version: String;
    transparent: Boolean;
    width: Double;
    height: Double;
  end;

  TImageOverlayOptions = class(TInteractiveLayerOptions)
  public
    opacity: Double;
    alt: String;
    interactive: Boolean;
    attribution: String;
    crossOrigin: String;
    errorOverlayUrl: String;
    zIndex: Double;
    className: String;
  end;

  TVideoOverlayOptions = class(TImageOverlayOptions)
  public
    autoplay: Boolean;
    loop: Boolean;
    keepAspectRatio: Boolean;
  end;

  TPathOptions = class(TInteractiveLayerOptions)
  public
    stroke: Boolean;
    color: String;
    weight: Double;
    opacity: Double;
    lineCap: String;
    lineJoin: String;
    dashArray: TArray<Double>;
    dashOffset: String;
    fill: Boolean;
    fillColor: String;
    fillOpacity: Double;
    fillRule: String;
    renderer: TLeaflet.TRenderer;
    className: String;
  end;

  TPolylineOptions = class(TPathOptions)
  public
    smoothFactor: Double;
    noClip: Boolean;
  end;

  TCircleMarkerOptions = class(TPathOptions)
  public
    radius: Double;
  end;

  TRendererOptions = class (TLayerOptions)
  public
    padding: Double;
    tolerance: Double;
  end;

  TGeoJSONOptions = class(TInteractiveLayerOptions)
  public
    coordsToLatLng: TFunc<TArray<Double>, TLeaflet.TLatLng>;
    filter: TFunc<TFeature, Boolean>;
    onEachFeature: TProc<TFeature, TLeaflet.TLayer>;
    pointToLayer: TFunc<TFeature, TLeaflet.TLatLng, TLeaflet.TLayer>;
    style: TPathOptions;
    styleFunction: TLeaflet.TStyleFunction; external name 'style';
  end;

  TMapOptions = class
  private
    FCRS: TLeaflet.TCRS; external name 'crs';

    function GetCRS: TLeaflet.TCRS;

    procedure SetCRS(Value: TLeaflet.TCRS);
  public
    preferCanvas: Boolean;

    // Control options
    attributionControl: Boolean;
    zoomControl: Boolean;

    // Interaction options
    closePopupOnClick: Boolean;
    zoomSnap: Double;
    zoomDelta: Double;
    trackResize: Boolean;
    boxZoom: Boolean;
    doubleClickZoom: String;
    dragging: Boolean;

    // Map state options
    center: JSValue;
    zoom: Double;
    minZoom: Double;
    maxZoom: Double;
    layers: TArray<TLeaflet.TLayer>;
    maxBounds: JSValue;
    renderer: TLeaflet.TRenderer;

    // Animation options
    fadeAnimation: Boolean;
    markerZoomAnimation: Boolean;
    transform3DLimit: Double;
    zoomAnimation: Boolean;
    zoomAnimationThreshold: Double;

    // Panning inertia options
    inertia: Boolean;
    inertiaDeceleration: Double;
    inertiaMaxSpeed: Double;
    easeLinearity: Double;
    worldCopyJump: Boolean;
    maxBoundsViscosity: Double;

    // Keyboard navigation options
    keyboard: Boolean;
    keyboardPanDelta: Double;

    // Mousewheel options
    scrollWheelZoom: TLeaflet.TControl.TZoom;
    wheelDebounceTime: Double;
    wheelPxPerZoomLevel: Double;

    // Touch interaction options
    tap: Boolean;
    tapTolerance: Double;
    touchZoom: TLeaflet.TControl.TZoom;
    bounceAtZoomLimits: Boolean;

    property crs: TLeaflet.TCRS read GetCRS write SetCRS;
  end;

  TControlOptions = class
  public
    position: String;
  end;

  TZoomControlOptions = class(TControlOptions)
  public
    zoomInText: String;
    zoomInTitle: String;
    zoomOutText: String;
    zoomOutTitle: String;
  end;

  TAttributionOptions = class(TControlOptions)
  public
    prefix: String;
  end;

  TLayersOptions = class(TControlOptions)
  public
    collapsed: Boolean;
    autoZIndex: Boolean;
    hideSingleBase: Boolean;
  end;

  TLayersObject = class
  private
    function GetLayers(name: String): TLeaflet.TLayer; external name '[]';

    procedure SetLayers(name: String; Value: TLeaflet.TLayer); external name '[]';
  public
    property Layers[name: String]: TLeaflet.TLayer read GetLayers write SetLayers;
  end;

  TScaleOptions = class(TControlOptions)
  public
    maxWidth: Double;
    metric: Boolean;
    imperial: Boolean;
    updateWhenIdle: Boolean;
  end;

  TDivOverlayOptions = class
  public
    offset: TPoint;
    zoomAnimation: Boolean;
    className: String;
    pane: String;
  end;

  TPopupOptions = class(TDivOverlayOptions)
  public
    maxWidth: Double;
    minWidth: Double;
    maxHeight: Double;
    keepInView: Boolean;
    closeButton: Boolean;
    autoPan: Boolean;
    autoPanPaddingTopLeft: TPoint;
    autoPanPaddingBottomRight: TPoint;
    autoPanPadding: TPoint;
    autoClose: Boolean;
    closeOnClick: Boolean;
    closeOnEscapeKey: Boolean;
  end;

  TTooltipOptions = class(TDivOverlayOptions)
  public
    pane: String;
    offset: TPoint;
    direction: String;
    permanent: Boolean;
    sticky: Boolean;
    interactive: Boolean;
    opacity: Double;
  end;

  TZoomOptions = class
  public
    animate: Boolean;
  end;

  TPanOptions = class(TZoomOptions)
  public
    duration: Double;
    easeLinearity: Double;
    noMoveStart: Boolean;
  end;

  TZoomPanOptions = class(TZoomOptions)
  end;

  TInvalidateSizeOptions = class(TZoomPanOptions)
  public
    debounceMoveend: Boolean;
    pan: Boolean;
  end;

  TFitBoundsOptions = class(TZoomPanOptions)
  public
    paddingTopLeft: TPoint;
    paddingBottomRight: TPoint;
    padding: TPoint;
    maxZoom: Double;
  end;

  TPanInsideOptions = class
  public
    paddingTopLeft: TPoint;
    paddingBottomRight: TPoint;
    padding: TPoint;
  end;

  TLocateOptions = class
  public
    watch: Boolean;
    setView: Boolean;
    maxZoom: Double;
    timeout: Double;
    maximumAge: Double;
    enableHighAccuracy: Boolean;
  end;

  TLeafletEvent = class
  public
    &type: String;
    target: JSValue;
    sourceTarget: JSValue;
    propagatedFrom: JSValue;
  end;

  TLeafletMouseEvent = class(TLeafletEvent)
  public
    latlng: TLeaflet.TLatLng;
    layerPoint: TPoint;
    containerPoint: TPoint;
    originalEvent: TLeafletMouseEvent;
  end;

  TLeafletKeyboardEvent = class(TLeafletEvent)
  public
    originalEvent: TLeafletKeyboardEvent;
  end;

  TLocationEvent = class(TLeafletEvent)
  public
    latlng: TLeaflet.TLatLng;
    bounds: TLeaflet.TLatLngBounds;
    accuracy: Double;
    altitude: Double;
    altitudeAccuracy: Double;
    heading: Double;
    speed: Double;
    timestamp: Double;
  end;

  TErrorEvent = class(TLeafletEvent)
  public
    message: String;
    code: Double;
  end;

  TLayerEvent = class(TLeafletEvent)
  public
    layer: TLeaflet.TLayer;
  end;

  TLayersControlEvent = class(TLayerEvent)
  public
    name: String;
  end;

  TTileEvent = class(TLeafletEvent)
  public
    tile: TJSHTMLImageElement;
    coords: TLeaflet.TCoords;
  end;

  TTileErrorEvent = class(TTileEvent)
  public
    error: TError;
  end;

  TResizeEvent = class(TLeafletEvent)
  public
    oldSize: TPoint;
    newSize: TPoint;
  end;

  TGeoJSONEvent = class(TLeafletEvent)
  public
    layer: TLeaflet.TLayer;
    properties: JSValue;
    geometryType: String;
    id: String;
  end;

  TPopupEvent = class(TLeafletEvent)
  public
    popup: TLeaflet.TPopup;
  end;

  TTooltipEvent = class(TLeafletEvent)
  public
    tooltip: TLeaflet.TTooltip;
  end;

  TDragEndEvent = class(TLeafletEvent)
  public
    distance: Double;
  end;

  TZoomAnimEvent = class(TLeafletEvent)
  public
    center: TLeaflet.TLatLng;
    zoom: Double;
    noUpdate: Boolean;
  end;

  TDefaultMapPanes = class
  public
    mapPane: TJSHTMLElement;
    tilePane: TJSHTMLElement;
    overlayPane: TJSHTMLElement;
    shadowPane: TJSHTMLElement;
    markerPane: TJSHTMLElement;
    tooltipPane: TJSHTMLElement;
    popupPane: TJSHTMLElement;
  end;

  TIconOptions = class(TLayerOptions)
  public
    iconUrl: String;
    iconRetinaUrl: String;
    iconSize: TPoint;
    iconAnchor: TPoint;
    popupAnchor: TPoint;
    tooltipAnchor: TPoint;
    shadowUrl: String;
    shadowRetinaUrl: String;
    shadowSize: TPoint;
    shadowAnchor: TPoint;
    className: String;
  end;

  TDivIconOptions = class (TIconOptions)
  public
    html: JSValue;
    bgPos: TPoint;
    iconSize: TPoint;
    iconAnchor: TPoint;
    popupAnchor: TPoint;
    className: String;
  end;

  TMarkerOptions = class(TInteractiveLayerOptions)
  public
    icon: JSValue;
    draggable: Boolean;
    keyboard: Boolean;
    title: String;
    alt: String;
    zIndexOffset: Double;
    opacity: Double;
    riseOnHover: Boolean;
    riseOffset: Double;
    shadowPane: String;
    autoPan: Boolean;
    autoPanPadding: TPoint;
    autoPanSpeed: Double;
  end;

  TError = class
  end;

  TMapboxLayerOptions = class(TTileLayerOptions)
  public
    AccessToken: String; external name 'accessToken';
    Style: String; external name 'style';

    constructor Create(Style, AccessToken: String);
  end;

var
  Leaflet: TLeaflet; external name 'L';

function InitializeMap: TJSPromise;

implementation

function InitializeMap: TJSPromise;
begin
  Result := TJSPromise.New(
    procedure(Resolve, Reject: TJSPromiseResolver)
    var
      Script: TJSHTMLScriptElement;

      Link: TJSHTMLLinkElement;

    begin
      Link := TJSHTMLLinkElement(document.createElement('link'));
      Link.HRef := 'https://unpkg.com/leaflet/dist/leaflet.css';
      Link.Rel := 'stylesheet';

      document.head.appendChild(Link);

      Script := TJSHTMLScriptElement(document.createElement('script'));
      Script.OnLoad :=
        function (Event: TEventListenerEvent): Boolean
        begin
          Resolve(True);

          Result := True;
        end;
      Script.src := 'https://unpkg.com/leaflet/dist/leaflet.js';
      Script.type_ := 'text/javascript';

      document.head.appendChild(Script);
    end);
end;

{ TMapOptions }

function TMapOptions.GetCRS: TLeaflet.TCRS;
begin
  if not Assigned(FCRS) then
    FCRS := TLeaflet.TCRS.EPSG3857;

  Result := FCRS;
end;

procedure TMapOptions.SetCRS(Value: TLeaflet.TCRS);
begin
  FCRS := Value;
end;

{ TMapboxLayerOptions }

constructor TMapboxLayerOptions.Create(Style, AccessToken: String);
begin
  inherited Create;

  Attribution := 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>';
  Self.AccessToken := AccessToken;
  Self.Style := Style;
  TileSizeNumber := 512;
  ZoomOffset := -1;
end;

end.

