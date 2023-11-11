unit ufrmAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmAbastecimentos = class(TForm)
    Panel1: TPanel;
    dsTanque: TDataSource;
    GroupBox1: TGroupBox;
    GridPanel2: TGridPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lkpBomba: TDBLookupComboBox;
    lkpBico: TDBLookupComboBox;
    edtCombustivel: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    edtTotal: TEdit;
    btnGerarAbastecimento: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    btnPesquisar: TButton;
    gridAbastecimentos: TDBGrid;
    GridPanel1: TGridPanel;
    Label1: TLabel;
    lkpPesqBomba: TDBLookupComboBox;
    lkpPesqBico: TDBLookupComboBox;
    Label10: TLabel;
    edtDataIni: TDateTimePicker;
    edtDataFin: TDateTimePicker;
    lkpPesqTanque: TDBLookupComboBox;
    chkTanque: TCheckBox;
    chkBomba: TCheckBox;
    chkBico: TCheckBox;
    dsBomba: TDataSource;
    dsBico: TDataSource;
    dsBombaPesq: TDataSource;
    dsBicoPesq: TDataSource;
    dsAbastecimentos: TDataSource;
    Label2: TLabel;
    edtTanque: TEdit;
    Panel3: TPanel;
    btnSair: TButton;
    procedure btnGerarAbastecimentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure chkTanqueClick(Sender: TObject);
    procedure chkBombaClick(Sender: TObject);
    procedure chkBicoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure lkpBombaClick(Sender: TObject);
    procedure lkpBicoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaAbastecimentos;
    function ValidaCampos: Boolean;
    function CalculaImposto(const pValor: Double): Double;
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

{$R *.dfm}

uses udm;

procedure TfrmAbastecimentos.btnGerarAbastecimentoClick(Sender: TObject);
begin
  if ValidaCampos then
  begin
    try
      dm.Conexao.StartTransaction;
      dm.qryAbastecimentos.Append;
      dm.qryAbastecimentosAB_DATA.AsDateTime := now;
      dm.qryAbastecimentosAB_HORA.AsDateTime := now;
      dm.qryAbastecimentosAB_TANQUE.AsString := edtTanque.Text;
      dm.qryAbastecimentosCOMBUSTIVEL.AsString := edtCombustivel.Text;
      dm.qryAbastecimentosAB_BOMBA.AsInteger := lkpBomba.KeyValue;
      dm.qryAbastecimentosAB_BICO.AsInteger := lkpBico.KeyValue;
      dm.qryAbastecimentosAB_QUANTIDADE.AsFloat := StrToFloat(edtQuantidade.Text);
      dm.qryAbastecimentosAB_VALOR_UNITARIO.AsFloat := StrToFloat(edtValor.Text);
      dm.qryAbastecimentosVALOR_TOTAL.AsFloat := dm.qryAbastecimentosAB_QUANTIDADE.AsFloat * dm.qryAbastecimentosAB_VALOR_UNITARIO.AsFloat;
      dm.qryAbastecimentosAB_IMPOSTO.AsFloat := CalculaImposto(dm.qryAbastecimentosVALOR_TOTAL.AsFloat);
      dm.qryAbastecimentosVALOR_LIQUIDO.AsFloat := dm.qryAbastecimentosVALOR_TOTAL.AsFloat - dm.qryAbastecimentosAB_IMPOSTO.AsFloat;
      dm.qryAbastecimentos.Post;

      if dm.qryAbastecimentos.ApplyUpdates(0) = 0 then
      begin
        dm.Conexao.Commit;
        lkpBomba.KeyValue := null;
        lkpBico.KeyValue := null;
        edtTanque.Text := '';
        edtCombustivel.Text := '';
        edtQuantidade.Text := '';
        edtValor.Text := '';
        edtTotal.Text := '';
      end;
    except
      on E: Exception do
      begin
        dm.Conexao.Rollback;
        ShowMessage('Não foi possível gerar o abastecimento. '+e.Message);
      end;
    end;
  end;
end;

procedure TfrmAbastecimentos.btnPesquisarClick(Sender: TObject);
begin
  CarregaAbastecimentos;
end;

procedure TfrmAbastecimentos.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmAbastecimentos.CalculaImposto(const pValor: Double): Double;
begin
  Result := pValor*0.13;
end;

procedure TfrmAbastecimentos.CarregaAbastecimentos;
var vSQL: String;
begin
  vSQL := 'select a.ab_data, a.ab_hora, a.ab_tanque, a.ab_bomba, '+
          'a.ab_bico, a.ab_quantidade,a.ab_valor_unitario, a.ab_imposto, '+
          '(a.ab_quantidade*a.ab_valor_unitario) valor_total, '+
          '((a.ab_quantidade*a.ab_valor_unitario)-a.ab_imposto) '+
          'valor_liquido, '+
          'case t.tq_combustivel '+
          'when 0 then ''Gasolina'' '+
          'when 1 then ''Óleo Diesel'' '+
          'when 2 then ''Etanol'' '+
          'else ''Não identificado'' '+
          'end as combustivel '+
          'from abastecimentos a '+
          'join tanque t on (t.tq_numero = a.ab_tanque) '+
          'where a.ab_data between :DATAINI and :DATAFIN ';
  if ((chkTanque.Checked) and (lkpPesqTanque.KeyValue > 0)) then
    vSQL := vSQL + ' and a.ab_tanque = '+dm.qryTanqueTQ_NUMERO.AsString;
  if ((chkBomba.Checked) and (lkpPesqBomba.KeyValue > 0)) then
    vSQL := vSQL + ' and a.ab_bomba = '+dm.qryBombaPesqBB_BOMBA.AsString;
  if ((chkBico.Checked) and (lkpPesqBico.KeyValue > 0)) then
    vSQL := vSQL + ' and a.ab_bico = '+dm.qryBicoPesqBB_BICO.AsString;
  vSQL := vSQL + ' order by a.ab_data desc, a.ab_hora desc ';

  dm.qryAbastecimentos.Close;
  dm.qryAbastecimentos.SQL.Text := vSQL;
  dm.qryAbastecimentos.ParamByName('DATAINI').AsDate := edtDataIni.Date;
  dm.qryAbastecimentos.ParamByName('DATAFIN').AsDate := edtDataFin.Date;
  dm.qryAbastecimentos.Open;
end;

procedure TfrmAbastecimentos.chkBicoClick(Sender: TObject);
begin
  lkpPesqBico.Enabled := chkBico.Checked;
end;

procedure TfrmAbastecimentos.chkBombaClick(Sender: TObject);
begin
  lkpPesqBomba.Enabled := chkBomba.Checked;
end;

procedure TfrmAbastecimentos.chkTanqueClick(Sender: TObject);
begin
  lkpPesqTanque.Enabled := chkTanque.Checked;
end;

procedure TfrmAbastecimentos.edtQuantidadeExit(Sender: TObject);
begin
  if Trim(edtQuantidade.Text) <> '' then
  begin
    if StrToFloat(edtQuantidade.Text) > 0 then
    begin
      edtQuantidade.Text := FormatFloat('#,##0.000',StrToFloat(edtQuantidade.Text));
      edtTotal.Text := FormatFloat('#,##0.00',(StrToFloat(edtQuantidade.Text)*StrToFloat(edtValor.Text)));
    end
    else
    begin
      edtQuantidade.Text := '';
      edtTotal.Text := '';
    end;
  end;
end;

procedure TfrmAbastecimentos.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',',','.']) then
    key := #0;
end;

procedure TfrmAbastecimentos.FormCreate(Sender: TObject);
begin
  dm.qryBomba.Close;
  dm.qryBomba.Open;

  dm.qryBico.Close;
  dm.qryBico.ParamByName('BOMBA').AsInteger := 0;
  dm.qryBico.Open;

  dm.qryTanque.Close;
  dm.qryTanque.Open;

  dm.qryBombaPesq.Close;
  dm.qryBombaPesq.Open;

  dm.qryBicoPesq.Close;
  dm.qryBicoPesq.Open;

  chkTanque.Checked := False;
  chkBomba.Checked := False;
  chkBico.Checked := False;

  lkpBico.Enabled := False;
  lkpPesqTanque.Enabled := False;
  lkpPesqBomba.Enabled := False;
  lkpPesqBico.Enabled := False;

  edtDataIni.Date := Now;
  edtDataFin.Date := Now;

  CarregaAbastecimentos;
end;

procedure TfrmAbastecimentos.lkpBicoClick(Sender: TObject);
begin
  if ((lkpBomba.KeyValue > 0) and (lkpBico.KeyValue > 0)) then
  begin
    dm.qryBombaBicoPesq.Close;
    dm.qryBombaBicoPesq.ParamByName('BOMBA').AsInteger := lkpBomba.KeyValue;
    dm.qryBombaBicoPesq.ParamByName('BICO').AsInteger := lkpBico.KeyValue;
    dm.qryBombaBicoPesq.Open;

    if not dm.qryBombaBicoPesq.IsEmpty then
    begin
      edtTanque.Text := FormatFloat('00',dm.qryBombaBicoPesqBB_TANQUE.AsInteger);
      edtCombustivel.Text := dm.qryBombaBicoPesqCOMBUSTIVEL.AsString;
      edtValor.Text := FormatFloat('#,##0.00',dm.qryBombaBicoPesqTQ_VALOR.AsFloat);
    end;
  end
  else
  begin
    edtTanque.Text := '';
    edtCombustivel.Text := '';
    edtValor.Text := '';
  end;
end;

procedure TfrmAbastecimentos.lkpBombaClick(Sender: TObject);
begin
  edtTanque.Text := '';
  edtCombustivel.Text := '';
  edtValor.Text := '';
  lkpBico.KeyValue := null;

  dm.qryBico.Close;
  if lkpBomba.KeyValue > 0 then
    dm.qryBico.ParamByName('BOMBA').AsInteger := lkpBomba.KeyValue
  else
    dm.qryBico.ParamByName('BOMBA').AsInteger := 0;
  dm.qryBico.Open;
  lkpBico.Enabled := lkpBomba.KeyValue > 0;
end;

function TfrmAbastecimentos.ValidaCampos: Boolean;
var vMSG: String;
begin
  Result := True;
  vMSG := '';

  if lkpBomba.KeyValue <= 0 then
  begin
    Result := False;
    vMSG := vMSG+' - O número da bomba é obrigatório. '+sLineBreak;
  end;

  if lkpBico.KeyValue <= 0 then
  begin
    Result := False;
    vMSG := vMSG+' - O número do bico é obrigatório. '+sLineBreak;
  end;

  if StrToFloat(edtQuantidade.Text) <= 0 then
  begin
    Result := False;
    vMSG := vMSG+' - A quantidade é obrigatória. '+sLineBreak;
  end;

  if not result then
  begin
    ShowMessage('Verifique os seguintes campos: '+sLineBreak+vMSG);
  end;
end;

end.
