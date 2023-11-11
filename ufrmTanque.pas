unit ufrmTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.NumberBox, FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmTanques = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    gridTanque: TDBGrid;
    Panel2: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    cmbCombustivel: TComboBox;
    Label3: TLabel;
    dsTanque: TDataSource;
    edtTanque: TEdit;
    edtValor: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridTanqueTitleClick(Column: TColumn);
    procedure dsTanqueDataChange(Sender: TObject; Field: TField);
    procedure edtTanqueKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtTanqueExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    gOperacao: Char; //I-Incluir;A-Alterar;
  public
    { Public declarations }
    procedure HabilitaBotoes(Habilita: Boolean);
    procedure HabilitaCampos(Habilita: Boolean);
    procedure Atualizar;
    function ValidaCampos: Boolean;
  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

uses udm, uClassTanque;

procedure TfrmTanques.Atualizar;
begin
  with dm.qryTanque do
  begin
    close;
    open;
  end;
end;

procedure TfrmTanques.btnAlterarClick(Sender: TObject);
begin
  gOperacao := 'A';

  HabilitaBotoes(False);
  HabilitaCampos(True);
end;

procedure TfrmTanques.btnCancelarClick(Sender: TObject);
begin
  dm.qryTanque.First;
  HabilitaBotoes(True);
  HabilitaCampos(False);
end;

procedure TfrmTanques.btnExcluirClick(Sender: TObject);
var vTanque: TTanque;
begin
  if Application.MessageBox(pChar('Tem certeza que deseja excluir o tanque '+edtTanque.Text+'?'),
    'Atenção!',MB_ICONQUESTION+MB_YESNO) = IDYES then
  begin
    try
      vTanque := TTanque.Create(dm.Conexao.Params.Database);
      vTanque.Tanque := StrToInt(edtTanque.Text);
      if not vTanque.Excluir then
        ShowMessage('Não foi possível excluir o tanque. '+vTanque.MsgErro);
    finally
      vTanque.Destroy;
    end;

    Atualizar;
  end;
end;

procedure TfrmTanques.btnInserirClick(Sender: TObject);
begin
  gOperacao := 'I';

  edtTanque.Text := '';
  cmbCombustivel.ItemIndex := -1;
  edtValor.Text := '';

  HabilitaBotoes(False);
  HabilitaCampos(True);
end;

procedure TfrmTanques.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanques.btnSalvarClick(Sender: TObject);
var IDLocate: Integer;
    vTanque: TTanque;
begin
  if ValidaCampos then
  begin
    IDLocate := StrToInt(edtTanque.Text);

    try
      vTanque := TTanque.Create(dm.Conexao.Params.Database);
      vTanque.Tanque := StrToInt(edtTanque.Text);
      vTanque.Combustivel := cmbCombustivel.ItemIndex;
      vTanque.Valor := StrToFloat(edtValor.Text);
      if gOperacao = 'I' then
      begin
        if not vTanque.Inserir then
          ShowMessage('Não foi possível inserir o tanque. '+vTanque.MsgErro);
      end
      else
      begin
        if not vTanque.Alterar then
          ShowMessage('Não foi possível alterar o tanque. '+vTanque.MsgErro);
      end;
    finally
      vTanque.Destroy;
    end;

    Atualizar;
    dm.qryTanque.Locate('TQ_NUMERO',IDLocate,[]);

    HabilitaBotoes(True);
    HabilitaCampos(False);
  end;
end;

procedure TfrmTanques.dsTanqueDataChange(Sender: TObject; Field: TField);
begin
  if dm.qryTanque.IsEmpty then
  begin
    edtTanque.Text := '00';
    cmbCombustivel.ItemIndex := -1;
    edtValor.Text := '0.00';
  end
  else
  begin
    edtTanque.Text := FormatFloat('00',dm.qryTanqueTQ_NUMERO.AsInteger);
    cmbCombustivel.ItemIndex := dm.qryTanqueTQ_COMBUSTIVEL.AsInteger;
    edtValor.Text := FormatFloat('#,##0.00',dm.qryTanqueTQ_VALOR.AsFloat);
  end;
end;

procedure TfrmTanques.edtTanqueExit(Sender: TObject);
begin
  if Trim(edtTanque.Text) <> '' then
    if StrToInt(edtTanque.Text) > 0 then
      edtTanque.Text := FormatFloat('00',StrToInt(edtTanque.Text));
end;

procedure TfrmTanques.edtTanqueKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TfrmTanques.edtValorExit(Sender: TObject);
begin
  if Trim(edtValor.Text) <> '' then
    if StrToFloat(edtValor.Text) > 0 then
      edtValor.Text := FormatFloat('#,##0.00',StrToFloat(edtValor.Text));
end;

procedure TfrmTanques.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',','.']) then
    key := #0;
end;

procedure TfrmTanques.gridTanqueTitleClick(Column: TColumn);
begin
  dm.qryTanque.IndexFieldNames := Column.FieldName;
end;

procedure TfrmTanques.FormCreate(Sender: TObject);
begin
  Atualizar;
  HabilitaBotoes(True);
  HabilitaCampos(False);
end;

procedure TfrmTanques.HabilitaBotoes(Habilita: Boolean);
begin
  btnInserir.Enabled := Habilita;
  btnAlterar.Enabled := Habilita and (not dm.qryTanque.IsEmpty);
  btnExcluir.Enabled := Habilita and (not dm.qryTanque.IsEmpty);
  btnCancelar.Enabled := not Habilita;
  btnSalvar.Enabled := not Habilita;
end;

procedure TfrmTanques.HabilitaCampos(Habilita: Boolean);
begin
  edtTanque.Enabled := Habilita and (gOperacao = 'I');
  cmbCombustivel.Enabled := Habilita;
  edtValor.Enabled := Habilita;
end;

function TfrmTanques.ValidaCampos: Boolean;
var vMSG: String;
    qry: TFDQuery;
begin
  Result := True;
  vMSG := '';
  if StrToInt(edtTanque.Text) > 0 then
  begin
    if gOperacao = 'I' then
    begin
      try
        qry := TFDQuery.Create(nil);
        qry.Connection := dm.Conexao;
        qry.close;
        qry.sql.clear;
        qry.sql.add('select t.tq_numero from tanque t where t.tq_numero = :NUMERO');
        qry.ParamByName('NUMERO').AsInteger := StrToInt(edtTanque.Text);
        qry.Open;

        if qry.RecordCount > 0 then
        begin
          Result := False;
          vMSG := vMSG+' - O tanque número '+edtTanque.Text+' já está cadastrado. '+sLineBreak;
        end;

      finally
        FreeAndNil(qry);
      end;
    end;
  end
  else
  begin
    Result := False;
    vMSG := vMSG+' - O número do tanque é obrigatório. '+sLineBreak;
  end;

  if cmbCombustivel.ItemIndex < 0 then
  begin
    Result := False;
    vMSG := vMSG+' - O combustível do tanque é obrigatório. '+sLineBreak;
  end;

  if not result then
  begin
    ShowMessage('Verifique os seguintes campos: '+sLineBreak+vMSG);
  end;
end;

end.
