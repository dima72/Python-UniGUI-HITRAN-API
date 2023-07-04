{
MIT License

Copyright (c) 2022 Dmitry Konnov

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
unit Unit_Server;
interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  IPC, PythonEngine;
type
  TForm1 = class(TForm)
    PythonEngine1: TPythonEngine;
    PythonInputOutput1: TPythonInputOutput;
    Memo1: TMemo;
    btnExecute: TButton;
    cbDebugMemo: TCheckBox;
    Memo2: TMemo;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure PythonInputOutput1SendData(Sender: TObject;
      const Data: AnsiString);
    procedure btnExecuteClick(Sender: TObject);
  private
    FServerName : string;
    FClientName : string;
    FIsIPC : Boolean;
    { Private declarations }
    FIPCServer: TIPCServer;
  public
    { Public declarations }
    procedure ServerRecieveIpcData(Sender: TObject; var ClientName: WideString;
      var ClientWaitingForResponse: Boolean; var Data: Pointer);
  end;
var
  Form1: TForm1;
implementation
uses
  IPC.Demo.Types,  VarPyth;
{$R *.dfm}

procedure CheckError(pYes : Boolean; pMessage : string);
begin
  if not pYes then
    raise Exception.Create(pMessage);
end;


procedure TForm1.ServerRecieveIpcData(Sender: TObject; var ClientName:
  WideString; var ClientWaitingForResponse: Boolean; var Data: Pointer);
var
  ResponseData: TResponseData;
  aScriptSL : TStringList;
  a_Command : string;
begin
  try
    aScriptSL := TStringList.Create;
    try
      aScriptSL.Text := TData(Data^).Text;
      if aScriptSL.Count > 0 then
      begin
        if aScriptSL.Strings[0] = 'absorptionCoefficient_LorentzCalc' then
        begin
          a_Command := 'absorptionCoefficient_LorentzCalc("'+ aScriptSL.Strings[1]+'","'+aScriptSL.Strings[2]+ '",'+
            aScriptSL.Strings[3]+','+aScriptSL.Strings[4]+',"'+ aScriptSL.Strings[5]+ '",' + aScriptSL.Strings[6]+
              ','+aScriptSL.Strings[7]+ ',' +aScriptSL.Strings[8]+ ')';
          PythonEngine1.ExecString(a_Command);
          //MainModule.absorptionCoefficient_LorentzCalc(pClientId := aScriptSL.Strings[1], pMolecule := aScriptSL.Strings[2],
          //  pDiluent := aScriptSL.Strings[3]);
        end;
      end;
    finally
      aScriptSL.Free;
    end;
    Application.ProcessMessages;

    if ClientWaitingForResponse then
    begin
      lstrcpynW(ResponseData.Text, PWideChar('OK'), MAX_LENGTH);
      CheckError(FIPCServer.SendIpcData(ClientName, @ResponseData, SizeOf(TResponseData)),
       'Error send response - ' + SysErrorMessage(FIPCServer.LastError));
    end;
  except on E: Exception do
  begin
    lstrcpynW(ResponseData.Text, PWideChar(E.Message), MAX_LENGTH);
    if not FIPCServer.SendIpcData(ClientName, @ResponseData, SizeOf(TResponseData)) then
      Memo2.Lines.Add('Error send response - ' + SysErrorMessage(FIPCServer.LastError));
    Memo2.Lines.Add('ServerRecieveIpcData: ' +E.Message);
  end;
  end;
end;

procedure TForm1.PythonInputOutput1SendData(Sender: TObject;
  const Data: AnsiString);
var
  ResponseData: TResponseData;
  a_Data : WideString;
begin
  try
    if cbDebugMemo.Checked then
       Memo2.Lines.Add(Data);
    if FIsIPC then
    begin
      CheckError(Assigned(FIPCServer), 'FIPCServer is not initialised. PythonInputOutput1SendData');
      a_Data := Data;
      lstrcpynW(ResponseData.Text, PWideCHar(a_Data), MAX_LENGTH);
      CheckError(FIPCServer.SendIpcData(FClientName, @ResponseData, SizeOf(TResponseData)),
        'Error send response - ' + SysErrorMessage(FIPCServer.LastError));
    end;
    Application.ProcessMessages;
  except on E : Exception do
    Memo2.Lines.Add('PythonInputOutput1SendData: ' + E.Message);
  end;
end;

procedure TForm1.btnExecuteClick(Sender: TObject);
begin
  try
     PythonEngine1.ExecStrings(Memo1.Lines);
  except on E : Exception do
    Memo2.Lines.Add('btnExecuteClick: ' + E.Message);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  try
    PythonEngine1.DllPath := ExtractFilePath(Application.ExeName);
    FIPCServer := TIPCServer.Create(Self);
    FIPCServer.OnRecieveIpcData := ServerRecieveIpcData;
    if ParamCount = 2 then
    begin
      FIsIPC := true;
      FServerName := Trim(ParamStr(1));
      CheckError(FServerName <> '', 'pServerName is Empty');
      FClientName := Trim(ParamStr(2));
      CheckError(FClientName <> '', 'pClientName is Empty');
      CheckError(FIPCServer.CreateServer(FServerName),
        'Error create server "' + 'IPC Server' + '" - ' + SysErrorMessage(FIPCServer.LastError));
      PythonEngine1.LoadDll;
      PythonEngine1.ExecStrings(Memo1.Lines);
    end
    else
    begin
      FIsIPC := false;
      PythonEngine1.LoadDll;
    end;
  except on E : Exception do
    Memo2.Lines.Add('FormCreate:' + E.Message);
  end;
end;


end.
