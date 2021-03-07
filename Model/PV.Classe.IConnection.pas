unit PV.Classe.IConnection;

interface

uses
  System.Variants, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client,FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  System.SysUtils;





type
  IConnection = interface
    ['{739C80EA-3C45-46C0-84FD-88D8B4052CD0}']
    function Open: IConnection;
    function Close: IConnection;
    function TestConnect: IConnection;
    function GetConnection: TFDConnection;
    function ExecSQLTransaction: IConnection;
    function ExecSQL(AValue: String): IConnection; overload;
    function ExecSQL: IConnection; overload;
    function OpenSQL(AValue: String): IConnection; overload;
    function OpenSQL: IConnection; overload;
    function GetErro: String;
    function GetActive: Boolean;
    function GetDataSet: TFDQuery;
    function GetDataSource: TDataSource;
    function GetSQL: TStrings;
    function GetIsEmpty: Boolean;
    function NextValue(TableName: String): Integer;
    function GetRowsAffected: Integer;
    property Connection: TFDConnection read GetConnection;
    property Erro: string read GetErro;
    property Active: Boolean read GetActive;
    property DataSet: TFDQuery read GetDataSet;
    property DataSource: TDataSource read GetDataSource;
    property SQL: TStrings read GetSQL;
    property IsEmpty: Boolean read GetIsEmpty;
    property RowsAffected: Integer read GetRowsAffected;
  end;

  TConnection = Class(TInterfacedObject, IConnection)
  private
    fConnection: TFDConnection;
    fWait: TFDGUIxWaitCursor;
    fDriverMySql: TFDPhysMySQLDriverLink;
    fErro: string;
    fDataSet: TFDQuery;
    fDataSource: TDataSource;
    fActive: Boolean;
  public
    function GetIsEmpty: Boolean;
    constructor Create;
    destructor Destroy; override;
    function ExecSQLTransaction: IConnection;
    function ExecSQL(AValue: String): IConnection; overload;
    function ExecSQL: IConnection; overload;
    function OpenSQL(AValue: String): IConnection; overload;
    function OpenSQL: IConnection; overload;
    function TestConnect: IConnection;
    function ConfigConnection(Server: string = '127.0.0.1';
      Database: string = 'dados'; Password: string = 'vertrigo';
      UserName: String = 'root'): IConnection;
    function GetConnection: TFDConnection;
    function GetErro: String;
    function GetActive: Boolean;
    function GetDataSet: TFDQuery;
    function GetDataSource: TDataSource;
    function Close: IConnection;
    function Open: IConnection;
    function GetSQL: TStrings;
    function NextValue(TableName: string): Integer;
    function GetRowsAffected: Integer;
    property RowsAffected: Integer read GetRowsAffected;
    property DataSet: TFDQuery read GetDataSet;
    property DataSource: TDataSource read GetDataSource;
    property Erro: string read GetErro;
    property Connection: TFDConnection read GetConnection;
    property Active: Boolean read GetActive;
    property Wait: TFDGUIxWaitCursor read fWait;
    property DriverMySql: TFDPhysMySQLDriverLink read fDriverMySql;
    property SQL: TStrings read GetSQL;
    property IsEmpty: Boolean read GetIsEmpty;

  End;

implementation

{ TClienteController }

{ TConnection }

function TConnection.Close: IConnection;
begin
  fConnection.Close;
end;

function TConnection.ConfigConnection(Server, Database, Password,
  UserName: String): IConnection;
begin
  fConnection.Params.DriverID := 'MySQL';
  fConnection.Params.Database := Database;
  fConnection.Params.UserName := UserName;
  fConnection.Params.Password := Password;
  fConnection.Params.Values['Server'] := Server;
  Result := self;
end;

constructor TConnection.Create;
begin
  fConnection := TFDConnection.Create(nil);
  fWait := TFDGUIxWaitCursor.Create(nil);
  fDriverMySql := TFDPhysMySQLDriverLink.Create(nil);
  fDataSet := TFDQuery.Create(nil);
  fDataSet.Connection := fConnection;
  fDataSource := TDataSource.Create(nil);
  fDataSource.DataSet := fDataSet;
end;

destructor TConnection.Destroy;
begin
  FreeAndNil(fDataSource);
  FreeAndNil(fConnection);
  FreeAndNil(fWait);
  FreeAndNil(fDriverMySql);
  FreeAndNil(fDataSet);
  inherited;
end;

function TConnection.ExecSQL: IConnection;
begin
  Try
    fErro := EmptyStr;
    DataSet.ExecSQL;
  Except
    On E: Exception Do
    Begin
      fErro := 'Erro ao executar comando SQL' + #13 + e.Message;
    End;
  End;
end;

function TConnection.ExecSQL(AValue: String): IConnection;
begin
  Try
    fErro := EmptyStr;
    DataSet.SQL.Text := AValue;
    DataSet.ExecSQL;
  Except
    On E: Exception Do
    Begin
      fErro := 'Erro ao executar comando SQL' + #13 + e.Message;
    End;
  End;
end;

function TConnection.ExecSQLTransaction: IConnection;
Var
  Transaction: TFDTransaction;
begin
  Try
    Try
      Result := Self;
      fErro := EmptyStr;
      Transaction := TFDTransaction.Create(nil);
      Transaction.Connection := fConnection;
      DataSet.Transaction := Transaction;
      Transaction.StartTransaction;
      DataSet.ExecSQL;
      Transaction.Commit;
    Except
      On E: Exception do
      begin
        fErro := 'Erro ao executar comando ' + #13 + E.Message;
        Transaction.Rollback;
      end;
    End;
  Finally
    FreeAndNil(Transaction);
    DataSet.Transaction := nil;
  End;
end;

function TConnection.GetActive: Boolean;
begin
  result := fActive;
end;

function TConnection.GetConnection: TFDConnection;
begin
  Result := fConnection;
end;

function TConnection.GetDataSet: TFDQuery;
begin
  Result := fDataSet;
end;

function TConnection.GetDataSource: TDataSource;
begin
  Result := fDataSource;
end;

function TConnection.GetErro: String;
begin
  Result := fErro;
end;


function TConnection.GetIsEmpty: Boolean;
begin
  Result := DataSet.IsEmpty;
end;

function TConnection.GetRowsAffected: Integer;
begin
  Result := DataSet.RowsAffected;
end;

function TConnection.GetSQL: TStrings;
begin
  Result := DataSet.SQL;
end;

function TConnection.NextValue(TableName: string): Integer;
begin
  OpenSQL(Format('SELECT Auto_increment FROM information_schema.tables WHERE table_name=%s',[TableName.QuotedString]));
  Result :=  DataSet.Fields[0].AsInteger;
end;

function TConnection.Open: IConnection;
begin
  Try
    fErro := EmptyStr;
    fConnection.Open;
  Except
    On E: Exception DO
    Begin
      fErro := 'Erro ao tentar se conectar no banco de dados';
      raise Exception.Create(fErro);
    End;
  End;
end;

function TConnection.OpenSQL(AValue: String): IConnection;
begin
  fDataSet.Open(AValue);
  Result := Self;
end;

function TConnection.OpenSQL: IConnection;
begin
  fDataSet.Open;
  Result := Self;
end;

function TConnection.TestConnect: IConnection;
begin
  Try
    Open;
    fActive := True;
    fErro := EmptyStr;
  Except
    On E: Exception do
    begin
      fErro := e.Message;
      fActive := false;
      raise Exception.Create(fErro);
    end;
  end;
end;



end.
