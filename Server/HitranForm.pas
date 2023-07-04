unit HitranForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniMemo, uniButton,
  uniRadioButton, System.JSON, uniMultiItem, uniComboBox, uniLabel,
  uniMapKeys, uniPanel, uniHTMLFrame, uniPageControl, uniRadioGroup, IPC, IPC.Demo.Types,
  uniTimer, uniProgressBar, uniThreadTimer, uniEdit, uniSplitter, uniSpinEdit;
  //VCL.TMSLogging,
type
  THitranFrm = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    tbResult: TUniTabSheet;
    ctl_MoleculeCmb: TUniComboBox;
    btnCalculate: TUniButton;
    UniRadioGroup1: TUniRadioGroup;
    ctl_LogPythonMemo: TUniMemo;
    UniLabel1: TUniLabel;
    UniSplitter1: TUniSplitter;
    UniTimer1: TUniTimer;
    btnShowChart: TUniButton;
    ctl_WavenumberMin: TUniSpinEdit;
    ctl_WavenumberMax: TUniSpinEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    ed_Diluent: TUniComboBox;
    UniLabel4: TUniLabel;
    ctl_IsotopologueCb: TUniComboBox;
    UniLabel5: TUniLabel;
    procedure btnShowChartClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure UniTimer1Timer(Sender: TObject);
    procedure ctl_MoleculeCmbChange(Sender: TObject);
    procedure ctl_WavenumberMinChange(Sender: TObject);
  private
    FIPCClient : TIPCClient;
    FIPCServerName : string;
    FClientId : string;
    FCurrentMolecule : string;
    FCurrentFunctionProcessing : string;
    FChartIsReady : Boolean;
    FCurrentDiluentVal : string;
    FCurrentWnMin : string;
    FCurrentWnMax : string;
    FCurrentMoleculeId : Integer;
    FCurrentIsotopologueId : Integer;
    FCurrentIsotopologueName : string;
    function CalcParametersReady : Boolean;
    procedure ClientRecieveResponseIpcData(Sender: TObject;  var ResponseData: Pointer);
    procedure ProcessResponse;
    procedure EnableMoleculeTabControls;
    procedure DisableMoleculeTabControls;
    procedure ShowCurrentChart;
    procedure ChartIsReady;
    procedure ChartNotReady;
    procedure UpdateCalcReady;


    { Private declarations }
  public
    { Public declarations }
  end;

function HitranFrm: THitranFrm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, HitranChartForm, ServerModule;

function HitranFrm: THitranFrm;
begin
  Result := THitranFrm(UniMainModule.GetFormInstance(THitranFrm));
end;

procedure THitranFrm.ShowCurrentChart;
var
  a_ChartFrm : THitranChartFrm;
begin
//UniServerModule.UrlPath
  a_ChartFrm := THitranChartFrm.Create(UniApplication);              //147550703_20160_H2O_air_1_0_2000_2100_Chart.txt
  a_ChartFrm.FUrl := 'chart.html?chart=HitranData/data' + FClientId + '/charts/' + FClientId + '_'
    + FCurrentMolecule + '_' + IntToStr(FCurrentMoleculeId) + '_' + IntToStr(FCurrentIsotopologueId) + '_air_' + StringReplace(FCurrentDiluentVal, '.', '_', [rfReplaceAll])  + '_'
     + FCurrentWnMin + '_' + FCurrentWnMax + '_Chart.txt&title=Molecule%20:%20' + FCurrentMolecule + '%20%20Isotopologue%20:%20' +
     FCurrentIsotopologueName +'%20%20Wavenumber%20:%20(' +
      ctl_WavenumberMin.Text + '-' + ctl_WavenumberMax.Text + ')%20%20Diluent%20:%20' + ed_Diluent.Text;
 //a_ChartFrm.UniURLFrame1.Refresh;

  a_ChartFrm.Show;
end;

procedure THitranFrm.btnShowChartClick(Sender: TObject);
begin
  ShowCurrentChart;
end;

procedure THitranFrm.ProcessResponse;
var
  I : Integer;
begin
   { I := 0;
    while not FIPCClient.DoReadData do
    begin
      Sleep(100);
      Inc(I);
      if I > 20 then
        break;
    end;}
    I := 0;
    while FIPCClient.DoReadData do
    begin
      Application.ProcessMessages;
      Sleep(10);
      Inc(I);
      if I > 20 then
        break;
    end;
end;

procedure THitranFrm.btnCalculateClick(Sender: TObject);
var
  Data: TData;
  ResponseData: Pointer;
  I : Integer;
  SL : TStringList;
begin
  try
    CheckError(ed_Diluent.Text <> '', 'Diluent is Empty');
    CheckError(StrToFloatDef(ed_Diluent.Text, 0) <> 0, 'Diluent must be Float');
    FCurrentMolecule := Trim(ctl_MoleculeCmb.Items[ctl_MoleculeCmb.ItemIndex]);
    FCurrentIsotopologueName := ctl_IsotopologueCb.Items[ctl_IsotopologueCb.ItemIndex];

    UniMainModule.Get_M_I_Id(FCurrentMolecule, FCurrentIsotopologueName, FCurrentMoleculeId, FCurrentIsotopologueId);

    FCurrentDiluentVal := Trim(ed_Diluent.Text);
    FCurrentWnMin := IntToStr(ctl_WavenumberMin.Value);
    FCurrentWnMax := IntToStr(ctl_WavenumberMax.Value);


    SL := TStringList.Create;
    try
      Data.ProcessId := GetCurrentProcessId;
      SL.Add('absorptionCoefficient_LorentzCalc');
      SL.Add(FClientId);
      SL.Add(FCurrentMolecule);
      SL.Add(IntToStr(FCurrentMoleculeId));
      SL.Add(IntToStr(FCurrentIsotopologueId));
      SL.Add('air');
      SL.Add(FCurrentDiluentVal);
      SL.Add(FCurrentWnMin);
      SL.Add(FCurrentWnMax);
      Data.SetText(SL.Text);
    finally
      SL.Free;
    end;
    CheckError(FIPCClient.Send<TData>(FIPCServerName, Data, false, 10000, ResponseData),
        'Error send IPC data - ' + SysErrorMessage(FIPCClient.LastError));

    FCurrentFunctionProcessing := 'absorptionCoefficient_LorentzCalc';
    DisableMoleculeTabControls;

    ProcessResponse;
  except on E : Exception do
    ctl_LogPythonMemo.Lines.Add(E.Message);
  end;
end;


procedure THitranFrm.ClientRecieveResponseIpcData(Sender: TObject;
  var ResponseData: Pointer);
var
  a_Resp : string;
begin
  a_Resp := Trim(TResponseData(ResponseData^).Text);
  if a_Resp = 'OK' then
  begin
   // UniPageControl1.ActivePage := tbResult;
    EnableMoleculeTabControls;
    if FCurrentFunctionProcessing = 'absorptionCoefficient_LorentzCalc' then
    begin
      ChartIsReady;
      ShowCurrentChart;
      FCurrentFunctionProcessing := '';
    end;
  end;

  if Pos('Exception:', a_Resp) > 0 then
    EnableMoleculeTabControls;


  ctl_LogPythonMemo.Lines.Add(a_Resp);

  Application.ProcessMessages;
  ProcessResponse;
end;

procedure THitranFrm.ChartNotReady;
begin
  FChartIsReady := false;
  btnShowChart.Enabled := false;
end;

procedure THitranFrm.ctl_MoleculeCmbChange(Sender: TObject);
begin
  ChartNotReady;
  UniMainModule.LoadIsotopList(ctl_MoleculeCmb.Items[ctl_MoleculeCmb.ItemIndex], ctl_IsotopologueCb.Items);
  UpdateCalcReady;
end;

procedure THitranFrm.ctl_WavenumberMinChange(Sender: TObject);
begin
  ChartNotReady;
  UpdateCalcReady;
end;

procedure THitranFrm.DisableMoleculeTabControls;
begin
    ChartNotReady;
    btnCalculate.Enabled := false;
    ctl_MoleculeCmb.Enabled := false;
    ctl_IsotopologueCb.Enabled := false;
    ctl_WavenumberMin.Enabled := false;
    ctl_WavenumberMax.Enabled := false;
    UniRadioGroup1.Enabled := false;
    ed_Diluent.Enabled := false;
end;

function THitranFrm.CalcParametersReady : Boolean;
begin
  Result := (ctl_MoleculeCmb.ItemIndex <> -1) and (ctl_IsotopologueCb.ItemIndex <> -1);
end;

procedure THitranFrm.UpdateCalcReady;
begin
  btnCalculate.Enabled := CalcParametersReady;
end;

procedure THitranFrm.EnableMoleculeTabControls;
begin
    btnShowChart.Enabled := FChartIsReady;
    btnCalculate.Enabled := CalcParametersReady;
    ctl_MoleculeCmb.Enabled := true;
    ctl_IsotopologueCb.Enabled := true;
    ctl_WavenumberMin.Enabled := true;
    ctl_WavenumberMax.Enabled := true;
    UniRadioGroup1.Enabled := true;
    ed_Diluent.Enabled := true;
end;

procedure THitranFrm.ChartIsReady;
begin
    FChartIsReady := true;
    btnShowChart.Enabled := true;
end;

procedure THitranFrm.UniFormCreate(Sender: TObject);
var
  SL : TStringList;
  I : Integer;
  jv : TJSonValue;
  ja : TJSONArray;
begin
  try
   // TMSLogger.Trace('THitranFrm.UniFormCreate');
   { jv := Nil;
    SL := TStringList.Create;
    try
      SL.DefaultEncoding := TEncoding.UTF8;
      SL.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\HapiMeta.json');
      jv := TJSonObject.ParseJSONValue(SL.Text);
      ja := jv.FindValue('data') as TJSONArray;
      for I := 0 to ja.Count-1 do
      begin
         UniComboBox1.Items.Add(ja.GetValue<string>('['+ IntToStr(I) +'].common_name'));
      end;
    finally
      SL.Free;
      if Assigned(jv) then
        jv.Free;
    end;}

    FIPCClient := TIPCClient.Create(Self);
    FIPCClient.OnRecieveResponseIpcData := ClientRecieveResponseIpcData;
    FClientId := IntToStr(GetTickCount) + '_' +IntToStr(GetCurrentThreadID());
    if not FIPCClient.CreateClient('IPCClient' + FClientId) then
      ctl_LogPythonMemo.Lines.Add('Error create client "' + 'IPC Client' + '" - ' + SysErrorMessage(FIPCClient.LastError));
    FIPCServerName := FIPCClient.CreateIPCServer('Hitran.exe', 'IPCServ' + FClientId, SW_SHOW);
    ctl_LogPythonMemo.Lines.Add('IPC Server :' + FIPCServerName + ' connected');

    DisableMoleculeTabControls;
    UniMainModule.LoadMoleculesList(ctl_MoleculeCmb.Items);
    ctl_MoleculeCmb.ItemIndex := 0;
    UniMainModule.LoadIsotopList(ctl_MoleculeCmb.Items[ctl_MoleculeCmb.ItemIndex], ctl_IsotopologueCb.Items);
    ctl_MoleculeCmb.OnChange := ctl_MoleculeCmbChange;
    UniTimer1.Enabled := true;
  except on E: Exception do
    ctl_LogPythonMemo.Lines.Add(E.Message);
  end;
end;

procedure THitranFrm.UniTimer1Timer(Sender: TObject);
begin
    ProcessResponse;
    Application.ProcessMessages;
end;

end.
