unit nodejshttp;

{$mode objfpc}
{$modeswitch externalclass}

interface

uses
  js, nodejs, types;

Type
  TNJSStreamDuplex = class external name 'stream.Duplex' (TJSObject);

  TJSHandleObj = class external name 'Object' (TJSObject);

  TJSNetSocket = class external name 'net.Socket' (TJSObject);

  TNJSNetCallback = reference to procedure(Obj : TJSObject);
  TNJSNetGetConnectionsCallback = reference to procedure(err : TJSObject; count : Integer);
  TNJSNetListenCallBack = reference to procedure(err : TJSObject);

  TJSNetServerOptions = class external name 'Object' (TJSObject)
    port : cardinal;
    host : string;
    path : string;
    backlog : Cardinal;
    exclusive : boolean;
    readableAll : Boolean;
    writableAll : Boolean;
    ipv6only : Boolean;
  end;

  TNJSNetServer = class external name 'net.Server' (TJSObject)
    listening : boolean;
    maxConnections : NativeInt;
    procedure close(Callback : TNJSNetCallback = Nil);
    procedure getConnections(CallBack : TNJSNetGetConnectionsCallback);
    function listen(handle : TJSHandleObj) : TNJSNetServer;
    function listen(handle : TJSHandleObj; BackLog : Cardinal) : TNJSNetServer;
    function listen(handle : TJSHandleObj; BackLog : Cardinal; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    function listen(Options : TJSObject) : TNJSNetServer;
    function listen(Options : TJSObject; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    function listen(Options : TJSNetServerOptions) : TNJSNetServer;
    function listen(Options : TJSNetServerOptions; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    function listen(Port : Cardinal) : TNJSNetServer;
    function listen(Port : Cardinal; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    function listen(Port : Cardinal; Host : string) : TNJSNetServer;
    function listen(Port : Cardinal; Host : string; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    function listen(Port : Cardinal; Host : string; backlog : Cardinal) : TNJSNetServer;
    function listen(Port : Cardinal; Host : string; backlog : Cardinal; ErrCallback : TNJSNetListenCallBack) : TNJSNetServer;
    procedure ref;
    procedure unref;
  end;

  { TNJSHTTPIncomingMessage }

  TNJSHTTPIncomingMessage = class external name 'http.IncomingMessage' (TJSObject)
  private
    FAborted: boolean; external name 'aborted';
    FComplete: boolean; external name 'complete';
    FHeaders: TJSObject; external name 'headers';
    FhttpVersion : String; external name 'httpVersion';
    FMethod : String; external name 'method';
    FrawHeaders : TStringDynArray; external name 'rawHeaders';
    FrawTrailers : TStringDynArray; external name 'rawTrailers';
    Fsocket : TNJSStreamDuplex; external name 'socket';
    FstatusCode : NativeInt; external name 'statusCode';
    FstatusMessage : string; external name 'statusMessage';
    Ftrailers: TJSObject; external name 'trailers';
    FURL : String; external name 'url';
  Public
    procedure destroy;
    procedure destroy(aError : TJSError);
    procedure setTimeout(msecs : NativeInt);
    procedure setTimeout(msecs : NativeInt; callBack : TNJSEventEmitterHandler);
    Property aborted : boolean Read FAborted;
    Property complete : boolean Read FComplete;
    Property headers : TJSObject Read FHeaders;
    property httpVersion : String Read FhttpVersion;
    property method : String Read Fmethod;
    property rawHeaders : TStringDynArray read FrawHeaders;
    property rawTrailers : TStringDynArray read FrawTrailers;
    property socket : TNJSStreamDuplex Read FSocket;
    property statusCode : NativeInt Read FstatusCode;
    property statusMessage : String Read FstatusMessage;
    Property trailers : TJSObject Read FTrailers;
    Property url : String Read FURL;
  end;

  TNJSHTTPClientRequest = class external name 'http.ClientRequest' (TJSObject)
  end;

  TNJSHTTPServerResponse = class external name 'http.ServerResponse' (TJSObject)
  Private
    FHeadersSent : Boolean; external name 'headersSent';
    fSocket : TNJSStreamDuplex; external name 'socket';
    FwritableEnded : Boolean; external name 'writableEnded';
  Public
    sendDate : boolean;
    statusCode : NativeInt;
    statusMessage : string;
    Procedure AddTrailers(Headers : TJSObject);
    Procedure cork;
    function end_ : TNJSHTTPServerResponse; overload; external name 'end';
    function end_(data : String): TNJSHTTPServerResponse; overload;  external name 'end';
    function end_(data,encoding : String): TNJSHTTPServerResponse; overload;  external name 'end';
    function end_(data,encoding : String; Callback : TNJSEventEmitterHandler ) : TNJSHTTPServerResponse; overload;  external name 'end';
    procedure flushHeaders;
    function getHeader(aName : string) : JSValue;
    function getHeaderNames : TStringDynArray;
    function getHeaders : TJSObject;
    function hasHeader(aName : string) : Boolean;
    procedure removeHeader(aName : string);
    procedure setHeader(aName : string; aValue : String); overload;
    procedure setHeader(aName : string; aValue : Nativeint); overload;
    procedure setHeader(aName : string; aValue : TStringDynArray); overload;
    procedure setHeader(aName : string; aValue : TJSArray); overload;
    procedure setHeader(aName : string; aValue : JSValue); overload;
    procedure setTimeOut(mSecs : NativeInt); overload;
    procedure setTimeOut(mSecs : NativeInt; aCallBack : TNJSEventEmitterHandler); overload;
    procedure uncork;
    procedure write(chunk : string);
    procedure write(buffer : TNJSBuffer);
    property headersSent : Boolean read FHeadersSent;
    property socket : TNJSStreamDuplex read fSocket;
    property writableEnded : Boolean read FwritableEnded;
  end;

  TNJSHTTPServer = class external name 'http.Server' (TNJSNetServer)
  end;

  TNJSAgentCreateConnectionCallBack = reference to function (err,stream : TJSObject) : TJSObject;

  TNJSHTTPAgent = class external name 'http.Agent' (TJSObject)

  end;

  TNJSRequestHandler = reference to procedure (Request : TNJSHTTPIncomingMessage; Response : TNJSHTTPServerResponse);
  TNJSGetRequestHandler = reference to procedure (Request :TNJSHTTPIncomingMessage);

  TNJSHTTPServerOptions = Class external name 'Object' (TJSObject)
    IncomingMessage : TNJSHTTPIncomingMessage;
    ServerResponse : TNJSHTTPServerResponse;
    insecureHTTPParser : Boolean;
    maxHeaderSize : NativeInt;
  end;

  TNJSHTTPRequestOptions = Class external name 'Object' (TJSObject)
  Private
    FAgentAsBoolean : Boolean external name 'agent';
  Public
    agent : TNJSHTTPAgent;
    auth : String;
    createConnection : TNJSAgentCreateConnectionCallBack;
    defaultPort : word;
    family : word;
    headers : TJSObject;
    host : string;
    hostname : string;
    insecureHTTPParser : Boolean;
    localAddress : string;
    maxHeaderSize : NativeInt;
    method : String;
    Path : String;
    port : word;
    protocol : string;
    setHost : Boolean;
    socketPath : string;
    timeout : cardinal;
    Property agentAsBoolean : Boolean Read FAgentAsBoolean Write FAgentAsBoolean;
  end;

  TNJSHTTP = class external name 'http' (TJSObject)
  Private
    fmethods : TStringDynArray; external name 'METHODS';
    fstatuscodes : TJSObject; external name 'STATUS_CODES';
    fglobalagent : TNJSHTTPAgent; external name 'globalAgent';
    fmaxHeaderSize : Cardinal; external name 'maxHeaderSize';
  Public
    property METHODS : TStringDynArray read fmethods;
    property STATUS_CODES : TJSObject read fstatuscodes;
    property globalAgent : TNJSHTTPAgent Read fglobalagent;
    property maxHeaderSize : Cardinal read FmaxHeaderSize;
    function createServer(options : TNJSHTTPServerOptions; Listener : TNJSRequestHandler = Nil) : TNJSHTTPServer;
    function createServer(options : TJSObject; Listener : TNJSRequestHandler = Nil) : TNJSHTTPServer;
    function createServer(Listener : TNJSRequestHandler = Nil) : TNJSHTTPServer;
    function get(options: TNJSHTTPRequestOptions; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
    function get(options: TJSObject; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
    function get(URL : string; options: TJSObject; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
    function get(URL : string; options: TNJSHTTPRequestOptions; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
    function request(options: TJSObject; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
    function request(URL : string; options: TNJSHTTPRequestOptions; aCallBack : TNJSGetRequestHandler = nil) : TNJSHTTPIncomingMessage;
  end;

var
  http : TNJSHTTP;

implementation

initialization
  http:=TNJSHTTP(require('http'));
end.

