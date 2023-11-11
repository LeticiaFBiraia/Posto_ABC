object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Relat'#243'rio de abastecimentos'
  ClientHeight = 128
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GridPanel1: TGridPanel
    Left = 0
    Top = 47
    Width = 249
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Label1
        Row = 0
      end
      item
        Column = 1
        Control = Label10
        Row = 0
      end
      item
        Column = 0
        Control = edtDataIni
        Row = 1
      end
      item
        Column = 1
        Control = edtDataFin
        Row = 1
      end>
    RowCollection = <
      item
        Value = 40.000000000000000000
      end
      item
        Value = 60.000000000000010000
      end>
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 118
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Data Inicial'
      ExplicitWidth = 58
      ExplicitHeight = 15
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 127
      Top = 0
      Width = 119
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Data Final'
      ExplicitWidth = 52
      ExplicitHeight = 15
    end
    object edtDataIni: TDateTimePicker
      AlignWithMargins = True
      Left = 3
      Top = 21
      Width = 118
      Height = 21
      Align = alClient
      Date = 45239.000000000000000000
      Time = 0.755925497687712800
      TabOrder = 0
    end
    object edtDataFin: TDateTimePicker
      AlignWithMargins = True
      Left = 127
      Top = 21
      Width = 119
      Height = 21
      Align = alClient
      Date = 45239.000000000000000000
      Time = 0.756144293984107200
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 243
    Height = 41
    Align = alTop
    Caption = 'Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 243
    Height = 30
    Align = alTop
    TabOrder = 2
    ExplicitLeft = -531
    ExplicitTop = 50
    ExplicitWidth = 780
    object btnSair: TButton
      AlignWithMargins = True
      Left = 149
      Top = 4
      Width = 90
      Height = 22
      Align = alRight
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
      ExplicitLeft = 686
    end
    object btnGerarAbastecimento: TButton
      AlignWithMargins = True
      Left = 53
      Top = 4
      Width = 90
      Height = 22
      Align = alRight
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = btnGerarAbastecimentoClick
      ExplicitLeft = 119
    end
  end
end
