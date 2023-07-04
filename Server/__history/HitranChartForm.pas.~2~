unit HitranChartForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame, uniPanel,
  uniHTMLFrame;
  //VCL.TMSLogging;

type
  THitranChartFrm = class(TUniForm)
    UniURLFrame1: TUniURLFrame;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FUrl : string;
    { Public declarations }
  end;

function HitranChartFrm: THitranChartFrm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function HitranChartFrm: THitranChartFrm;
begin
  Result := THitranChartFrm(UniMainModule.GetFormInstance(THitranChartFrm));
end;

procedure THitranChartFrm.UniFormCreate(Sender: TObject);
begin
  //TMSLogger.Trace('THitranChartFrm.UniFormCreate');
end;

procedure THitranChartFrm.UniFormShow(Sender: TObject);
begin
  UniURLFrame1.URL := FUrl;
  UniURLFrame1.Refresh;
end;

end.
