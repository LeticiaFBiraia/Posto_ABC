unit uClassConexao;

interface

uses FireDAC.Comp.Client, System.SysUtils;

type TConexao = class
  private
    FConexao: TFDConnection;
    FMsgErro: String;

  public
    property Conexao: TFDConnection read FConexao;
    property MsgErro: String read FMsgErro;

    constructor Create (pCaminhoBD: string);
    destructor Destroy; Override;
end;

implementation

{ TConexao }

constructor TConexao.Create(pCaminhoBD: string);
begin
  FConexao := TFDConnection.Create(nil);
  with FConexao do
  begin
    try
      Connected := False;
      Params.Clear;
      Params.Values['DriverID']  := 'FB';
      Params.Values['Server']    := 'localhost';
      Params.Values['Database']  := pCaminhoBD;
      Params.Values['User_name'] := 'sysdba';
      Params.Values['Password']  := 'masterkey';
      Connected := True;
    except on e:Exception do
      begin
        Connected:=False;
        FMsgErro := e.Message;
      end;
    end;
  end;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

end.
