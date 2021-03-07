unit PV.Classe.Controller.Produto;

interface

uses
  PV.Classe.IData, PV.Classe.Produto, PV.Classe.IConnection, System.SysUtils;

type

  TProdutoController = class(TInterfacedObject, IData)
  private
    fProduto: TProduto;
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
    property Produto: TProduto read fProduto;
  end;




implementation



{ TProdutoController }

function TProdutoController.Atualizar: IData;
begin
  Result := self;
end;

function TProdutoController.Consultar(AValue: string): IData;
begin
  Try
    Result := self;
    fConnection.SQL.Clear;
    fConnection.SQL.Add('SELECT * FROM PRODUTOS WHERE');
    fConnection.SQL.Add('CODIGO =  '  +AValue);
    fConnection.OpenSQL;

    fProduto
      .SetCodigo(fConnection.DataSet.FieldByName('CODIGO').AsString)
      .SetDescricao(fConnection.DataSet.FieldByName('DESCRICAO').AsString)
      .SetPrecoVenda(fConnection.DataSet.FieldByName('PRECO_VENDA').AsCurrency);
  finally

  End;
end;

constructor TProdutoController.Create;
begin
  inherited;
  fProduto := TProduto.Create;
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(fProduto);
  inherited;
end;

function TProdutoController.Excluir: IData;
begin
  Result := self;
end;

function TProdutoController.GetConnection: IConnection;
begin
  result := fConnection;
end;

function TProdutoController.Inserir: IData;
begin
  Result := self;
end;

function TProdutoController.SetConnection(Connection: IConnection): IData;
begin
  fConnection := Connection;
  Result := self;
end;

end.

