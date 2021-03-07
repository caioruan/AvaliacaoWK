unit PV.Classe.Controller.Cliente;

interface

uses
  PV.Classe.IData, PV.Classe.Cliente, PV.Classe.IConnection, System.SysUtils;

type

  TClienteController = class(TInterfacedObject, IData)
  private
    fCliente: TCliente;
    fConnection: IConnection;
  public
    constructor Create;
    function Atualizar: IData;
    function Consultar(AValue: string): IData;
    function Excluir: IData;
    function GetConnection: IConnection;
    function Inserir: IData;
    function SetConnection(Connection: IConnection): IData;
    destructor Destroy; override;
    property Cliente: TCliente read fCliente;
  end;




implementation



{ TClienteController }

function TClienteController.Atualizar: IData;
begin
  Result := self;
end;

function TClienteController.Consultar(AValue: string): IData;
begin
  Try
    Result := self;
    fConnection.SQL.Clear;
    fConnection.SQL.Add('SELECT * FROM CLIENTES WHERE');
    fConnection.SQL.Add('CODIGO =  '  +AValue);
    fConnection.OpenSQL;

    fCliente
      .SetCodigo(fConnection.DataSet.FieldByName('CODIGO').AsString)
      .SetNome(fConnection.DataSet.FieldByName('NOME').AsString)
      .SetCidade(fConnection.DataSet.FieldByName('CIDADE').AsString)
      .SetUF(fConnection.DataSet.FieldByName('UF').AsString);
  finally

  End;
end;

constructor TClienteController.Create;
begin
  inherited;
  fCliente := TCliente.Create;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(fCliente);
  inherited;
end;

function TClienteController.Excluir: IData;
begin
  Result := self;
end;

function TClienteController.GetConnection: IConnection;
begin
  result := fConnection;
end;


function TClienteController.Inserir: IData;
begin
  Result := self;
end;

function TClienteController.SetConnection(Connection: IConnection): IData;
begin
  fConnection := Connection;
  Result := self;
end;

end.
