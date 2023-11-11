unit udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    qryTanque: TFDQuery;
    qryTanqueTQ_NUMERO: TSmallintField;
    qryTanqueTQ_COMBUSTIVEL: TSmallintField;
    qryTanqueTQ_VALOR: TFMTBCDField;
    qryTanqueCOMBUSTIVEL: TStringField;
    qryBombaBico: TFDQuery;
    qryBombaBicoBB_BOMBA: TSmallintField;
    qryBombaBicoBB_BICO: TSmallintField;
    qryBombaBicoBB_TANQUE: TSmallintField;
    qryBombaBicoCOMBUSTIVEL: TStringField;
    qryBomba: TFDQuery;
    qryBico: TFDQuery;
    qryBombaPesq: TFDQuery;
    qryBicoPesq: TFDQuery;
    qryAbastecimentos: TFDQuery;
    dsRelatorio: TDataSource;
    qryBombaBB_BOMBA: TSmallintField;
    qryBicoBB_BICO: TSmallintField;
    qryBombaPesqBB_BOMBA: TSmallintField;
    qryBicoPesqBB_BICO: TSmallintField;
    qryBombaBicoPesq: TFDQuery;
    qryBombaBicoPesqBB_TANQUE: TSmallintField;
    qryBombaBicoPesqTQ_VALOR: TFMTBCDField;
    qryBombaBicoPesqCOMBUSTIVEL: TStringField;
    qryAbastecimentosAB_DATA: TDateField;
    qryAbastecimentosAB_HORA: TTimeField;
    qryAbastecimentosAB_TANQUE: TSmallintField;
    qryAbastecimentosAB_BOMBA: TSmallintField;
    qryAbastecimentosAB_BICO: TSmallintField;
    qryAbastecimentosAB_QUANTIDADE: TFMTBCDField;
    qryAbastecimentosAB_VALOR_UNITARIO: TFMTBCDField;
    qryAbastecimentosAB_IMPOSTO: TFMTBCDField;
    qryAbastecimentosVALOR_TOTAL: TFMTBCDField;
    qryAbastecimentosVALOR_LIQUIDO: TFMTBCDField;
    qryAbastecimentosCOMBUSTIVEL: TStringField;
    qryRelatorio: TFDQuery;
    conexao: TFDConnection;
    qryRelatorioAB_DATA: TDateField;
    qryRelatorioAB_TANQUE: TSmallintField;
    qryRelatorioAB_BOMBA: TSmallintField;
    qryRelatorioAB_BICO: TSmallintField;
    qryRelatorioVALOR_TOTAL: TSingleField;
    qryRelatorioCOMBUSTIVEL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
