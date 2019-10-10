unit UDataModule;

interface

uses
  System.SysUtils, System.Classes,UDWDatamodule, ZAbstractConnection,
  ZConnection, uRESTDWPoolerDB, uDWAbout, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, uRestDWDriverFD, FireDAC.Comp.UI;

type
  TDataModule2 = class(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDTransaction1: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule: TDataModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}



end.
