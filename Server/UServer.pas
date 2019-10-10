unit UServer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, uDWAbout, uRESTDWBase;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Circle1: TCircle;
    Label2: TLabel;
    RESTServicePooler1: TRESTServicePooler;
    procedure Rectangle2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UDataModule;



procedure TForm1.Rectangle2Click(Sender: TObject);
begin


  RESTServicePooler1.ServerMethodClass := TDataModule2;


  RESTServicePooler1.Active := Not RESTServicePooler1.Active;
  if RESTServicePooler1.Active then
  begin
        label1.Text         := 'Desativar';
        label2.Text         := 'Ativado';
        circle1.Fill.Color  := $FF00FF00;
        form1.Caption := 'Server Ativo';
  end
  else
  begin

        label1.Text         := 'Ativar';
        label2.Text         := 'Desativado';
        circle1.Fill.Color  := $FFFF0000;
        form1.Caption := 'Server Desativado';

  end;

end;

end.
