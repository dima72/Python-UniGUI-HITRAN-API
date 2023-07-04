unit NasaGeomagForecastForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, DateUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  Data.DB, uniButton, RemoteDB.Client.Dataset, RemoteDB.Client.Database,
  uniChart, uniPanel, uniSplitter, uniCalendar, uniCheckBox, uniLabel;
  // VCL.TMSLogging;

type
  TNasaGeomagForecastFrm = class(TUniForm)
    XDataset1: TXDataset;
    DataSource1: TDataSource;
    XDataset1ID: TAutoIncField;
    XDataset1FORECAST_DATE: TDateTimeField;
    XDataset1FORECAST_VAL: TFloatField;
    UniChart1: TUniChart;
    UniLineSeries1: TUniLineSeries;
    UniPanel1: TUniPanel;
    btnLoadChart: TUniButton;
    ctl_UniCalendarFromDate: TUniCalendar;
    UniLabel1: TUniLabel;
    ctl_UniCalendarToDate: TUniCalendar;
    UniLabel2: TUniLabel;
    cb_ShowMarkers: TUniCheckBox;
    procedure btnLoadChartClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure cb_ShowMarkersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function NasaGeomagForecastFrm: TNasaGeomagForecastFrm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function NasaGeomagForecastFrm: TNasaGeomagForecastFrm;
begin
  Result := TNasaGeomagForecastFrm(UniMainModule.GetFormInstance(TNasaGeomagForecastFrm));
end;

procedure TNasaGeomagForecastFrm.btnLoadChartClick(Sender: TObject);
begin
  UniMainModule.CheckRemoteDBConnected;
  XDataset1.Active := false;
  XDataset1.Params.ParamByName('pFromDate').AsDate := ctl_UniCalendarFromDate.Date;
  XDataset1.Params.ParamByName('pToDate').AsDate := ctl_UniCalendarToDate.Date;
  XDataset1.Active := true;
  UniChart1.RefreshData;
end;

procedure TNasaGeomagForecastFrm.cb_ShowMarkersClick(Sender: TObject);
begin
  with UniChart1 do
  begin
    JSInterface.JSCall('chart.getSeries()['+ IntToStr(SeriesList.IndexOf(UniLineSeries1)) +'].setShowMarkers', [cb_ShowMarkers.Checked]); //OnClick event True/False
    if not IsLoading then
      JSInterface.JSCall('chart.redraw', []);
  end;
end;

procedure TNasaGeomagForecastFrm.UniFormCreate(Sender: TObject);
begin
  //TMSLogger.Trace('TNasaGeomagForecastFrm.UniFormCreate');
end;

procedure TNasaGeomagForecastFrm.UniFormReady(Sender: TObject);
begin
  with UniChart1 do
  begin
    JSInterface.JSCall('chart.getSeries()['+ IntToStr(SeriesList.IndexOf(UniLineSeries1)) +'].setShowMarkers', [False]); //OnClick event True/False
    if not IsLoading then
      JSInterface.JSCall('chart.redraw', []);
  end;
end;

procedure TNasaGeomagForecastFrm.UniFormShow(Sender: TObject);
begin
  ctl_UniCalendarFromDate.Date := IncMonth(Now(), -1);
  ctl_UniCalendarFromDate.Update;
  ctl_UniCalendarToDate.Date := IncDay(Now(), 4);
  ctl_UniCalendarToDate.Update;
  XDataset1.Database := UniMainModule.RemoteDBDatabase1;
//  UniLineSeries1.ShowMarkers := true;//cb_ShowMarkers.Checked;

end;



//$orderby=ID desc
end.
