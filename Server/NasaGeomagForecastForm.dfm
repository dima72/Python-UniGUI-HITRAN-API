object NasaGeomagForecastFrm: TNasaGeomagForecastFrm
  Left = 0
  Top = 0
  ClientHeight = 753
  ClientWidth = 1439
  Caption = 'Nasa Geomag Forecast'
  OnShow = UniFormShow
  FormStyle = fsMDIChild
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Visible = True
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniChart1: TUniChart
    Left = 0
    Top = 0
    Width = 1439
    Height = 488
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Title.Text.Strings = (
      'Geomagnetic Forecast'
      
        'Prepared by the U.S. Dept. of Commerce, NOAA, Space Weather Pred' +
        'iction Center')
    LayoutConfig.BodyPadding = '10'
    Align = alClient
    object UniLineSeries1: TUniLineSeries
      Colors.Strings = (
        '#0000FF'
        '#00FF00'
        '#FF0000'
        '#00FFFF'
        '#FFFF00'
        '#FF00FF')
      Title = 'Magn'
      SeriesLabel.Orientation = tloVertical
      DataSource = DataSource1
      YValues.ValueSource = 'FORECAST_VAL'
      XLabelsSource = 'FORECAST_DATE'
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 488
    Width = 1439
    Height = 265
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    object btnLoadChart: TUniButton
      Left = 520
      Top = 54
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Load Chart'
      TabOrder = 1
      OnClick = btnLoadChartClick
    end
    object ctl_UniCalendarFromDate: TUniCalendar
      Left = 16
      Top = 32
      Width = 225
      Height = 217
      Hint = ''
      Date = 44943.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 2
    end
    object UniLabel1: TUniLabel
      Left = 40
      Top = 13
      Width = 50
      Height = 13
      Hint = ''
      Caption = 'From Date'
      TabOrder = 3
    end
    object ctl_UniCalendarToDate: TUniCalendar
      Left = 272
      Top = 32
      Width = 225
      Height = 217
      Hint = ''
      Date = 44943.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 4
    end
    object UniLabel2: TUniLabel
      Left = 296
      Top = 13
      Width = 38
      Height = 13
      Hint = ''
      Caption = 'To Date'
      TabOrder = 5
    end
    object cb_ShowMarkers: TUniCheckBox
      Left = 520
      Top = 200
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Show Markers'
      TabOrder = 6
      OnClick = cb_ShowMarkersClick
    end
  end
  object XDataset1: TXDataset
    SQL.Strings = (
      
        'SELECT * FROM magn24 WHERE FORECAST_DATE between :pFromDate and ' +
        ':pToDate')
    Params = <
      item
        DataType = ftDateTime
        Name = 'pFromDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pToDate'
        ParamType = ptInput
      end>
    Left = 480
    Top = 112
    object XDataset1ID: TAutoIncField
      FieldName = 'ID'
    end
    object XDataset1FORECAST_DATE: TDateTimeField
      FieldName = 'FORECAST_DATE'
      Required = True
    end
    object XDataset1FORECAST_VAL: TFloatField
      FieldName = 'FORECAST_VAL'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = XDataset1
    Left = 384
    Top = 112
  end
end
