unit PV.Classe.Controller.Venda;

interface

uses
  PV.Classe.IData, PV.Classe.Venda, PV.Classe.IConnection, System.StrUtils, System.SysUtils;

type

  TVendaController = Class(TInterfacedObject, IData)
  private
    fVenda: TVenda;
    fConnection: IConnection;
    function SQLVendaItem(Item: TVendaItem): String;
    function SQLVenda: String;
  public
    constructor Create;

    function Atualizar: IData;
    function Consultar(AValue: string): IData;
    function Excluir: IData;
    function GetConnection: IConnection;
    function Inserir: IData;
    function SetConnection(Connection: IConnection): IData;
    destructor Destroy; override;
    property Venda: TVenda read fVenda;
  End;

implementation

{ TVendaController }

function TVendaController.Atualizar: IData;
begin
  Result := self;
end;

function TVendaController.Consultar(AValue: string): IData;
begin
  Result := self;
  fConnection.SQL.Clear;
  fConnection.SQL.Add('SELECT V.*,C.NOME FROM VENDA V JOIN CLIENTES C ON C.CODIGO = V.CLIENTE WHERE');
  fConnection.SQL.Add('V.CODIGO =  '  +AValue);
  fConnection.OpenSQL;

  fVenda
    .SetCodigo(fConnection.DataSet.FieldByName('CODIGO').AsInteger)
    .SetCliente(fConnection.DataSet.FieldByName('CLIENTE').AsString)
    .SetNome(fConnection.DataSet.FieldByName('NOME').AsString)
    .SetEmissao(fConnection.DataSet.FieldByName('EMISSAO').AsDateTime);

  fConnection.SQL.Clear;
  fConnection.SQL.Add('SELECT VI.*,P.DESCRICAO FROM VENDAITEM VI JOIN PRODUTOS P ON P.CODIGO = VI.PRODUTO WHERE');
  fConnection.SQL.Add('VI.VENDA =  '  +AValue);
  fConnection.OpenSQL;

  while Not fConnection.DataSet.Eof do
  Begin
    fVenda
      .NewItem
      .SetCodigo(fConnection.DataSet.FieldByName('CODIGO').AsInteger)
      .SetProduto(fConnection.DataSet.FieldByName('PRODUTO').AsInteger)
      .SetDescricao(fConnection.DataSet.FieldByName('descricao').AsString)
      .Setquantidade(fConnection.DataSet.FieldByName('quantidade').AsCurrency)
      .SetValor(fConnection.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency);
    fConnection.DataSet.Next;
  End;
end;

constructor TVendaController.Create;
begin
  inherited;
  fVenda := TVenda.Create;
end;

destructor TVendaController.Destroy;
begin
  fVenda.Free;
  inherited;
end;

function TVendaController.Excluir: IData;
begin
  Result := self;
  fConnection.ExecSQL('delete from venda where codigo = ' + fVenda.Codigo.ToString);
end;

function TVendaController.GetConnection: IConnection;
begin
  result := fConnection;
end;

function TVendaController.Inserir: IData;
var
  Item: TVendaItem;
begin
  fConnection.SQL.Clear;
  fConnection.SQL.Add(SQLVenda);
  for Item in Venda.Items do
  begin
    fConnection.SQL.Add(SQLVendaItem(Item));
  end;
  If fConnection.ExecSQLTransaction.Erro <> EmptyStr Then
    raise Exception.Create(fConnection.Erro);
end;

function TVendaController.SetConnection(Connection: IConnection): IData;
begin
  fConnection := Connection;
  Result := Self;
end;

function TVendaController.SQLVenda: String;
begin
  Result := Format('insert into venda(codigo,cliente,emissao,total)' + #13 +
    'values (%d,%s,%s,%s);',[Venda.Codigo,Venda.Cliente,FormatDateTime('YYYYMMDD',venda.Emissao).QuotedString,
      FormatFloat('0.00',venda.Total).Replace(',','.')]);
end;

function TVendaController.SQLVendaItem(Item: TVendaItem): String;
begin
  Result := Format('insert into vendaitem(venda,produto,quantidade,valor_unitario,total)' + #13 +
    'values (%d,%d,%s,%s,%s);',[Venda.Codigo,Item.Produto,
      FormatFloat('0.00',item.quantidade).Replace(',','.'),
      FormatFloat('0.00',item.Valor).Replace(',','.'),
      FormatFloat('0.00',item.Total).Replace(',','.')]);
end;

end.

