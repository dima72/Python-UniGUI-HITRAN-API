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
unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Inifiles,
  Data.DB, Datasnap.DBClient;

type
  TUniMainModule = class(TUniGUIMainModule)
    tbISO: TClientDataSet;
    tbISOid: TSmallintField;
    tbISOmolecule_id: TSmallintField;
    tbISOisotopologue_id: TSmallintField;
    tbISOiso_name: TStringField;
    tbISOabundance: TFloatField;
    tbISOmass: TFloatField;
    tbISOmol_name: TStringField;
    procedure UniGUIMainModuleDestroy(Sender: TObject);
  private
    FIniFile : TIniFile;
    { Private declarations }
  public
    procedure LoadMoleculesList(pList : TStrings);
    procedure LoadIsotopList(pMoleculeName : string; pList : TStrings);
    procedure Get_M_I_Id(pMoleculeName : string; pIsotopologueName : string; var p_M : Integer; var p_I : Integer);


    { Public declarations }
  end;
procedure CheckError(pYes : Boolean; pMessage : string);
function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, Forms;

procedure CheckError(pYes : Boolean; pMessage : string);
begin
  if not pYes then
    raise Exception.Create(pMessage);
end;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.UniGUIMainModuleDestroy(Sender: TObject);
begin
  FIniFile.Free;
end;

procedure TUniMainModule.LoadMoleculesList(pList : TStrings);
begin
   pList.Clear;
   tbISO.First;
   while not tbISO.Eof do
   begin
     if pList.IndexOf(tbISO.FieldByName('mol_name').AsString) = -1 then
       pList.Add(tbISO.FieldByName('mol_name').AsString);
     tbISO.Next;
   end;
end;

procedure TUniMainModule.LoadIsotopList(pMoleculeName : string; pList : TStrings);
begin
   pList.Clear;
   tbISO.First;
   while not tbISO.Eof do
   begin
     if tbISO.FieldByName('mol_name').AsString = pMoleculeName then
     begin
       if pList.IndexOf(tbISO.FieldByName('iso_name').AsString) = -1 then
         pList.Add(tbISO.FieldByName('iso_name').AsString);
     end;
     tbISO.Next;
   end;
end;

procedure TUniMainModule.Get_M_I_Id(pMoleculeName : string; pIsotopologueName : string; var p_M : Integer; var p_I : Integer);
begin
   p_M := 0;
   p_I:= 0;
   tbISO.First;
   while not tbISO.Eof do
   begin
     if (tbISO.FieldByName('mol_name').AsString = pMoleculeName) and
       (tbISO.FieldByName('iso_name').AsString = pIsotopologueName) then
     begin
       p_M := tbISO.FieldByName('molecule_id').AsInteger;
       p_I := tbISO.FieldByName('isotopologue_id').AsInteger;
       Exit;
     end;
     tbISO.Next;
   end;
end;


initialization
  RegisterMainModuleClass(TUniMainModule);
end.

