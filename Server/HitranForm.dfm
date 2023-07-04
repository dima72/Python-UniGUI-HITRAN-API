object HitranFrm: THitranFrm
  Left = 0
  Top = 0
  ClientHeight = 619
  ClientWidth = 868
  Caption = 'Hitran'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Visible = True
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 868
    Height = 241
    Hint = ''
    Constraints.MinHeight = 213
    ActivePage = UniTabSheet1
    Align = alTop
    TabOrder = 0
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'Molecules'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object ctl_MoleculeCmb: TUniComboBox
        Left = 84
        Top = 28
        Width = 145
        Hint = ''
        Text = ''
        Items.Strings = (
          '')
        ItemIndex = 0
        TabOrder = 0
        IconItems = <>
      end
      object btnCalculate: TUniButton
        Left = 20
        Top = 171
        Width = 75
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Calculate'
        TabOrder = 1
        OnClick = btnCalculateClick
      end
      object UniRadioGroup1: TUniRadioGroup
        Left = 20
        Top = 56
        Width = 317
        Height = 49
        Hint = ''
        Items.Strings = (
          'Absorption Coefficient  Lorentz')
        ItemIndex = 0
        Caption = 'Function'
        TabOrder = 2
      end
      object UniLabel1: TUniLabel
        Left = 528
        Top = 103
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Diluent(air)'
        TabOrder = 3
      end
      object btnShowChart: TUniButton
        Left = 124
        Top = 171
        Width = 89
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Show Chart'
        TabOrder = 4
        OnClick = btnShowChartClick
      end
      object ctl_WavenumberMin: TUniSpinEdit
        Left = 384
        Top = 75
        Width = 83
        Hint = ''
        Value = 2000
        TabOrder = 5
        OnChange = ctl_WavenumberMinChange
      end
      object ctl_WavenumberMax: TUniSpinEdit
        Left = 528
        Top = 75
        Width = 87
        Hint = ''
        Value = 2100
        TabOrder = 6
        OnChange = ctl_WavenumberMinChange
      end
      object UniLabel2: TUniLabel
        Left = 384
        Top = 56
        Width = 83
        Height = 13
        Hint = ''
        Caption = 'Wavenumber min'
        TabOrder = 7
      end
      object UniLabel3: TUniLabel
        Left = 528
        Top = 56
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Wavenumber max'
        TabOrder = 8
      end
      object ed_Diluent: TUniComboBox
        Left = 528
        Top = 120
        Width = 87
        Hint = ''
        Text = 'ed_Diluent'
        Items.Strings = (
          '1.0'
          '0.1'
          '0.01'
          '0.001'
          '0.0001')
        ItemIndex = 0
        TabOrder = 9
        ForceSelection = True
        IconItems = <>
        OnChange = ctl_WavenumberMinChange
      end
      object UniLabel4: TUniLabel
        Left = 20
        Top = 22
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Molecule'
        TabOrder = 10
      end
      object ctl_IsotopologueCb: TUniComboBox
        Left = 344
        Top = 22
        Width = 145
        Hint = ''
        Text = ''
        Items.Strings = (
          '')
        ItemIndex = 0
        TabOrder = 11
        IconItems = <>
        OnChange = ctl_WavenumberMinChange
      end
      object UniLabel5: TUniLabel
        Left = 264
        Top = 24
        Width = 63
        Height = 13
        Hint = ''
        Caption = 'Isotopologue'
        TabOrder = 12
      end
    end
    object tbResult: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'tbResult'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
    end
  end
  object ctl_LogPythonMemo: TUniMemo
    Left = 0
    Top = 247
    Width = 868
    Height = 372
    Hint = ''
    Align = alClient
    TabOrder = 1
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 241
    Width = 868
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object UniTimer1: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 372
    Top = 232
  end
end
