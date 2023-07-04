object AboutFrm: TAboutFrm
  Left = 0
  Top = 0
  ClientHeight = 262
  ClientWidth = 573
  Caption = 'About'
  BorderStyle = bsDialog
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object UniLabel1: TUniLabel
    Left = 112
    Top = 32
    Width = 341
    Height = 13
    Hint = ''
    Caption = 
      'For the devepopment of this application, please contact Dmitry K' +
      'onnov'
    TabOrder = 0
  end
  object UniLabel2: TUniLabel
    Left = 216
    Top = 64
    Width = 136
    Height = 13
    Hint = ''
    Caption = '<konnov@knights.ucf.edu>'
    TabOrder = 1
  end
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 24
    Top = 105
    Width = 529
    Height = 97
    Hint = ''
    HTML.Strings = (
      '<html>'
      '<header>'
      '</header>'
      '<body>'
      '    <p>Acknowledgement @</p>'
      
        '    <p>R.V. Kochanov, I.E. Gordon, L.S. Rothman, P. Wcislo, C. H' +
        'ill, J.S. Wilzewski, HITRAN Application Programming Interface (H' +
        'API): A comprehensive approach to working with spectroscopic dat' +
        'a, J. Quant. '
      
        '    Spectrosc. Radiat. Transfer 177, 15-30 (2016) <a href="https' +
        '://www.sciencedirect.com/science/article/abs/pii/S00224073153024' +
        '66?via%3Dihub" target="_blank" rel="noopener noreferrer">[Link t' +
        'o article]</a> <a href="https://ui.adsabs.harvard.edu/abs/2016JQ' +
        'SRT.177...15K/abstract" target="_blank" rel="noopener noreferrer' +
        '">[ADS]</a>.</p>'
      '</body>'
      '</html>')
    StaticHTML = True
  end
  object btnOK: TUniButton
    Left = 478
    Top = 224
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
end
