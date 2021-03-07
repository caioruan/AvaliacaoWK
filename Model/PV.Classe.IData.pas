unit PV.Classe.IData;

interface

uses PV.Classe.IConnection;

type

  IData = interface
    ['{6C7DE098-F58E-4484-984D-69B11ECA74B2}']
    function SetConnection(Connection: IConnection): IData;
    function GetConnection: IConnection;
    function Consultar(AValue: String): IData;
    function Atualizar: IData;
    function Inserir: IData;
    function Excluir: IData;
    property Connection: IConnection read GetConnection;
  end;

implementation

end.
