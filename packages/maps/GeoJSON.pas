unit GeoJSON;

interface

{$modeswitch externalclass}

uses JS;

type
  TBBox = TArray<Double>;
  TPosition = TArray<Double>;

  TGeoJsonObject = class
  private
    function GetForeignMember(name: String): JSValue; external name '[]';

    procedure SetForeignMember(name: String; value: JSValue); external name '[]';
  public
    &type: String;
    bbox: TBBox;

    constructor Create(&type: String);

    property ForeignMember[name: String]: JSValue read GetForeignMember write SetForeignMember; default;
  end;

  TGeometryObject = class(TGeoJsonObject)

  end;

  TPoint = class (TGeometryObject)
  public
    coordinates: TPosition;

    constructor Create;
  end;

  TMultiPoint = class (TGeometryObject)
  public
    coordinates: TArray<TPosition>;
    constructor Create;
  end;

  TLineString = class (TGeometryObject)
  public
    coordinates: TArray<TPosition>;

    constructor Create;
  end;

  TMultiLineString = class (TGeometryObject)
  public
    coordinates: TArray<TArray<TPosition>>;

    constructor Create;
  end;

  TPolygon = class(TGeometryObject)
  public
    coordinates: TArray<TArray<TPosition>>;

    constructor Create;
  end;

  TMultiPolygon = class(TGeometryObject)
  public
    coordinates: TArray<TArray<TArray<TPosition>>>;

    constructor Create;
  end;

  TGeometryCollection = class(TGeoJsonObject)
  public
    geometries: TArray<TGeometryObject>;

    constructor Create;
  end;

  TFeature = class (TGeoJsonObject)
    geometry: TGeometryObject;
    id: String;
    properties: TJSObject;

    constructor Create;
  end;

  TFeatureCollection = class (TGeoJsonObject)
  public
    features: TArray<TGeoJsonObject>;

    constructor Create;
  end;

implementation

{ TGeoJsonObject }

constructor TGeoJsonObject.Create(&type: String);
begin
  Self.&type := &type;
end;

{ TPoint }

constructor TPoint.Create;
begin
  inherited Create('Point');
end;

{ TMultiPoint }

constructor TMultiPoint.Create;
begin
  inherited Create('MultiPoint');
end;

{ TLineString }

constructor TLineString.Create;
begin
  inherited Create('LineString');
end;

{ TMultiLineString }

constructor TMultiLineString.Create;
begin
  inherited Create('MultiLineString');
end;

{ TPolygon }

constructor TPolygon.Create;
begin
  inherited Create('Polygon');
end;

{ TMultiPolygon }

constructor TMultiPolygon.Create;
begin
  inherited Create('MultiPolygon');
end;

{ TGeometryCollection }

constructor TGeometryCollection.Create;
begin
  inherited Create('GeometryCollection');
end;

{ TFeature }

constructor TFeature.Create;
begin
  inherited Create('Feature');
end;

{ TFeatureCollection }

constructor TFeatureCollection.Create;
begin
  inherited Create('FeatureCollection');
end;

end.
