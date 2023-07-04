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
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniSplitter, uniGUIBaseClasses,
  Vcl.StdCtrls, Vcl.Menus, uniMainMenu,
  System.Actions, Vcl.ActnList, uniToolBar, uniPanel, uniHTMLFrame, Data.DB,
  uniBasicGrid, uniDBGrid, uniLabel;


type
  TMainForm = class(TUniForm)
    UniMainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Hitran1: TUniMenuItem;
    UniActionList1: TUniActionList;
    acPythonScripter: TAction;
    acHitran: TAction;
    acAbout: TAction;
    About1: TUniMenuItem;
    acNasaGeomagForecast: TAction;
    NasaGeomagneticForecast1: TUniMenuItem;
    UniToolBar1: TUniToolBar;
    UniToolButton1: TUniToolButton;
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    UniLabel1: TUniLabel;
    procedure acPythonScripterExecute(Sender: TObject);
    procedure acHitranExecute(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
  public
    { Public declarations }

  end;



function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, uniGUIApplication, MainModule, PythonScripterForm, HitranForm,
  AboutForm;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;


procedure TMainForm.acAboutExecute(Sender: TObject);
var
  aFrm : TAboutFrm;
begin
  aFrm := AboutFrm();
  aFrm.Left:=(Self.Width-aFrm.Width)  div 2;
  aFrm.Top:=(Self.Height-aFrm.Height) div 2;
  aFrm.ShowModal();
end;

procedure TMainForm.acHitranExecute(Sender: TObject);
begin
  HitranFrm.Show();
end;

procedure TMainForm.acPythonScripterExecute(Sender: TObject);
begin
   PythonScripterFrm.Show();
end;


procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
  acHitranExecute(Nil);
end;

initialization
   RegisterAppFormClass(TMainForm);
end.
