unit PV.Classe.Produto;

interface


type

  TProduto = class
  private
    fCodigo: String;
    fDescricao: string;
    fPrecoVenda: Currency;
  public
    function SetDescricao(AValue: String): TProduto;
    function SetCodigo(AValue: String): TProduto;
    function SetPrecoVenda(AValue: Currency): TProduto;
    property Codigo: String read fCodigo;
    property Descricao: string read fDescricao;
    property PrecoVenda: Currency read fPrecoVenda;
  end;


implementation



function TProduto.SetCodigo(AValue: String): TProduto;
begin
  fCodigo := AValue;
  Result := self;
end;

function TProduto.SetDescricao(AValue: String): TProduto;
begin
  fDescricao := AValue;
  Result := self;
end;

function TProduto.SetPrecoVenda(AValue: Currency): TProduto;
begin
  fPrecoVenda := AValue;
  Result := self;
end;


end.

