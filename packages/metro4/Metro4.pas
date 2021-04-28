unit Metro4;

{$modeswitch externalclass}

interface

uses SysUtils, Web, JS;

type
  TExecutionProcedure = reference to procedure (Element: TJSHTMLElement; Value: JSValue);

  TMetro4Dialog = class;
  TMetro4Toast = class;
  TMetro4Validator = class;

  TMetro4 = class(TJSObject)
  public
    Dialog: TMetro4Dialog; external name 'dialog';
    Toast: TMetro4Toast; external name 'toast';
    Validador: TMetro4Validator; external name 'validator';
  end;

  TMetro4ValidatorResult = class(TJSObject)
  public
    Value: JSValue; external name 'val';
  end;

  TMetro4Validator = class(TJSObject)
  public
    function Validate(Element: TJSHTMLElement): Boolean; external name 'validate'; overload;
    function Validate(Element: TJSHTMLElement; Return: TMetro4ValidatorResult): Boolean; external name 'validate'; overload;
    function Validate(Element: TJSHTMLElement; Return: TMetro4ValidatorResult; ExecutionOk, ExecutionError: TExecutionProcedure): Boolean; external name 'validate'; overload;
    function Validate(Element: TJSHTMLElement; Return: TMetro4ValidatorResult; ExecutionOk, ExecutionError: TExecutionProcedure; RequiredMode: Boolean): Boolean; external name 'validate'; overload;
  end;

  TMetro4Init = class
  public
    UID: string;
  end;
  
  TMetro4Countdown = class
  public
    procedure Pause; external name 'pause';
    procedure Reset; external name 'reset';
    procedure Resume; external name 'resume';
    procedure Start; external name 'start';
    procedure Stop; external name 'stop';
  end;

  TMetro4RibbonMenu = class
  public
    procedure Open(Tab: TJSHTMLElement); external name 'open';
  end;

  TMetro4DataSet = class
  public
    Countdown: TMetro4Countdown; external name 'countdown';
    Dialog: TMetro4Dialog external name 'dialog';
    RibbonMenu: TMetro4RibbonMenu; external name 'ribbonmenu';
    Role: string; external name 'role';
  end;

  TJSMetro4HTMLElement = class(TJSHTMLElement)
    DataSet: TMetro4DataSet; external name '["DATASET:UID:M4Q"]';
  end;

  TJSMetro4EventData = class(TJSObject)
  public
    This: TJSObject; external name '__this';
  end;

  TJSMetro4EventDataTab = class(TJSMetro4EventData)
  public
    Tab: TJSMetro4HTMLElement; external name 'tab';
  end;

  TJSMetro4Event = class(TJSEvent)
  public
    Detail: TJSMetro4EventData; external name 'detail';
  end;

  TJSMetro4ToastOptions = class
  public
    Callback: TProcedure; external name 'callback';
    CustomClassses: String; external name 'clsToast';
    Distance: Integer; external name 'distance';
    ShowTop: Boolean; external name 'showTop';
    TimeOut: Integer; external name 'timeout';
  end;

  TMetro4Toast = class
  public
    procedure Create(const Message: String; Options: TJSMetro4ToastOptions); external name 'create';
  end;

  TMetro4DialogOptions = class;

  TMetro4Dialog = class
  public
    procedure Close(Element: TJSHTMLElement); external name 'close';
    procedure Create(Options: TMetro4DialogOptions); external name 'create';
    procedure IsDialog(Element: TJSHTMLElement); external name 'isDialog';
    procedure IsOpen(Element: TJSHTMLElement); external name 'isOpen';
    procedure Open(Element: TJSHTMLElement); external name 'open'; overload;
    procedure Open(Element, Title: TJSHTMLElement); external name 'open'; overload;
    procedure Open(Element, Content, Title: TJSHTMLElement); external name 'open'; overload;
    procedure Remove(Element: TJSHTMLElement); external name 'remove';
    procedure Toggle(Element: TJSHTMLElement); external name 'toggle';
  end;

  TMetro4DialogOptions = class
  public
    // Tem que criar os fields, complexo a princípios e não serão utilizados nesse momento
  end;

function Find(Selector: JSValue): TMetro4Init; overload; external name '$';
function Find(Selector: JSValue; Context: JSValue): TMetro4Init; overload; external name '$';

procedure Toast(const Message: String); overload;
procedure Toast(const Message: String; Callback: TProcedure); overload;
procedure Toast(const Message: String; Callback: TProcedure; TimeOut: Integer); overload;
procedure Toast(const Message: String; Callback: TProcedure; TimeOut: Integer; CustomClasses: String); overload;
procedure Toast(const Message: String; Options: TJSMetro4ToastOptions); overload;

const
  METRO_TIMEOUT: Integer; external name 'window.METRO_TIMEOUT';

var
  Metro: TMetro4; external name 'Metro';

implementation

procedure Toast(const Message: String);
begin
  Toast(Message, TProcedure(nil));
end;

procedure Toast(const Message: String; Callback: TProcedure);
begin
  Toast(Message, Callback, METRO_TIMEOUT);
end;

procedure Toast(const Message: String; Callback: TProcedure; TimeOut: Integer);
begin
  Toast(Message, Callback, TimeOut, EmptyStr);
end;

procedure Toast(const Message: String; Callback: TProcedure; TimeOut: Integer; CustomClasses: String);
var
  Options: TJSMetro4ToastOptions;

begin
  Options := TJSMetro4ToastOptions.Create;

  Options.Callback := Callback;
  Options.TimeOut := TimeOut;
  Options.CustomClassses := CustomClasses;

  Toast(Message, Options);

  Options.Free;
end;

procedure Toast(const Message: String; Options: TJSMetro4ToastOptions);
begin
  Metro.Toast.Create(Message, Options);
end;

end.

