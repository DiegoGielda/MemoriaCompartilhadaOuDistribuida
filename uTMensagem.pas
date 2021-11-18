unit uTMensagem;

interface

type
  TMensagem = class
  strict private
    FHeader: string;
    FPayLoad: string;
    FTrailer: string;
    function getPayLoad: string;
    procedure setPayLoad(const pPayLoad: string);

  public
    property PayLoad: string read getPayLoad write setPayLoad;
    constructor Create(); overload;
    constructor Create(pHeader, pPayLoad: string; pTrailer: string); overload;
  end;

implementation

{ TMensagem }

constructor TMensagem.Create(pHeader, pPayLoad: string; pTrailer: string);
begin
  FHeader := pHeader;
  FPayLoad := pPayLoad;
  FTrailer := pTrailer;
end;

function TMensagem.getPayLoad: string;
begin
  Result := FPayLoad;
end;

procedure TMensagem.setPayLoad(const pPayLoad: string);
begin
  FPayLoad := pPayLoad;
end;

constructor TMensagem.Create;
begin
 inherited Create();
end;

end.
