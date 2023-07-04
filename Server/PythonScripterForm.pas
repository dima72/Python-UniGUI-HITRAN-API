{
MIT License

Copyright (c) 2022 Dmitry Konnov RU

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}
unit PythonScripterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniSplitter, uniGUIBaseClasses,
  uniMemo, uniButton, Vcl.StdCtrls, uniTimer, uniFileUpload, IPC, IPC.Demo.Types;
  //VCL.TMSLogging;


type
  TPythonScripterFrm = class(TUniForm)
    ctl_ResultMemo: TUniMemo;
    UniSplitter1: TUniSplitter;
    ctl_SourceMemo: TUniMemo;
    btnExecute: TUniButton;
    btnLoadSctipt: TUniButton;
    UniFileUpload1: TUniFileUpload;
    UniTimer1: TUniTimer;
    procedure btnExecuteClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnLoadSctiptClick(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure UniTimer1Timer(Sender: TObject);
  private
    FIPCClient: TIPCClient;
    FIPCServerName : string;
    FResponce : TStringList;
  public
    { Public declarations }
    procedure ClientRecieveResponseIpcData(Sender: TObject; var ResponseData: Pointer);
  end;



function PythonScripterFrm: TPythonScripterFrm;

implementation

{$R *.dfm}

uses
  uniGUIVars, uniGUIApplication, MainModule;



function PythonScripterFrm: TPythonScripterFrm;
begin
  Result := TPythonScripterFrm(UniMainModule.GetFormInstance(TPythonScripterFrm));
end;


procedure TPythonScripterFrm.btnExecuteClick(Sender: TObject);
var
  I : Integer;
  Data: TData;
  ResponseData: Pointer;
begin
  try
    ResponseData := nil;
    Data.ProcessId := GetCurrentProcessId;
    Data.SetText(ctl_SourceMemo.Lines.Text);
    if not FIPCClient.Send<TData>(FIPCServerName, Data, false, 1000, ResponseData) then
      ctl_ResultMemo.Lines.Add('Error send IPC data - ' + SysErrorMessage(FIPCClient.LastError));
    UniTimer1.Enabled := true;
   { if ResponseData <> nil then
    begin
      ctl_ResultMemo.Lines.Add(TResponseData(ResponseData^).Text);
    end;
    }
  except on E : Exception do
    ctl_ResultMemo.Lines.Add(E.Message);
  end;
end;

procedure TPythonScripterFrm.btnLoadSctiptClick(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

procedure TPythonScripterFrm.ClientRecieveResponseIpcData(Sender: TObject;
  var ResponseData: Pointer);
begin
  ctl_ResultMemo.Lines.Add(TResponseData(ResponseData^).Text);
//  FResponce.Add(TResponseData(ResponseData^).Text);
end;

procedure TPythonScripterFrm.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  ctl_SourceMemo.Lines.LoadFromStream(AStream);
end;


procedure TPythonScripterFrm.UniFormCreate(Sender: TObject);
begin
 // TMSLogger.Trace('TPythonScripterFrm.UniFormCreate');
  FIPCClient := TIPCClient.Create(Self);
  FIPCClient.OnRecieveResponseIpcData := ClientRecieveResponseIpcData;
  if not FIPCClient.CreateClient('IPCClient' + IntToStr(GetTickCount)) then
    ctl_ResultMemo.Lines.Add('Error create client "' + 'IPC Client' + '" - ' + SysErrorMessage(FIPCClient.LastError));
  FIPCServerName := FIPCClient.CreateIPCServer('Server.exe', 'IPCServ' + IntToStr(GetTickCount), SW_SHOW);
  FResponce := TStringList.Create;
  UniTimer1.Enabled := true;
end;

procedure TPythonScripterFrm.UniFormDestroy(Sender: TObject);
begin
  FResponce.Free;
end;

procedure TPythonScripterFrm.UniTimer1Timer(Sender: TObject);
begin
  FIPCClient.DoReadData;
  {UniTimer1.Enabled := false;
  while FResponce.Count > 0 do
  begin
    ctl_ResultMemo.Lines.Add(FResponce.Strings[0]);
    FResponce.Delete(0);
  end;
  ctl_ResultMemo.Refresh;}
end;

initialization
  RegisterAppFormClass(TPythonScripterFrm);

end.
