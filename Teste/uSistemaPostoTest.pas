unit uSistemaPostoTest;

interface

uses
  DUnitX.TestFramework, Vcl.Forms, System.SysUtils, ufrmAbastecimentos,
  uClassTanque, udm;

type
  [TestFixture]
  TMyTestObject = class
  public
    gTanque: TTanque;

    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [SetupFixture]
    procedure SetupFixture;
    [TearDownFixture]
    procedure TearDownFixture;

    [Test]
    procedure TestInserirTanque;
    [Test]
    procedure TestAlterarTanque;
    [Test]
    procedure TestExcluirTanque;

    [Test]
    [TestCase('CalcImpostoA','100,13')]
    [TestCase('CalcImpostoB','500,65')]
    [TestCase('CalcImpostoC','62.52,8.1276')]
    procedure TestImposto(const pValor : Double;const pImposto : Double);
  end;

implementation

procedure TMyTestObject.Setup;
begin
end;

procedure TMyTestObject.SetupFixture;
begin
  if not Assigned(dm) then
    Application.CreateForm(Tdm, dm);
end;

procedure TMyTestObject.TearDown;
begin
end;

procedure TMyTestObject.TearDownFixture;
begin
  if Assigned(dm) then
    FreeAndNil(dm);
end;

procedure TMyTestObject.TestInserirTanque;
begin
  gTanque := TTanque.Create(dm.Conexao.Params.Database);
  gTanque.Tanque := 9999;
  gTanque.Combustivel := 0;
  gTanque.Valor := 10.00;
  Assert.IsTrue(gTanque.Inserir, 'Não foi possível inserir o tanque');
  gTanque.Destroy;
end;

procedure TMyTestObject.TestImposto(const pValor : Double;const pImposto : Double);
var vImposto: Double;
begin
  vImposto := frmAbastecimentos.CalculaImposto(pValor);
  Assert.AreEqual(vImposto,pImposto,'Imposto incorreto');
end;

procedure TMyTestObject.TestAlterarTanque;
begin
  gTanque := TTanque.Create(dm.Conexao.Params.Database);
  gTanque.Tanque := 9999;
  gTanque.Combustivel := 0;
  gTanque.Valor := 5.25;
  Assert.IsTrue(gTanque.Alterar, 'Não foi possível alterar o tanque');
  gTanque.Destroy;
end;

procedure TMyTestObject.TestExcluirTanque;
begin
  gTanque := TTanque.Create(dm.Conexao.Params.Database);
  gTanque.Tanque := 9999;
  Assert.IsTrue(gTanque.Excluir, 'Não foi possível excluir o tanque');
  gTanque.Destroy;
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
