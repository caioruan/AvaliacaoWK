unit PV.Classe.Cliente;

interface

uses
  System.SysUtils;

type

  TCliente = class
  private
    fUF: String;
    fCodigo: String;
    fNome: string;
    fCidade: String;
  public
    function SetNome(AValue: String): TCliente;
    function SetCodigo(AValue: String): TCliente;
    function SetCidade(AValue: String): TCliente;
    function SetUF(AValue: String): TCliente;
    property Codigo: String read fCodigo;
    property Nome: string read fNome;
    property Cidade: String read fCidade;
    property UF: String read fUF;
  end;


implementation

function TCliente.SetCidade(AValue: String): TCliente;
begin
  fCidade := AValue;
  Result := self;
end;

function TCliente.SetCodigo(AValue: String): TCliente;
begin
  fCodigo := AValue;
  Result := self;
end;

function TCliente.SetNome(AValue: String): TCliente;
begin
  fNome := AValue;
  Result := self;
end;

function TCliente.SetUF(AValue: String): TCliente;
begin
  fUF := AValue;
  Result := self;
end;


end.
