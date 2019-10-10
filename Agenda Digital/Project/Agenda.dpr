program Agenda;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\View\UPrincipal.pas' {frmMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
