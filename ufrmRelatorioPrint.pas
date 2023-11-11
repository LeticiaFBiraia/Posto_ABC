unit ufrmRelatorioPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TfrmRelatorioPrint = class(TForm)
    relAbastecimentos: TRLReport;
    RLBand1: TRLBand;
    footerAbastecimentos: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup1: TRLGroup;
    colHeaderAbastecimentos: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    detailAbastecimentos: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    colFooterAbastecimentos: TRLBand;
    RLDBResult1: TRLDBResult;
    headerAbastecimentos: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    colFooterTotAbastecimentos: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPrint: TfrmRelatorioPrint;

implementation

{$R *.dfm}

uses udm;

end.
