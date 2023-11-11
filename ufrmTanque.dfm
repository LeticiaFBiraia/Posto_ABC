object frmTanques: TfrmTanques
  Left = 0
  Top = 0
  Caption = 'Tanques'
  ClientHeight = 465
  ClientWidth = 586
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
    AlignWithMargins = True
    Left = 3
    Top = 86
    Width = 580
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 19.034480736229080000
      end
      item
        Value = 61.929607432723810000
      end
      item
        Value = 19.035911831047110000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Label1
        Row = 0
      end
      item
        Column = 1
        Control = Label2
        Row = 0
      end
      item
        Column = 1
        Control = cmbCombustivel
        Row = 1
      end
      item
        Column = 2
        Control = Label3
        Row = 0
      end
      item
        Column = 0
        Control = edtTanque
        Row = 1
      end
      item
        Column = 2
        Control = edtValor
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
    ExplicitWidth = 578
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 104
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Tanque'
      ExplicitWidth = 38
      ExplicitHeight = 15
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 113
      Top = 0
      Width = 354
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Combust'#237'vel'
      ExplicitLeft = 114
      ExplicitWidth = 67
      ExplicitHeight = 15
    end
    object cmbCombustivel: TComboBox
      AlignWithMargins = True
      Left = 113
      Top = 21
      Width = 354
      Height = 23
      Align = alClient
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        'Gasolina'
        #211'leo Diesel'
        'Etanol')
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 473
      Top = 0
      Width = 104
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Valor de Venda'
      ExplicitLeft = 474
      ExplicitWidth = 77
      ExplicitHeight = 15
    end
    object edtTanque: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 21
      Width = 104
      Height = 21
      Align = alClient
      TabOrder = 0
      Text = 'edtTanque'
      OnExit = edtTanqueExit
      OnKeyPress = edtTanqueKeyPress
      ExplicitHeight = 23
    end
    object edtValor: TEdit
      AlignWithMargins = True
      Left = 473
      Top = 21
      Width = 104
      Height = 21
      Align = alClient
      Alignment = taRightJustify
      TabOrder = 2
      Text = 'edtValor'
      OnExit = edtValorExit
      OnKeyPress = edtValorKeyPress
      ExplicitLeft = 471
      ExplicitHeight = 23
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 580
    Height = 41
    Align = alTop
    Caption = 'Cadastro de Tanques'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 578
  end
  object gridTanque: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 137
    Width = 580
    Height = 325
    Align = alClient
    DataSource = dsTanque
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = gridTanqueTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TQ_NUMERO'
        Title.Caption = 'Tanque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMBUSTIVEL'
        Title.Caption = 'Combust'#237'vel'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TQ_VALOR'
        Title.Caption = 'Valor de Venda'
        Visible = True
      end>
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 580
    Height = 30
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 578
    object btnInserir: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 166
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      AlignWithMargins = True
      Left = 501
      Top = 4
      Width = 75
      Height = 22
      Align = alRight
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
      ExplicitLeft = 499
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 294
      Top = 4
      Width = 75
      Height = 22
      Margins.Left = 50
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      AlignWithMargins = True
      Left = 375
      Top = 4
      Width = 75
      Height = 22
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnSalvarClick
    end
  end
  object dsTanque: TDataSource
    DataSet = dm.qryTanque
    OnDataChange = dsTanqueDataChange
    Left = 40
    Top = 200
  end
end
