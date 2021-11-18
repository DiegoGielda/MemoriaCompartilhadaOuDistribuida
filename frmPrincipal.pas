unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,uTNodoChaveamento, System.Generics.Collections,
  uTMensagem, Vcl.Grids, RzGrids;

type
  TformPrincipal = class(TForm)
    btnCriarAmbiente: TButton;
    pageComunicacao: TPageControl;
    paginaConfiguracao: TTabSheet;
    paginaSegunda: TTabSheet;
    edtSource: TLabeledEdit;
    edtTarget: TLabeledEdit;
    pnlNodo: TPanel;
    edtHeader: TLabeledEdit;
    edtTrailer: TLabeledEdit;
    mmPayload: TMemo;
    lblPayload: TLabel;
    mmLogs: TMemo;
    btnEnviar: TButton;
    lblControleLog: TLabel;
    lblTopologiaRede: TLabel;
    cbTopologiaRede: TComboBox;
    edtTamanhoX: TLabeledEdit;
    edtTamanhoY: TLabeledEdit;
    GroupBox1: TGroupBox;
    lblNomeAplicacao: TLabel;
    edtNomeDaAplicacao: TEdit;
    paginaMapeamento: TTabSheet;
    gbAdicionarTarefas: TGroupBox;
    lblNumeroTarefa: TLabel;
    edtNumeroTarefa: TEdit;
    lblNomeTarefa: TLabel;
    edtNomeTarefa: TEdit;
    gridProcessos: TRzStringGrid;
    paginaLog: TTabSheet;
    btnNumeroTarefas: TButton;
    btnTarefa: TButton;
    btnAtribuir1: TButton;
    edtResultadoHops: TEdit;
    lblNomeSource: TLabel;
    edtNomeSource: TEdit;
    lblNomeTarget: TLabel;
    edtNomeTarget: TEdit;
    btnAtribuir2: TButton;
    gridHops: TRzStringGrid;
    procedure btnCriarAmbienteClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure edtTargetChange(Sender: TObject);
    procedure edtSourceKeyPress(Sender: TObject; var Key: Char);
    procedure edtTargetKeyPress(Sender: TObject; var Key: Char);
    procedure mmPayloadExit(Sender: TObject);
    procedure edtTamanhoXKeyPress(Sender: TObject; var Key: Char);
    procedure edtTamanhoYKeyPress(Sender: TObject; var Key: Char);
    procedure btnNumeroTarefasClick(Sender: TObject);
    procedure edtNumeroTarefaKeyPress(Sender: TObject; var Key: Char);
    procedure btnTarefaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtribuir1Click(Sender: TObject);
    procedure edtSourceChange(Sender: TObject);
    procedure edtTamanhoXChange(Sender: TObject);
    procedure btnAtribuir2Click(Sender: TObject);

  strict private
    { Private declarations }
      FListaNodoChaveamento: TObjectList<TNodoChaveamento>;
      FSource: Integer;
      FTarget: Integer;
      FNumeroTarefas: Integer;

      procedure validacaoDeConfiguracao;
      procedure validacaoDados();
      procedure limparDadosDosCampos();
      procedure limparGrid(pGrid: TRzStringGrid);
      procedure verificarHops();
      procedure encontrarCampo(pNome: string; var pColuna, pLinha: Integer);

      function getSource: Integer;
      procedure setSource(const pSource: Integer);
      function getListaNodoChaveamento: TObjectList<TNodoChaveamento>;
      procedure setListaNodoChaveamento(const pListaNodoChaveamento: TObjectList<TNodoChaveamento>);
      function getTarget: Integer;
      procedure setTarget(const pTarget: Integer);

  public
    { Public declarations }
    property ListaNodoChaveamento: TObjectList<TNodoChaveamento> read getListaNodoChaveamento write setListaNodoChaveamento;
    property Source: Integer read getSource write setSource;
    property Target: Integer read getTarget write setTarget;

  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

procedure TformPrincipal.btnAtribuir1Click(Sender: TObject);
var
  lCont, lTamanho, lValorX, lValorY, lInicio, lFim, lDirecao, lBorda: Integer;
begin
  lTamanho := (StrToInt(edtTamanhoX.Text) * StrToInt(edtTamanhoY.Text));
  lValorX := StrToInt(edtTamanhoX.Text);
  lValorY := StrToInt(edtTamanhoY.Text);
  lBorda := 0;
  lInicio := 0;
  lFim := 0;
  lCont := 1;

  while (lCont <= lTamanho) do
  begin
    lFim := lValorX - lBorda;
    for lDirecao := lInicio to lFim -1 do
    begin
      gridProcessos.Cells[lDirecao, lInicio] := ListaNodoChaveamento[lCont - 1].Tarefa;
      Inc(lCont);
    end;
    Inc(lBorda);
    lFim := lValorY - lBorda;
    for lDirecao := lInicio + 1 to lFim do
    begin
      gridProcessos.Cells[lFim, lDirecao] := ListaNodoChaveamento[lCont - 1].Tarefa;
      Inc(lCont);
    end;
    lFim := lValorX - lBorda;
    for lDirecao := lFim - 1  downto lInicio do
    begin
      gridProcessos.Cells[lDirecao, lFim] := ListaNodoChaveamento[lCont -1].Tarefa;
      Inc(lCont);
    end;
    lFim := lValorY - lBorda;
    for lDirecao := lFim - 1 downto lInicio + 1 do
    begin
      gridProcessos.Cells[lInicio, lDirecao] :=  ListaNodoChaveamento[lCont - 1].Tarefa;
      Inc(lCont);
    end;
    lInicio := lInicio + 1;
  end;
end;

procedure TformPrincipal.btnCriarAmbienteClick(Sender: TObject);
var
  lCont, lTamanhoX, lTamanhoY: Integer;
begin
  validacaoDeConfiguracao;
  lTamanhoX := StrToInt(edtTamanhoX.Text);
  lTamanhoY := StrToInt(edtTamanhoY.Text);
  gridProcessos.ColCount := lTamanhoY;
  gridProcessos.RowCount := lTamanhoX;
  gridHops.ColCount := lTamanhoY;
  gridHops.RowCount := lTamanhoX;
  paginaConfiguracao.TabVisible := false;
  ListaNodoChaveamento := TObjectList<TNodoChaveamento>.Create();
  for lCont := 0 to (lTamanhoY * lTamanhoX) do
  begin
    ListaNodoChaveamento.Add(TNodoChaveamento.Create(lCont));
  end;
end;

procedure TformPrincipal.btnEnviarClick(Sender: TObject);
begin
  validacaoDados();
  // Popular fonte e Destino
  Source := StrToInt(edtSource.Text);
  Target := StrToInt(edtTarget.Text);
  // Enviar e Receber
  ListaNodoChaveamento[Source].Mensagem.Create(edtHeader.Text, mmPayload.Text, edtTrailer.Text);
  ListaNodoChaveamento[Source].RoteamentoArbitragem(Target);
  try
    ListaNodoChaveamento[Target].Mensagem := ListaNodoChaveamento[Source].Mensagem;
    mmLogs.Text := ListaNodoChaveamento[Source].Log;
  except
    Showmessage('Erro não identificado reinicie a aplicação!');
  end;
  limparDadosDosCampos();
  limparGrid(gridHops);
  verificarHops();
end;

procedure TformPrincipal.btnNumeroTarefasClick(Sender: TObject);
begin
  if (edtNumeroTarefa.Text = '') then
    raise Exception.Create('É necessário informar o numero de tarefas!');
  edtNomeTarefa.Enabled := True;
  btnTarefa.Enabled := True;
  edtNumeroTarefa.Enabled := False;
  btnNumeroTarefas.Enabled := False;
end;

procedure TformPrincipal.btnTarefaClick(Sender: TObject);
begin
  if (edtNomeTarefa.Text = '') then
    raise Exception.Create('É necessário informar o nome da tarefa!');
  ListaNodoChaveamento[FNumeroTarefas - 1].Tarefa := edtNomeTarefa.Text;
  edtNomeTarefa.Text := '';
  if (StrToInt(edtNumeroTarefa.Text) = FNumeroTarefas) then
  begin
    btnTarefa.Enabled := False;
    edtNomeTarefa.Enabled := False;
    btnAtribuir1.Enabled := True;
    btnAtribuir2.Enabled := True;
  end
  else
  begin
    FNumeroTarefas := FNumeroTarefas + 1;
    lblNomeTarefa.Caption := 'Nome da ' + IntToStr(FNumeroTarefas) + '° tarefa';
    edtNomeTarefa.SetFocus;
  end;
end;

procedure TformPrincipal.btnAtribuir2Click(Sender: TObject);
var
  lCont, lDirecaoColuna, lDirecaolinha, lValorX, lValorY: Integer;
begin
  lValorX := StrToInt(edtTamanhoX.Text);
  lValorY := StrToInt(edtTamanhoY.Text);
  lCont := 0;
  for lDirecaoColuna := 0 to lValorY -1 do
  begin
    for lDirecaolinha := 0 to lValorX -1 do
    begin
      gridProcessos.Cells[lDirecaolinha, lDirecaoColuna] := ListaNodoChaveamento[lCont].Tarefa;
      Inc(lCont);
    end;
  end;
end;

procedure TformPrincipal.edtNumeroTarefaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TformPrincipal.edtSourceChange(Sender: TObject);
var
  lValor: Integer;
begin
 lValor := StrToInt(edtSource.Text);
  edtNomeSource.Text := ListaNodoChaveamento[lValor].Tarefa;
end;

procedure TformPrincipal.edtSourceKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9']) then
    key := #0;
end;

procedure TformPrincipal.edtTamanhoXChange(Sender: TObject);
begin
  edtTamanhoY.Text := edtTamanhoX.Text;
end;

procedure TformPrincipal.edtTamanhoXKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TformPrincipal.edtTamanhoYKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TformPrincipal.edtTargetChange(Sender: TObject);
var
  lValor: Integer;
begin
  lValor := StrToInt(edtTarget.Text);
  edtNomeTarget.Text := ListaNodoChaveamento[lValor].Tarefa;
  edtHeader.Text := edtTarget.Text;
end;

procedure TformPrincipal.edtTargetKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9']) then
    key := #0;
end;

procedure TformPrincipal.encontrarCampo(pNome: string; var pColuna, pLinha: Integer);
var
  lLinha, lColuna: Integer;
begin
  for lLinha := 0 to gridProcessos.RowCount - 1 do
  begin
    for lColuna := 0 to gridProcessos.ColCount - 1 do
    begin
      if(pNome = gridProcessos.Cells[lColuna, lLinha]) then
      begin
        pLinha := lLinha;
        pColuna := lColuna;
      end;
    end;
  end;
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  FNumeroTarefas := 1;
end;

function TformPrincipal.getListaNodoChaveamento: TObjectList<TNodoChaveamento>;
begin
  Result := FListaNodoChaveamento;
end;

function TformPrincipal.getSource: Integer;
begin
  Result := FSource;
end;

function TformPrincipal.getTarget: Integer;
begin
  Result := FTarget;
end;

procedure TformPrincipal.limparDadosDosCampos;
begin
  edtHeader.Text := '';
  edtTrailer.Text := '';
  mmPayload.Text := '';
end;

procedure TformPrincipal.limparGrid(pGrid: TRzStringGrid);
var
  I, J: integer;
begin
    for I := 0 to pGrid.ColCount -1 do
    begin
      for J := 0 to pGrid.RowCount -1 do
      begin
        pGrid.Cells[I,J] := '';
      end;
    end;
end;

procedure TformPrincipal.mmPayloadExit(Sender: TObject);
begin
  btnEnviar.SetFocus;
end;

procedure TformPrincipal.setListaNodoChaveamento(const pListaNodoChaveamento: TObjectList<TNodoChaveamento>);
begin
  FListaNodoChaveamento := pListaNodoChaveamento;
end;

procedure TformPrincipal.setSource(const pSource: Integer);
begin
  FSource := pSource;
end;

procedure TformPrincipal.setTarget(const pTarget: Integer);
begin
  FTarget := pTarget;
end;

procedure TformPrincipal.validacaoDados;
begin
  if (edtSource.Text = '') then
    raise Exception.Create('É necessário a informação para o campo Source');
  if (edtTarget.Text = '') then
    raise Exception.Create('É necessário a informação para o campo Target');
  if (edtHeader.Text = '') then
    raise Exception.Create('É necessário a informação para o campo Header');
  if (edtTrailer.Text = '') then
    raise Exception.Create('É necessário a informação para o campo Trailer');
  if (mmPayload.Text = '') then
    raise Exception.Create('É necessário a informação para o campo Payload');
  if (ListaNodoChaveamento.Count <= (StrToInt(edtTarget.Text))) then
    raise Exception.Create('Nodo de Chaveamento superio ao existente');
end;

procedure TformPrincipal.validacaoDeConfiguracao;
begin
  if not (cbTopologiaRede.ItemIndex >= 0) then
    raise Exception.Create('É necessário informar a Topologia de Rede');
  if (edtTamanhoX.Text = '') then
    raise Exception.Create('É necessário a informação do tamanho de X');
  if (edtTamanhoY.Text = '') then
    raise Exception.Create('É necessário a informação do tamanho de X');
  if (edtNomeDaAplicacao.Text = '') then
    raise Exception.Create('É necessário que a aplicação tenha nome!');
end;

procedure TformPrincipal.verificarHops();
var
  lCont, lContHops, lSourceLinha, lSourceColuna, lTargetLinha, lTargetColuna: Integer;
begin
  lContHops := 0;
  encontrarCampo(edtNomeSource.Text, lSourceColuna, lSourceLinha);
  encontrarCampo(edtNomeTarget.Text, lTargetColuna, lTargetLinha);
  /// Linha
  if(lSourceLinha < lTargetLinha) then
  begin
    for lCont := lSourceLinha to lTargetLinha do
    begin
      Inc(lContHops);
      gridHops.Cells[lSourceLinha, lCont] := IntToStr(lContHops);
    end;
  end
  else
  begin
    for lCont := lSourceLinha downto lTargetLinha  do
    begin
      Inc(lContHops);
      gridHops.Cells[lSourceLinha, lCont] := IntToStr(lContHops);
    end;
  end;
  /// Coluna
  if(lSourceColuna < lTargetColuna) then
  begin
    for lCont := lSourceColuna + 1 to lTargetColuna do
    begin
      Inc(lContHops);
      gridHops.Cells[lCont, lTargetColuna + 1] := IntToStr(lContHops);
    end;
  end
  else
  begin
    for lCont := lSourceColuna - 1 downto lTargetColuna do
    begin
      Inc(lContHops);
      gridHops.Cells[lSourceLinha, lCont] := IntToStr(lContHops);
    end;
  end;
  edtResultadoHops.Text := 'A mensagem (de ' + edtNomeSource.Text + ' para ' + edtNomeTarget.Text + ') percorreu ' +
    IntToStr(lContHops) + ' hops de distância';
end;

end.
