unit uTNodoChaveamento;

interface

uses
  uTMensagem, System.SysUtils;

type
  TNodoChaveamento = class
  strict private
    FID: Integer;
    FMensagem: TMensagem;
    FLog: string;
    FTarefa: string;

    procedure ArmazenarMensagem(const pMensagem: TMensagem);
    function RetornarMensagem: TMensagem;
    function getTarefa: string;
    procedure setTarefa(const pTarefa: string);

  public
    property Log: string read FLog write FLog;
    property Tarefa: string read getTarefa write setTarefa;
    property Mensagem: TMensagem read retornarMensagem write armazenarMensagem;
    procedure RoteamentoArbitragem(pTarget: Integer);

    constructor Create(pID: Integer);
  end;

implementation

{ TNodoChaveamento }
constructor TNodoChaveamento.Create(pID: Integer);
begin
  FID := pID;
  FMensagem := TMensagem.Create();
  FTarefa := '';
  FLog := '';
end;

function TNodoChaveamento.getTarefa: string;
begin
  Result := FTarefa;
end;

procedure TNodoChaveamento.armazenarMensagem(const pMensagem: TMensagem);
begin
  FMensagem := pMensagem;
end;

function TNodoChaveamento.retornarMensagem: TMensagem;
begin
  Result := FMensagem;
end;

procedure TNodoChaveamento.RoteamentoArbitragem(pTarget: Integer);
var
  lValor: Integer;
begin
  lValor := FID;
  while lValor <> pTarget - 1 do
  begin
    if (pTarget < lValor) then
    begin
      Log := Log + 'Nodo ' + IntToStr(lValor) + ' envia mensagem para nodo ' + IntToStr(lValor - 1) + #13#10;
      Dec(lValor);
    end
    else if (pTarget > lValor) then
    begin
      Log := Log + 'Nodo ' + IntToStr(lValor) + ' envia mensagem para nodo ' + IntToStr(lValor + 1) + #13#10;
      Inc(lValor);
    end;
  end;
  Log := Log + 'Mensagem solicitada do nodo ' + IntToStr(FID);
  Log := Log + ' sendo processado... atravez do nodo ' + IntToStr(pTarget) + ' a mensagem: '+ Mensagem.PayLoad +
    ' executando ...  ... concluído.' + #13#10 + #13#10;
end;

procedure TNodoChaveamento.setTarefa(const pTarefa: string);
begin
  FTarefa := pTarefa;
end;

end.
