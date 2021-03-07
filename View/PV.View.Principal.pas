unit PV.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Data.DBXMySQL,
  Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, PV.Classe.IData,
  PV.Classe.IConnection,
  PV.Classe.Cliente, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, PV.Classe.Produto,
  PV.Classe.Controller.Cliente, PV.Classe.Controller.Produto,
  Vcl.Mask, System.Actions, Vcl.ActnList, PV.Classe.Controller.Venda,
  PV.Classe.Venda;

type
  TViewPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    edtProduto: TEdit;
    Label5: TLabel;
    edtQuantidade: TEdit;
    Panel5: TPanel;
    Label6: TLabel;
    edtCliente: TEdit;
    edtPrecoVenda: TEdit;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnAdicionar: TSpeedButton;
    edtNomeCliente: TEdit;
    edtDescricaoProduto: TEdit;
    mmVendaItem: TFDMemTable;
    mmVendaItemPRODUTO: TIntegerField;
    mmVendaItemDESCRICAO: TStringField;
    mmVendaItemQUANTIDADE: TCurrencyField;
    mmVendaItemVALOR: TCurrencyField;
    mmVendaItemTOTAL_TOTAL: TAggregateField;
    dsVendaItem: TDataSource;
    DBEdit1: TDBEdit;
    mmVendaItemTOTAL: TCurrencyField;
    actEventos: TActionList;
    actAdicionar: TAction;
    actAtualizar: TAction;
    Label3: TLabel;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoVendaExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure actAtualizarExecute(Sender: TObject);
    procedure mmVendaItemAfterPost(DataSet: TDataSet);
    procedure edtClienteChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actAdicionarExecute(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    fCliente: TClienteController;
    fConnection: IConnection;
    fProduto: TProdutoController;
    procedure ClearProduto;
    procedure ClearVenda;
    procedure InserirProduto(Codigo, Descricao: string;
      Quantidade, Valor: Currency);
    procedure Validar(AValue, Validacao: Variant; Mensagem: String);
    procedure ValidarInserirProduto;
    procedure ValidarInserirVenda;
    { Private declarations }
  public
    { Public declarations }
    property Connection: IConnection read fConnection;
    property Cliente: TClienteController read fCliente;
    property Produto: TProdutoController read fProduto;
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    actAtualizar.Tag := mmVendaItem.RecNo;
    edtProduto.Text := mmVendaItemPRODUTO.AsString;
    edtQuantidade.Text := mmVendaItemQUANTIDADE.Text;
    edtPrecoVenda.Text := mmVendaItemVALOR.Text;
    edtDescricaoProduto.Text := mmVendaItemDESCRICAO.Text;
    btnAdicionar.Action := actAtualizar;
  end;
end;

procedure TViewPrincipal.edtClienteChange(Sender: TObject);
begin
  btnCancelar.Visible := edtCliente.Text = EmptyStr;
  btnConsultar.Visible := edtCliente.Text = EmptyStr;
end;

procedure TViewPrincipal.edtClienteExit(Sender: TObject);
begin
  if edtCliente.Text <> EmptyStr then
  begin
    fCliente := TClienteController.Create;
    fCliente.SetConnection(Connection).Consultar(edtCliente.Text);
    edtNomeCliente.Text := fCliente.Cliente.Nome;
  end;
end;

procedure TViewPrincipal.edtPrecoVendaExit(Sender: TObject);
begin
  edtPrecoVenda.Text := CurrToStrF(StrToCurrDef(edtPrecoVenda.Text, 0),
    TFloatFormat.ffNumber, 2);
end;

procedure TViewPrincipal.edtProdutoExit(Sender: TObject);
begin
  if edtProduto.Text <> EmptyStr then
  begin
    fProduto := TProdutoController.Create;
    fProduto.SetConnection(Connection).Consultar(edtProduto.Text);
    edtDescricaoProduto.Text := fProduto.Produto.Descricao;
    edtQuantidade.Text := '1';
    edtPrecoVenda.Text := CurrToStrF(fProduto.Produto.PrecoVenda,
      TFloatFormat.ffNumber, 2);
  end;
end;

procedure TViewPrincipal.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
  mmVendaItem.Active := true;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  fConnection := TConnection.Create.ConfigConnection;
end;

procedure TViewPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TViewPrincipal.FormResize(Sender: TObject);
begin
  DBGrid1.Columns[1].Width := DBGrid1.Width - 542 - 20;
end;

procedure TViewPrincipal.Label7Click(Sender: TObject);
begin
  Close;
end;

procedure TViewPrincipal.mmVendaItemAfterPost(DataSet: TDataSet);
begin
  edtProduto.SetFocus;
end;

procedure TViewPrincipal.SpeedButton1Click(Sender: TObject);
Var
  Venda: TVendaController;
  I: Integer;
begin
  ValidarInserirVenda;
  Venda := TVendaController.Create;
  Venda.SetConnection(Connection);
  Venda
    .Venda
    .SetCodigo(fConnection.NextValue('VENDA'))
    .SetCliente(edtCliente.Text)
    .SetEmissao(date);
  for I := 0 to mmVendaItem.RecNo - 1 do
  begin
    Venda.Venda.NewItem.SetProduto(mmVendaItemPRODUTO.AsInteger)
      .Setquantidade(mmVendaItemQUANTIDADE.AsCurrency)
      .SetValor(mmVendaItemVALOR.AsCurrency);
  end;
  Venda.Inserir;
  ShowMessage('Pedido gravado com sucesso!');
  ClearVenda;
end;

procedure TViewPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TViewPrincipal.actAdicionarExecute(Sender: TObject);
begin
  ValidarInserirProduto;
  InserirProduto(edtProduto.Text, edtDescricaoProduto.Text,
    StrToCurr(edtQuantidade.Text), StrToCurr(edtPrecoVenda.Text));
  ClearProduto;

end;

procedure TViewPrincipal.actAtualizarExecute(Sender: TObject);
begin
  mmVendaItem.RecNo := actAtualizar.Tag;
  mmVendaItem.Edit;
  mmVendaItemPRODUTO.AsString := edtProduto.Text;
  mmVendaItemDESCRICAO.AsString := edtDescricaoProduto.Text;
  mmVendaItemQUANTIDADE.AsString := edtQuantidade.Text;
  mmVendaItemVALOR.AsString := edtPrecoVenda.Text;
  mmVendaItemTOTAL.AsCurrency := mmVendaItemQUANTIDADE.AsCurrency *
    mmVendaItemVALOR.AsCurrency;
  mmVendaItem.Post;
  btnAdicionar.Action := actAdicionar;
end;

procedure TViewPrincipal.btnCancelarClick(Sender: TObject);
Var
  Venda: TVendaController;
  Codigo: String;
begin
  Codigo := InputBox('Cancelar Pedido','Informe o número do pedido','0');
  Validar(StrToIntDef(Codigo,-1),-1,'Código do pedido é inválido para esta operação');

  Venda := TVendaController.Create;
  venda.SetConnection(fConnection);

  If Venda.Consultar(Codigo).Connection.IsEmpty Then
    ShowMessage('Venda não localizada')
  else
  Begin
    Venda.Excluir;
    ShowMessage('Venda cancelada com sucesso!');
  End;
end;

procedure TViewPrincipal.btnConsultarClick(Sender: TObject);
Var
  Venda: TVendaController;
  Item: TVendaItem;
  Codigo: String;
begin
  Codigo := InputBox('Consulta de Pedido','Informe o número do pedido','0');
  Validar(StrToIntDef(Codigo,-1),-1,'Código do pedido é inválido para esta operação');

  Venda := TVendaController.Create;
  Venda.SetConnection(fConnection);
  If Not Venda.Consultar(Codigo).GetConnection.IsEmpty Then
  Begin
    ClearVenda;
    edtCliente.Text := Venda.Venda.Codigo.ToString;
    edtNomeCliente.Text := Venda.Venda.Nome;
    for Item in Venda.Venda.Items do
    begin
      InserirProduto(item.Produto.ToString, Item.Descricao, item.quantidade,Item.Valor);
    end;
  End
  else
    ShowMessage('Venda não localizada');

end;

procedure TViewPrincipal.ClearProduto;
begin
  edtProduto.Clear;
  edtQuantidade.Clear;
  edtPrecoVenda.Clear;
  edtDescricaoProduto.Clear;
end;

procedure TViewPrincipal.ClearVenda;
begin
  ClearProduto;
  edtCliente.Clear;
  edtNomeCliente.Clear;
  mmVendaItem.EmptyDataSet;
  edtCliente.SetFocus;
end;

procedure TViewPrincipal.InserirProduto(Codigo: String; Descricao: string;
  Quantidade: Currency; Valor: Currency);
begin
  mmVendaItem.InsertRecord([Codigo, Descricao,
    Quantidade, Valor, Quantidade * Valor]);
end;

procedure TViewPrincipal.Validar(AValue: Variant; Validacao: Variant;
  Mensagem: String);
begin
  if AValue = Validacao then
  begin
    raise Exception.Create(Mensagem);
  end;
end;

procedure TViewPrincipal.ValidarInserirProduto;
begin
  Validar(edtProduto.Text, EmptyStr,
    'O campo produto não pode ficar em branco!');
  Validar(edtDescricaoProduto.Text, EmptyStr,
    'O campo descrição de produto não pode ficar em branco!');
  Validar(edtProduto.Text, EmptyStr,
    'O campo Quantidade não pode ficar em branco!');
  Validar(edtProduto.Text, EmptyStr, 'O campo valor não pode ficar em branco!');
end;

procedure TViewPrincipal.ValidarInserirVenda;
begin
  Validar(edtCliente.Text, EmptyStr,
    'O campo cliente não pode ficar em branco');
  Validar(edtNomeCliente.Text, EmptyStr,
    'O campo nome do cliente não pode ficar em branco');
  Validar(mmVendaItem.RecNo, 0,
    'Nenhum produto foi informado por favor informe ao menos 1 produto para gravar a venda!');
end;

end.
