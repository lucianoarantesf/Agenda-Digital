program Server;

uses
  System.StartUpCopy,
  FMX.Forms,
  UServer in 'UServer.pas' {Form1},
  UDataModule in 'UDataModule.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule);
  Application.Run;
end.
