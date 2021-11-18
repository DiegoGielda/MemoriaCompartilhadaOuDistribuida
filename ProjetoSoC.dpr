program ProjetoSoC;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {formPrincipal},
  uTMensagem in 'uTMensagem.pas',
  uTNodoChaveamento in 'uTNodoChaveamento.pas',
  Vcl.Styles,
  Vcl.Themes;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
