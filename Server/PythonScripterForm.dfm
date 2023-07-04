object PythonScripterFrm: TPythonScripterFrm
  Left = 0
  Top = 0
  ClientHeight = 505
  ClientWidth = 628
  Caption = 'PythonScripterFrm'
  FormStyle = fsMDIChild
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Visible = True
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ctl_ResultMemo: TUniMemo
    Left = 0
    Top = 0
    Width = 628
    Height = 217
    Hint = ''
    Align = alTop
    TabOrder = 0
  end
  object UniSplitter1: TUniSplitter
    Left = 0
    Top = 217
    Width = 628
    Height = 6
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object ctl_SourceMemo: TUniMemo
    Left = 0
    Top = 223
    Width = 628
    Height = 217
    Hint = ''
    Lines.Strings = (
      'print(2+2)')
    Align = alTop
    TabOrder = 2
  end
  object btnExecute: TUniButton
    Left = 32
    Top = 464
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Execute'
    TabOrder = 3
    OnClick = btnExecuteClick
  end
  object btnLoadSctipt: TUniButton
    Left = 136
    Top = 464
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Load Script'
    TabOrder = 4
    OnClick = btnLoadSctiptClick
  end
  object UniFileUpload1: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please select a file'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUpload1Completed
    Left = 312
    Top = 384
  end
  object UniTimer1: TUniTimer
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 240
    Top = 80
  end
end
