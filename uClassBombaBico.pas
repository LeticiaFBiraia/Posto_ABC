unit uClassBombaBico;

interface

uses FireDAC.Comp.Client, System.SysUtils, uClassConexao;

type TBombaBico = class
  private
    FConexao: TFDConnection;
    FClassConexao: TConexao;
    FBomba: Integer;
    FBico: Integer;
    FTanque: Integer;
    FMsgErro: String;

    procedure SetBomba(const Value: Integer);
    procedure SetBico(const Value: Integer);
    procedure SetTanque(const Value: Integer);

  public
    property Bomba: Integer read FBomba write SetBomba;
    property Bico: Integer read FBico write SetBico;
    property Tanque: Integer read FTanque write SetTanque;
    property MsgErro: String read FMsgErro;

    constructor Create (pCaminhoBD: string);
    destructor Destroy; Override;

    function Inserir: Boolean;
    function Alterar: Boolean;
    function Excluir: Boolean;
end;


implementation

{ TBombaBico }

function TBombaBico.Alterar: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('update BOMBAS_BICOS set BB_TANQUE = :TANQUE '+
                  'where (BB_BOMBA = :BOMBA) and (BB_BICO = :BICO); ');
      qry.ParamByName('BOMBA').AsInteger := FBomba;
      qry.ParamByName('BICO').AsInteger := FBico;
      qry.ParamByName('TANQUE').AsInteger := FTanque;
      qry.ExecSQL;
    finally
      FConexao.Commit;
      Result := True;
      FreeAndNil(qry);
    end;
  except
    on E:Exception do
    begin
      FConexao.Rollback;
      Result := False;
      FMsgErro := e.Message;
    end;
  end;
end;

constructor TBombaBico.Create(pCaminhoBD: string);
begin
  FClassConexao := TConexao.Create(pCaminhoBD);
  FConexao := FClassConexao.Conexao;
  FMsgErro := FClassConexao.MsgErro;
end;

destructor TBombaBico.Destroy;
begin
  FClassConexao.Destroy;
  inherited;
end;

function TBombaBico.Excluir: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('delete from bombas_bicos where bb_bomba = :BOMBA and bb_bico = :BICO');
      qry.ParamByName('BOMBA').AsInteger := FBomba;
      qry.ParamByName('BICO').AsInteger := FBico;
      qry.ExecSQL;
    finally
      FConexao.Commit;
      Result := True;
      FreeAndNil(qry);
    end;
  except
    on E:Exception do
    begin
      FConexao.Rollback;
      Result := False;
      FMsgErro := e.Message;
    end;
  end;
end;

function TBombaBico.Inserir: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('insert into BOMBAS_BICOS (BB_BOMBA, BB_BICO, BB_TANQUE) '+
                  'values (:BOMBA, :BICO, :TANQUE); ');
      qry.ParamByName('BOMBA').AsInteger := FBomba;
      qry.ParamByName('BICO').AsInteger := FBico;
      qry.ParamByName('TANQUE').AsInteger := FTanque;
      qry.ExecSQL;
    finally
      FConexao.Commit;
      Result := True;
      FreeAndNil(qry);
    end;
  except
    on E:Exception do
    begin
      FConexao.Rollback;
      Result := False;
      FMsgErro := e.Message;
    end;
  end;
end;

procedure TBombaBico.SetBico(const Value: Integer);
begin
  FBico := Value;
end;

procedure TBombaBico.SetBomba(const Value: Integer);
begin
  FBomba := Value;
end;

procedure TBombaBico.SetTanque(const Value: Integer);
begin
  FTanque := Value;
end;

end.
