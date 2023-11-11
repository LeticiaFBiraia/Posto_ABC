program SistemaPosto;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  ufrmTanque in 'ufrmTanque.pas' {frmTanques},
  ufrmBombaBico in 'ufrmBombaBico.pas' {frmBombasBico},
  ufrmAbastecimentos in 'ufrmAbastecimentos.pas' {frmAbastecimentos},
  ufrmRelatorio in 'ufrmRelatorio.pas' {frmRelatorio},
  ufrmRelatorioPrint in 'ufrmRelatorioPrint.pas' {frmRelatorioPrint},
  udm in 'udm.pas' {dm: TDataModule},
  uClassTanque in 'uClassTanque.pas',
  uClassBombaBico in 'uClassBombaBico.pas',
  uClassConexao in 'uClassConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
