unit uClassTanque;

interface

uses FireDAC.Comp.Client, System.SysUtils, uClassConexao;

type TTanque = class
  private
    FConexao: TFDConnection;
    FClassConexao: TConexao;
    FTanque: Integer;
    FCombustivel: Integer;
    FValor: Double;
    FMsgErro: String;

    procedure SetTanque(const Value: Integer);
    procedure SetCombustivel(const Value: Integer);
    procedure SetValor(const Value: Double);

  public
    property Tanque: Integer read FTanque write SetTanque;
    property Combustivel: Integer read FCombustivel write SetCombustivel;
    property Valor: Double read FValor write SetValor;
    property MsgErro: String read FMsgErro;

    constructor Create (pCaminhoBD: string);
    destructor Destroy; Override;

    function Inserir: Boolean;
    function Alterar: Boolean;
    function Excluir: Boolean;
end;


implementation

{ TTanque }

function TTanque.Alterar: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('update TANQUE set TQ_COMBUSTIVEL = :COMBUSTIVEL, TQ_VALOR = :VALOR '+
                  'where (TQ_NUMERO = :NUMERO); ');
      qry.ParamByName('NUMERO').AsInteger := FTanque;
      qry.ParamByName('COMBUSTIVEL').AsInteger := FCombustivel;
      qry.ParamByName('VALOR').AsFloat := FValor;
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

constructor TTanque.Create(pCaminhoBD: string);
begin
  FClassConexao := TConexao.Create(pCaminhoBD);
  FConexao := FClassConexao.Conexao;
  FMsgErro := FClassConexao.MsgErro;
end;

destructor TTanque.Destroy;
begin
  FClassConexao.Destroy;
  inherited;
end;

function TTanque.Excluir: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('delete from tanque where tq_numero = :NUMERO');
      qry.ParamByName('NUMERO').AsInteger := FTanque;
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

function TTanque.Inserir: Boolean;
var qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConexao;
      FConexao.StartTransaction;
      qry.close;
      qry.sql.clear;
      qry.sql.add('insert into TANQUE (TQ_NUMERO, TQ_COMBUSTIVEL, TQ_VALOR) '+
                  'values (:NUMERO, :COMBUSTIVEL, :VALOR);');
      qry.ParamByName('NUMERO').AsInteger := FTanque;
      qry.ParamByName('COMBUSTIVEL').AsInteger := FCombustivel;
      qry.ParamByName('VALOR').AsFloat := FValor;
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

procedure TTanque.SetCombustivel(const Value: Integer);
begin
  FCombustivel := Value;
end;

procedure TTanque.SetTanque(const Value: Integer);
begin
  FTanque := Value;
end;

procedure TTanque.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
