object frmAbastecimentos: TfrmAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Abastecimentos'
  ClientHeight = 442
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 780
    Height = 41
    Align = alTop
    Caption = 'Abastecimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 778
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 86
    Width = 780
    Height = 70
    Align = alTop
    Caption = ' Gerar abastecimento '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 778
    object GridPanel2: TGridPanel
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 674
      Height = 45
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 12.820512820512870000
        end
        item
          Value = 12.820512820512870000
        end
        item
          Value = 12.820512820512870000
        end
        item
          Value = 23.076923076923120000
        end
        item
          Value = 12.820512820512870000
        end
        item
          Value = 12.820512820512700000
        end
        item
          Value = 12.820512820512690000
        end>
      ControlCollection = <
        item
          Column = 3
          Control = Label4
          Row = 0
        end
        item
          Column = 0
          Control = Label5
          Row = 0
        end
        item
          Column = 1
          Control = Label6
          Row = 0
        end
        item
          Column = 0
          Control = lkpBomba
          Row = 1
        end
        item
          Column = 1
          Control = lkpBico
          Row = 1
        end
        item
          Column = 3
          Control = edtCombustivel
          Row = 1
        end
        item
          Column = 4
          Control = Label7
          Row = 0
        end
        item
          Column = 5
          Control = Label8
          Row = 0
        end
        item
          Column = 6
          Control = Label9
          Row = 0
        end
        item
          Column = 4
          Control = edtQuantidade
          Row = 1
        end
        item
          Column = 5
          Control = edtValor
          Row = 1
        end
        item
          Column = 6
          Control = edtTotal
          Row = 1
        end
        item
          Column = 2
          Control = Label2
          Row = 0
        end
        item
          Column = 2
          Control = edtTanque
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
      ExplicitWidth = 672
      object Label4: TLabel
        AlignWithMargins = True
        Left = 262
        Top = 0
        Width = 150
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Combust'#237'vel'
        ExplicitLeft = 263
        ExplicitWidth = 67
        ExplicitHeight = 15
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Bomba'
        ExplicitWidth = 38
        ExplicitHeight = 15
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 89
        Top = 0
        Width = 81
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Bico'
        ExplicitLeft = 90
        ExplicitWidth = 23
        ExplicitHeight = 15
      end
      object lkpBomba: TDBLookupComboBox
        AlignWithMargins = True
        Left = 3
        Top = 21
        Width = 80
        Height = 23
        Align = alClient
        DropDownRows = 20
        KeyField = 'BB_BOMBA'
        ListField = 'BB_BOMBA'
        ListSource = dsBomba
        TabOrder = 0
        OnClick = lkpBombaClick
      end
      object lkpBico: TDBLookupComboBox
        AlignWithMargins = True
        Left = 89
        Top = 21
        Width = 81
        Height = 23
        Align = alClient
        DropDownRows = 20
        KeyField = 'BB_BICO'
        ListField = 'BB_BICO'
        ListSource = dsBico
        TabOrder = 1
        OnClick = lkpBicoClick
      end
      object edtCombustivel: TEdit
        AlignWithMargins = True
        Left = 262
        Top = 21
        Width = 150
        Height = 21
        Align = alClient
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        ExplicitHeight = 23
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 418
        Top = 0
        Width = 80
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Quantidade'
        ExplicitLeft = 419
        ExplicitWidth = 62
        ExplicitHeight = 15
      end
      object Label8: TLabel
        AlignWithMargins = True
        Left = 504
        Top = 0
        Width = 81
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Valor'
        ExplicitLeft = 506
        ExplicitWidth = 26
        ExplicitHeight = 15
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 591
        Top = 0
        Width = 80
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Total'
        ExplicitLeft = 592
        ExplicitWidth = 25
        ExplicitHeight = 15
      end
      object edtQuantidade: TEdit
        AlignWithMargins = True
        Left = 418
        Top = 21
        Width = 80
        Height = 21
        Align = alClient
        TabOrder = 4
        OnExit = edtQuantidadeExit
        OnKeyPress = edtQuantidadeKeyPress
        ExplicitHeight = 23
      end
      object edtValor: TEdit
        AlignWithMargins = True
        Left = 504
        Top = 21
        Width = 81
        Height = 21
        Align = alClient
        Enabled = False
        ReadOnly = True
        TabOrder = 5
        ExplicitHeight = 23
      end
      object edtTotal: TEdit
        AlignWithMargins = True
        Left = 591
        Top = 21
        Width = 80
        Height = 21
        Align = alClient
        Enabled = False
        ReadOnly = True
        TabOrder = 6
        ExplicitHeight = 23
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 176
        Top = 0
        Width = 80
        Height = 18
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Tanque'
        ExplicitWidth = 38
        ExplicitHeight = 15
      end
      object edtTanque: TEdit
        AlignWithMargins = True
        Left = 176
        Top = 21
        Width = 80
        Height = 21
        Align = alClient
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        ExplicitHeight = 23
      end
    end
    object btnGerarAbastecimento: TButton
      AlignWithMargins = True
      Left = 685
      Top = 20
      Width = 90
      Height = 45
      Align = alRight
      Caption = 'Gerar abastecimento'
      TabOrder = 1
      WordWrap = True
      OnClick = btnGerarAbastecimentoClick
      ExplicitLeft = 683
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 159
    Width = 786
    Height = 283
    Align = alClient
    Caption = ' Gerenciamento dos abastecimentos '
    TabOrder = 2
    ExplicitWidth = 784
    ExplicitHeight = 279
    object Panel2: TPanel
      Left = 2
      Top = 17
      Width = 782
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 780
      object btnPesquisar: TButton
        AlignWithMargins = True
        Left = 689
        Top = 3
        Width = 90
        Height = 41
        Align = alRight
        Caption = 'Pesquisar'
        TabOrder = 0
        OnClick = btnPesquisarClick
        ExplicitLeft = 687
      end
      object GridPanel1: TGridPanel
        Left = 0
        Top = 0
        Width = 686
        Height = 47
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 27.272727272727270000
          end
          item
            Value = 18.181818181818180000
          end
          item
            Value = 18.181818181818180000
          end
          item
            Value = 18.181818181818180000
          end
          item
            Value = 18.181818181818180000
          end>
        ControlCollection = <
          item
            Column = 3
            Control = Label1
            Row = 0
          end
          item
            Column = 1
            Control = lkpPesqBomba
            Row = 1
          end
          item
            Column = 2
            Control = lkpPesqBico
            Row = 1
          end
          item
            Column = 4
            Control = Label10
            Row = 0
          end
          item
            Column = 3
            Control = edtDataIni
            Row = 1
          end
          item
            Column = 4
            Control = edtDataFin
            Row = 1
          end
          item
            Column = 0
            Control = lkpPesqTanque
            Row = 1
          end
          item
            Column = 0
            Control = chkTanque
            Row = 0
          end
          item
            Column = 1
            Control = chkBomba
            Row = 0
          end
          item
            Column = 2
            Control = chkBico
            Row = 0
          end>
        RowCollection = <
          item
            Value = 40.000000000000000000
          end
          item
            Value = 60.000000000000010000
          end>
        TabOrder = 1
        ExplicitWidth = 684
        object Label1: TLabel
          AlignWithMargins = True
          Left = 440
          Top = 0
          Width = 118
          Height = 19
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Data Inicial'
          ExplicitLeft = 441
          ExplicitWidth = 58
          ExplicitHeight = 15
        end
        object lkpPesqBomba: TDBLookupComboBox
          AlignWithMargins = True
          Left = 190
          Top = 22
          Width = 119
          Height = 23
          Align = alClient
          DropDownRows = 20
          KeyField = 'BB_BOMBA'
          ListField = 'BB_BOMBA'
          ListSource = dsBombaPesq
          TabOrder = 3
        end
        object lkpPesqBico: TDBLookupComboBox
          AlignWithMargins = True
          Left = 315
          Top = 22
          Width = 119
          Height = 23
          Align = alClient
          DropDownRows = 20
          KeyField = 'BB_BICO'
          ListField = 'BB_BICO'
          ListSource = dsBicoPesq
          TabOrder = 5
        end
        object Label10: TLabel
          AlignWithMargins = True
          Left = 564
          Top = 0
          Width = 119
          Height = 19
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Data Final'
          ExplicitLeft = 566
          ExplicitWidth = 52
          ExplicitHeight = 15
        end
        object edtDataIni: TDateTimePicker
          AlignWithMargins = True
          Left = 440
          Top = 22
          Width = 118
          Height = 22
          Align = alClient
          Date = 45239.000000000000000000
          Time = 0.755925497687712800
          TabOrder = 6
        end
        object edtDataFin: TDateTimePicker
          AlignWithMargins = True
          Left = 564
          Top = 22
          Width = 119
          Height = 22
          Align = alClient
          Date = 45239.000000000000000000
          Time = 0.756144293984107200
          TabOrder = 7
        end
        object lkpPesqTanque: TDBLookupComboBox
          AlignWithMargins = True
          Left = 3
          Top = 22
          Width = 181
          Height = 23
          Align = alClient
          DropDownRows = 20
          KeyField = 'TQ_NUMERO'
          ListField = 'TQ_NUMERO;COMBUSTIVEL'
          ListSource = dsTanque
          TabOrder = 1
        end
        object chkTanque: TCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 181
          Height = 19
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Tanque'
          TabOrder = 0
          OnClick = chkTanqueClick
        end
        object chkBomba: TCheckBox
          AlignWithMargins = True
          Left = 190
          Top = 0
          Width = 119
          Height = 19
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Bomba'
          TabOrder = 2
          OnClick = chkBombaClick
        end
        object chkBico: TCheckBox
          AlignWithMargins = True
          Left = 315
          Top = 0
          Width = 119
          Height = 19
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Bico'
          TabOrder = 4
          OnClick = chkBicoClick
        end
      end
    end
    object gridAbastecimentos: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 67
      Width = 776
      Height = 211
      Align = alClient
      DataSource = dsAbastecimentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'AB_DATA'
          Title.Caption = 'Data'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_HORA'
          Title.Caption = 'Hora'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_TANQUE'
          Title.Caption = 'Tanque'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMBUSTIVEL'
          Title.Caption = 'Combust'#237'vel'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_BOMBA'
          Title.Caption = 'Bomba'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_BICO'
          Title.Caption = 'Bico'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_QUANTIDADE'
          Title.Caption = 'Quantidade'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_VALOR_UNITARIO'
          Title.Caption = 'Valor'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Total'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AB_IMPOSTO'
          Title.Caption = 'Imposto'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_LIQUIDO'
          Title.Caption = 'Valor L'#237'quido'
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 780
    Height = 30
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 778
    object btnSair: TButton
      AlignWithMargins = True
      Left = 686
      Top = 4
      Width = 90
      Height = 22
      Align = alRight
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
      ExplicitLeft = 684
    end
  end
  object dsTanque: TDataSource
    DataSet = dm.qryTanque
    Left = 348
    Top = 313
  end
  object dsBomba: TDataSource
    DataSet = dm.qryBomba
    Left = 153
    Top = 313
  end
  object dsBico: TDataSource
    DataSet = dm.qryBico
    Left = 251
    Top = 313
  end
  object dsBombaPesq: TDataSource
    DataSet = dm.qryBombaPesq
    Left = 446
    Top = 313
  end
  object dsBicoPesq: TDataSource
    DataSet = dm.qryBicoPesq
    Left = 544
    Top = 313
  end
  object dsAbastecimentos: TDataSource
    DataSet = dm.qryAbastecimentos
    Left = 56
    Top = 313
  end
end
