program PythonUniGui;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  PythonScripterForm in 'PythonScripterForm.pas' {PythonScripterFrm: TUniForm},
  HitranForm in 'HitranForm.pas' {HitranFrm: TUniForm},
  HitranChartForm in 'HitranChartForm.pas' {HitranChartFrm: TUniForm},
  AboutForm in 'AboutForm.pas' {AboutFrm: TUniForm},
  IPC.Demo.Types in '..\HitranIPC\IPC.Demo.Types.pas',
  IPC in '..\HitranIPC\IPC.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
