object frmRelatorioPrint: TfrmRelatorioPrint
  Left = 0
  Top = 0
  Caption = 'frmRelatorioPrint'
  ClientHeight = 445
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object relAbastecimentos: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dm.dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de abastecimentos'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 40
      BandType = btHeader
      object RLLabel1: TRLLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        Align = faClient
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        AlignWithMargins = True
        Left = 631
        Top = 0
        Width = 87
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        Info = itNow
        Text = ''
      end
    end
    object footerAbastecimentos: TRLBand
      Left = 38
      Top = 188
      Width = 718
      Height = 20
      BandType = btFooter
      object RLSystemInfo2: TRLSystemInfo
        AlignWithMargins = True
        Left = 631
        Top = 0
        Width = 87
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 78
      Width = 718
      Height = 90
      DataFields = 'AB_DATA'
      object colHeaderAbastecimentos: TRLBand
        Left = 0
        Top = 20
        Width = 718
        Height = 20
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel3: TRLLabel
          AlignWithMargins = True
          Left = 114
          Top = 1
          Width = 80
          Height = 16
          Alignment = taCenter
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          AlignWithMargins = True
          Left = 344
          Top = 1
          Width = 80
          Height = 16
          Alignment = taCenter
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          AlignWithMargins = True
          Left = 424
          Top = 1
          Width = 80
          Height = 16
          Alignment = taCenter
          Caption = 'Bico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          AlignWithMargins = True
          Left = 504
          Top = 1
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          AlignWithMargins = True
          Left = 194
          Top = 1
          Width = 150
          Height = 16
          Caption = 'Combust'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object detailAbastecimentos: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 20
        object RLDBText2: TRLDBText
          Left = 114
          Top = 1
          Width = 82
          Height = 16
          Alignment = taCenter
          DataField = 'AB_TANQUE'
          DataSource = dm.dsRelatorio
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 195
          Top = 1
          Width = 96
          Height = 16
          DataField = 'COMBUSTIVEL'
          DataSource = dm.dsRelatorio
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 346
          Top = 1
          Width = 78
          Height = 16
          Alignment = taCenter
          DataField = 'AB_BOMBA'
          DataSource = dm.dsRelatorio
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 435
          Top = 1
          Width = 60
          Height = 16
          Alignment = taCenter
          DataField = 'AB_BICO'
          DataSource = dm.dsRelatorio
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 510
          Top = 1
          Width = 95
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = dm.dsRelatorio
          Text = ''
        end
      end
      object colFooterAbastecimentos: TRLBand
        Left = 0
        Top = 60
        Width = 718
        Height = 30
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 464
          Top = 1
          Width = 140
          Height = 16
          Alignment = taRightJustify
          ComputeNulls = False
          DataField = 'VALOR_TOTAL'
          DataSource = dm.dsRelatorio
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel8: TRLLabel
          AlignWithMargins = True
          Left = 414
          Top = 1
          Width = 90
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total do dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object headerAbastecimentos: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 20
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel2: TRLLabel
          AlignWithMargins = True
          Left = 10
          Top = 1
          Width = 38
          Height = 16
          Alignment = taCenter
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 50
          Top = 1
          Width = 100
          Height = 16
          Alignment = taCenter
          DataField = 'AB_DATA'
          DataSource = dm.dsRelatorio
          Text = ''
          Transparent = False
        end
      end
    end
    object colFooterTotAbastecimentos: TRLBand
      Left = 38
      Top = 168
      Width = 718
      Height = 20
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult2: TRLDBResult
        Left = 464
        Top = 1
        Width = 140
        Height = 16
        Alignment = taRightJustify
        ComputeNulls = False
        DataField = 'VALOR_TOTAL'
        DataSource = dm.dsRelatorio
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        AlignWithMargins = True
        Left = 414
        Top = 1
        Width = 90
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
