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
    UniToolButton3: TUniToolButton;
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    UniLabel1: TUniLabel;
    procedure acPythonScripterExecute(Sender: TObject);
    procedure acHitranExecute(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure acNasaGeomagForecastExecute(Sender: TObject);
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
  NasaGeomagForecastForm, AboutForm;

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

procedure TMainForm.acNasaGeomagForecastExecute(Sender: TObject);
begin
   NasaGeomagForecastFrm.Show();
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
