unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    imgLogo: TImage;
    ActionList: TActionList;
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    anques1: TMenuItem;
    Bombas1: TMenuItem;
    Manuteno1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Relatrio1: TMenuItem;
    Abastecimentosdirios1: TMenuItem;
    actTanque: TAction;
    actBombasBicos: TAction;
    actAbastecimentos: TAction;
    actRelAbastecimentos: TAction;
    actSair: TAction;
    Sair1: TMenuItem;
    procedure actTanqueExecute(Sender: TObject);
    procedure actBombasBicosExecute(Sender: TObject);
    procedure actAbastecimentosExecute(Sender: TObject);
    procedure actRelAbastecimentosExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmAbastecimentos, ufrmBombaBico, ufrmRelatorio, ufrmTanque;

procedure TfrmPrincipal.actAbastecimentosExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmAbastecimentos,frmAbastecimentos);
    frmAbastecimentos.ShowModal;
  finally
    FreeAndNil(frmAbastecimentos);
  end;
end;

procedure TfrmPrincipal.actBombasBicosExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmBombasBico,frmBombasBico);
    frmBombasBico.ShowModal;
  finally
    FreeAndNil(frmBombasBico);
  end;
end;

procedure TfrmPrincipal.actRelAbastecimentosExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmRelatorio,frmRelatorio);
    frmRelatorio.ShowModal;
  finally
    FreeAndNil(frmRelatorio);
  end;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.actTanqueExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmTanques,frmTanques);
    frmTanques.ShowModal;
  finally
    FreeAndNil(frmTanques);
  end;
end;

end.
