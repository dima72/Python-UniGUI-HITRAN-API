object Form1: TForm1
  Left = 258
  Top = 128
  Caption = 'IPC Client'
  ClientHeight = 262
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    726
    262)
  TextHeight = 13
  object lblIPCServerName: TLabel
    Left = 152
    Top = 241
    Width = 86
    Height = 13
    Caption = 'lblIPCServerName'
  end
  object btnSend: TButton
    Left = 8
    Top = 236
    Width = 117
    Height = 26
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akBottom]
    Caption = 'Send IPC Data'
    TabOrder = 1
    OnClick = btnSendClick
    ExplicitTop = 160
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 712
    Height = 217
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 434
    ExplicitHeight = 141
  end
end
