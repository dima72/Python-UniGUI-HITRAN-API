program Hitran;

uses
  Vcl.Forms,
  Unit_Server in 'Unit_Server.pas' {Form1},
  IPC.Demo.Types in 'IPC.Demo.Types.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

