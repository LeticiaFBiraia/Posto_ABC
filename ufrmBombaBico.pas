unit ufrmBombaBico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,FireDAC.Comp.Client,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmBombasBico = class(TForm)
    GridPanel1: TGridPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    gridBombaBico: TDBGrid;
    Panel2: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dsBombaBico: TDataSource;
    dsTanque: TDataSource;
    edtBomba: TEdit;
    edtBico: TEdit;
    lkpTanque: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtBombaExit(Sender: TObject);
    procedure edtBicoExit(Sender: TObject);
    procedure edtBombaKeyPress(Sender: TObject; var Key: Char);
    procedure edtBicoKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure gridBombaBicoTitleClick(Column: TColumn);
    procedure dsBombaBicoDataChange(Sender: TObject; Field: TField);
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
  frmBombasBico: TfrmBombasBico;

implementation

{$R *.dfm}

uses udm, uClassBombaBico;

procedure TfrmBombasBico.Atualizar;
begin
  with dm.qryBombaBico do
  begin
    close;
    open;
  end;
end;

procedure TfrmBombasBico.btnAlterarClick(Sender: TObject);
begin
  gOperacao := 'A';

  HabilitaBotoes(False);
  HabilitaCampos(True);
end;

procedure TfrmBombasBico.btnCancelarClick(Sender: TObject);
begin
  dm.qryBombaBico.First;
  HabilitaBotoes(True);
  HabilitaCampos(False);
end;

procedure TfrmBombasBico.btnExcluirClick(Sender: TObject);
var vBombaBico: TBombaBico;
begin
  if Application.MessageBox(pChar('Tem certeza que deseja excluir o bico '+edtBico.Text+
    ' da bomba '+edtBomba.Text+'?'),'Atenção!',MB_ICONQUESTION+MB_YESNO) = IDYES then
  begin
    try
      vBombaBico := TBombaBico.Create(dm.Conexao.Params.Database);
      vBombaBico.Bomba := StrToInt(edtBomba.Text);
      vBombaBico.Bico := StrToInt(edtBico.Text);
      if not vBombaBico.Excluir then
        ShowMessage('Não foi possível excluir a bomba e o bico. '+vBombaBico.MsgErro);
    finally
      vBombaBico.Destroy;
    end;

    Atualizar;
  end;
end;

procedure TfrmBombasBico.btnInserirClick(Sender: TObject);
begin
  gOperacao := 'I';

  edtBomba.Text := '';
  edtBico.Text := '';
  lkpTanque.KeyValue := null;

  HabilitaBotoes(False);
  HabilitaCampos(True);
end;

procedure TfrmBombasBico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBombasBico.btnSalvarClick(Sender: TObject);
var IDLocateBomba,IDLocateBico: Integer;
    vBombaBico: TBombaBico;
begin
  if ValidaCampos then
  begin
    IDLocateBomba := StrToInt(edtBomba.Text);
    IDLocateBico := StrToInt(edtBico.Text);

    try
      vBombaBico := TBombaBico.Create(dm.Conexao.Params.Database);
      vBombaBico.Bomba := StrToInt(edtBomba.Text);
      vBombaBico.Bico := StrToInt(edtBico.Text);
      vBombaBico.Tanque := lkpTanque.KeyValue;
      if gOperacao = 'I' then
      begin
        if not vBombaBico.Inserir then
          ShowMessage('Não foi possível inserir a bomba e o bico. '+vBombaBico.MsgErro);
      end
      else
      begin
        if not vBombaBico.Alterar then
          ShowMessage('Não foi possível alterar a bomba e o bico. '+vBombaBico.MsgErro);
      end;
    finally
      vBombaBico.Destroy;
    end;

    Atualizar;
    dm.qryBombaBico.Locate('BB_BOMBA;BB_BICO',VarArrayOf([IDLocateBomba,IDLocateBico]),[]);

    HabilitaBotoes(True);
    HabilitaCampos(False);
  end;
end;

procedure TfrmBombasBico.dsBombaBicoDataChange(Sender: TObject; Field: TField);
begin
  if dm.qryTanque.IsEmpty then
  begin
    edtBomba.Text := '00';
    edtBico.Text := '00';
    lkpTanque.KeyValue := null;
  end
  else
  begin
    edtBomba.Text := FormatFloat('00',dm.qryBombaBicoBB_BOMBA.AsInteger);
    edtBico.Text := FormatFloat('00',dm.qryBombaBicoBB_BICO.AsInteger);
    lkpTanque.KeyValue := dm.qryBombaBicoBB_TANQUE.AsInteger;
  end;
end;

procedure TfrmBombasBico.edtBicoExit(Sender: TObject);
begin
  if Trim(edtBico.Text) <> '' then
    if StrToInt(edtBico.Text) > 0 then
      edtBico.Text := FormatFloat('00',StrToInt(edtBico.Text));
end;

procedure TfrmBombasBico.edtBicoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TfrmBombasBico.edtBombaExit(Sender: TObject);
begin
  if Trim(edtBomba.Text) <> '' then
    if StrToInt(edtBomba.Text) > 0 then
      edtBomba.Text := FormatFloat('00',StrToInt(edtBomba.Text));
end;

procedure TfrmBombasBico.edtBombaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TfrmBombasBico.FormCreate(Sender: TObject);
begin
  //Abrindo query do lookup
  with dm.qryTanque do
  begin
    close;
    open;
  end;

  Atualizar;
  HabilitaBotoes(True);
  HabilitaCampos(False);
end;

procedure TfrmBombasBico.gridBombaBicoTitleClick(Column: TColumn);
begin
  dm.qryBombaBico.IndexFieldNames := Column.FieldName;
end;

procedure TfrmBombasBico.HabilitaBotoes(Habilita: Boolean);
begin
  btnInserir.Enabled := Habilita;
  btnAlterar.Enabled := Habilita and (not dm.qryBombaBico.IsEmpty);
  btnExcluir.Enabled := Habilita and (not dm.qryBombaBico.IsEmpty);
  btnCancelar.Enabled := not Habilita;
  btnSalvar.Enabled := not Habilita;
end;

procedure TfrmBombasBico.HabilitaCampos(Habilita: Boolean);
begin
  edtBomba.Enabled := Habilita and (gOperacao = 'I');
  edtBico.Enabled := Habilita and (gOperacao = 'I');
  lkpTanque.Enabled := Habilita;
end;

function TfrmBombasBico.ValidaCampos: Boolean;
var vMSG: String;
    qry: TFDQuery;
begin
  Result := True;
  vMSG := '';
  if ((StrToInt(edtBomba.Text) > 0) and (StrToInt(edtBico.Text) > 0)) then
  begin
    if gOperacao = 'I' then
    begin
      try
        qry := TFDQuery.Create(nil);
        qry.Connection := dm.Conexao;
        qry.close;
        qry.sql.clear;
        qry.sql.add('select b.bb_bomba, b.bb_bico from bombas_bicos b '+
                    'where b.bb_bomba = :BOMBA and b.bb_bico = :BICO ');
        qry.ParamByName('BOMBA').AsInteger := StrToInt(edtBomba.Text);
        qry.ParamByName('BICO').AsInteger := StrToInt(edtBico.Text);
        qry.Open;

        if qry.RecordCount > 0 then
        begin
          Result := False;
          vMSG := vMSG+' - O bico '+edtBico.Text+' da bomba '+edtBomba.Text+' já está cadastrado. '+sLineBreak;
        end;

      finally
        FreeAndNil(qry);
      end;
    end;
  end
  else
  begin
    Result := False;
    if StrToInt(edtBomba.Text) <= 0 then
      vMSG := vMSG+' - O número da bomba é obrigatório. '+sLineBreak;
    if StrToInt(edtBico.Text) <= 0 then
      vMSG := vMSG+' - O número do bico é obrigatório. '+sLineBreak;
  end;

  if lkpTanque.KeyValue <= 0 then
  begin
    Result := False;
    vMSG := vMSG+' - O número do tanque é obrigatório. '+sLineBreak;
  end;

  if not result then
  begin
    ShowMessage('Verifique os seguintes campos: '+sLineBreak+vMSG);
  end;
end;

end.
