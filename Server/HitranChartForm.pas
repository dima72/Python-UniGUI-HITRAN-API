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
