unit PV.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Panel5: TPanel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit5: TEdit;
    Label8: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    DBText1: TDBText;
    Label7: TLabel;
    Panel7: TPanel;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  DBGrid1.Columns[1].Width := DBGrid1.Width - 457;
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
  Close;
end;

end.
