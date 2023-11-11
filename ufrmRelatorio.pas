unit ufrmRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, DateUtils;

type
  TfrmRelatorio = class(TForm)
    GridPanel1: TGridPanel;
    Label1: TLabel;
    Label10: TLabel;
    edtDataIni: TDateTimePicker;
    edtDataFin: TDateTimePicker;
    Panel1: TPanel;
    Panel3: TPanel;
    btnSair: TButton;
    btnGerarAbastecimento: TButton;
    procedure btnGerarAbastecimentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses ufrmRelatorioPrint, udm;

procedure TfrmRelatorio.btnGerarAbastecimentoClick(Sender: TObject);
begin
  dm.qryRelatorio.Close;
  dm.qryRelatorio.ParamByName('DATAINI').AsDate := edtDataIni.Date;
  dm.qryRelatorio.ParamByName('DATAFIN').AsDate := edtDataFin.Date;
  dm.qryRelatorio.Open;

  try
    Application.CreateForm(TfrmRelatorioPrint,frmRelatorioPrint);
    frmRelatorioPrint.relAbastecimentos.Preview();
  finally
    FreeAndNil(frmRelatorioPrint);
  end;
end;

procedure TfrmRelatorio.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  edtDataIni.Date := StrToDate('01/'+IntToStr(MonthOf(Now))+'/'+IntToStr(YearOf(Now)));
  edtDataFin.Date := Now;
end;

end.
