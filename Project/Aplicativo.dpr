program Aplicativo;

uses
  Vcl.Forms,
  PV.View.Principal in '..\View\PV.View.Principal.pas' {ViewPrincipal},
  PV.Classe.IConnection in '..\Model\PV.Classe.IConnection.pas',
  PV.Classe.Cliente in '..\Model\PV.Classe.Cliente.pas',
  PV.Classe.IData in '..\Model\PV.Classe.IData.pas',
  PV.Classe.Produto in '..\Model\PV.Classe.Produto.pas',
  PV.Classe.Controller.Produto in '..\Control\PV.Classe.Controller.Produto.pas',
  PV.Classe.Controller.Cliente in '..\Control\PV.Classe.Controller.Cliente.pas',
  PV.Classe.Venda in '..\Model\PV.Classe.Venda.pas',
  PV.Classe.Controller.Venda in '..\Control\PV.Classe.Controller.Venda.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
