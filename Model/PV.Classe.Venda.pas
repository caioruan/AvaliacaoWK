unit PV.Classe.Venda;

interface

uses System.Generics.Collections;


type

  TVendaItem = Class
  private
    fProduto: Integer;
    fValor: Currency;
    fCodigo: Integer;
    fquantidade: Currency;
    fDescricao: String;
    function GetTotal: Currency;
  public
    function SetCodigo(AValue: Integer): TVendaItem;
    function SetProduto(Avalue: Integer): TVendaItem;
    function Setquantidade(AValue: Currency): TVendaItem;
    function SetValor(AValue: Currency): TVendaItem;
    function SetDescricao(AValue: String): TVendaitem;
    property Codigo: Integer read fCodigo;
    property Descricao: String read fDescricao;
    property Produto: Integer read fProduto;
    property quantidade: Currency read fquantidade;
    property Valor: Currency read fValor;
    property Total: Currency read GetTotal;
  End;

  TVenda = class
  private
    fCliente: String;
    fNome: String;
    fCodigo: Integer;
    fEmissao: TDate;
    fItems: TList<TVendaItem>;
    fIndex: Integer;
    function GetTotal: Currency;
  public
    constructor Create;
    function SetCodigo(AValue: Integer): TVenda;
    function SetEmissao(AValue: TDate): TVenda;
    function SetCliente(AValue: String): TVenda;
    function SetNome(AValue: String): TVenda;
    function DeleteItem: TVendaItem;
    function UpdateItem(Item: TVendaItem): TVendaItem;
    function NewItem: TVendaItem;
    destructor Destroy; override;
    property Items: TList<TVendaItem> read fItems;
    property Codigo: Integer read fCodigo;
    property Emissao: TDate read fEmissao;
    property Cliente: String read fCliente;
    property Nome: String read fNome;
    property Total: Currency read GetTotal;
    property Index: Integer read fIndex;
  end;

implementation

{ TVendaItem }

function TVendaItem.GetTotal: Currency;
begin
  Result := fquantidade * fValor;
end;

function TVendaItem.SetCodigo(AValue: Integer): TVendaItem;
begin
  fCodigo := AValue;
  Result := Self;
end;

function TVendaItem.SetDescricao(AValue: String): TVendaitem;
begin
  Result := Self;
  fDescricao := AValue;
end;

function TVendaItem.SetProduto(Avalue: Integer): TVendaItem;
begin
  fProduto := AValue;
  Result := Self;
end;

function TVendaItem.Setquantidade(AValue: Currency): TVendaItem;
begin
  fquantidade := AValue;
  Result := Self;
end;

function TVendaItem.SetValor(AValue: Currency): TVendaItem;
begin
  fValor := AValue;
  Result := Self;
end;

{ TVenda }

constructor TVenda.Create;
begin
  inherited;
  fItems := TList<TVendaItem>.Create;
end;

function TVenda.DeleteItem: TVendaItem;
begin
  Items.Delete(Index);
end;

destructor TVenda.Destroy;
begin
  fItems.Free;
  inherited;
end;

function TVenda.GetTotal: Currency;
  var Item: TVendaItem;
begin
  Result := 0;
  for Item in Items do
  begin
    Result := Result + Item.Total;
  end;
end;

function TVenda.NewItem: TVendaItem;
begin
  Result := TVendaItem.Create;
  fItems.Add(Result);
end;

function TVenda.SetCliente(AValue: String): TVenda;
begin
  fCliente := AValue;
  Result := Self;
end;

function TVenda.SetCodigo(AValue: Integer): TVenda;
begin
  fCodigo := AValue;
  Result := Self;
end;

function TVenda.SetEmissao(AValue: TDate): TVenda;
begin
  fEmissao := AValue;
  Result := Self;
end;

function TVenda.SetNome(AValue: String): TVenda;
begin
  fNome := AValue;
  Result := Self;
end;

function TVenda.UpdateItem(Item: TVendaItem): TVendaItem;
begin
  Items[index] := Item;
end;

end.
