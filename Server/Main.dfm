object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 804
  ClientWidth = 1357
  Caption = 'MainForm'
  WindowState = wsMaximized
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Menu = UniMainMenu1
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  PixelsPerInch = 96
  TextHeight = 13
  object UniToolBar1: TUniToolBar
    Left = 0
    Top = 0
    Width = 1357
    Height = 37
    Hint = ''
    ButtonHeight = 36
    ButtonWidth = 166
    ShowCaptions = True
    TabOrder = 0
    ParentColor = False
    Color = clAppWorkSpace
    ParentFont = False
    Font.Style = [fsBold]
    object UniToolButton1: TUniToolButton
      Left = 0
      Top = 0
      Action = acHitran
      TabOrder = 1
    end
    object UniToolButton3: TUniToolButton
      Left = 166
      Top = 0
      Action = acNasaGeomagForecast
      TabOrder = 2
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 37
    Width = 521
    Height = 767
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alLeft
    TabOrder = 1
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Iso id'
        Width = 40
      end
      item
        FieldName = 'molecule_id'
        Title.Caption = 'M'
        Width = 32
      end
      item
        FieldName = 'isotopologue_id'
        Title.Caption = 'I'
        Width = 21
      end
      item
        FieldName = 'iso_name'
        Title.Caption = 'Iso Name'
        Width = 108
      end
      item
        FieldName = 'abundance'
        Title.Caption = 'Abundance'
        Width = 106
      end
      item
        FieldName = 'mass'
        Title.Caption = 'Mass'
        Width = 64
      end
      item
        FieldName = 'mol_name'
        Title.Caption = 'Molecule'
        Width = 95
      end>
  end
  object UniLabel1: TUniLabel
    Left = 936
    Top = 64
    Width = 779
    Height = 33
    Hint = ''
    Caption = 
      'The application works only 5 min due to license restriction, sor' +
      'ry..'
    ParentFont = False
    Font.Color = clRed
    Font.Height = -27
    ParentColor = False
    Color = clGray
    TabOrder = 2
  end
  object UniMainMenu1: TUniMainMenu
    Left = 56
    Top = 72
    object File1: TUniMenuItem
      Caption = 'File'
      object Hitran1: TUniMenuItem
        Caption = 'Hitran'
        OnClick = acHitranExecute
      end
      object NasaGeomagneticForecast1: TUniMenuItem
        Action = acNasaGeomagForecast
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Action = acAbout
      end
    end
    object TUniMenuItem
      Caption = ''
    end
  end
  object UniActionList1: TUniActionList
    Left = 176
    Top = 64
    object acPythonScripter: TAction
      Caption = 'Python Scripter'
      OnExecute = acPythonScripterExecute
    end
    object acHitran: TAction
      Caption = 'Hitran'
      OnExecute = acHitranExecute
    end
    object acAbout: TAction
      Caption = 'About'
      OnExecute = acAboutExecute
    end
    object acNasaGeomagForecast: TAction
      Caption = '    Nasa Geomagnetic Forecast    '
      OnExecute = acNasaGeomagForecastExecute
    end
  end
  object DataSource1: TDataSource
    DataSet = UniMainModule.tbISO
    Left = 424
    Top = 264
  end
end
