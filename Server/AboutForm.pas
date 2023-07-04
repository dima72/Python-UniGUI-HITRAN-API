unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniHTMLFrame, uniGUIBaseClasses, uniLabel,
  uniButton;

type
  TAboutFrm = class(TUniForm)
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniHTMLFrame1: TUniHTMLFrame;
    btnOK: TUniButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AboutFrm: TAboutFrm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function AboutFrm: TAboutFrm;
begin
  Result := TAboutFrm(UniMainModule.GetFormInstance(TAboutFrm));
end;

procedure TAboutFrm.btnOKClick(Sender: TObject);
begin
  Close();
end;

end.
