object frmBombasBico: TfrmBombasBico
  Left = 0
  Top = 0
  Caption = 'Bombas e Bicos'
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
        Value = 25.196850393700790000
      end
      item
        Value = 25.196850393700790000
      end
      item
        Value = 49.606299212598430000
      end>
    ControlCollection = <
      item
        Column = 2
        Control = Label1
        Row = 0
      end
      item
        Column = 0
        Control = Label2
        Row = 0
      end
      item
        Column = 1
        Control = Label3
        Row = 0
      end
      item
        Column = 0
        Control = edtBomba
        Row = 1
      end
      item
        Column = 1
        Control = edtBico
        Row = 1
      end
      item
        Column = 2
        Control = lkpTanque
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
      Left = 295
      Top = 0
      Width = 282
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Tanque'
      ExplicitLeft = 296
      ExplicitWidth = 38
      ExplicitHeight = 15
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 140
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Bomba'
      ExplicitWidth = 38
      ExplicitHeight = 15
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 149
      Top = 0
      Width = 140
      Height = 18
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Bico'
      ExplicitLeft = 150
      ExplicitWidth = 23
      ExplicitHeight = 15
    end
    object edtBomba: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 21
      Width = 140
      Height = 21
      Align = alClient
      TabOrder = 0
      Text = 'edtBomba'
      OnExit = edtBombaExit
      OnKeyPress = edtBombaKeyPress
      ExplicitHeight = 23
    end
    object edtBico: TEdit
      AlignWithMargins = True
      Left = 149
      Top = 21
      Width = 140
      Height = 21
      Align = alClient
      TabOrder = 1
      Text = 'edtBico'
      OnExit = edtBicoExit
      OnKeyPress = edtBicoKeyPress
      ExplicitWidth = 139
      ExplicitHeight = 23
    end
    object lkpTanque: TDBLookupComboBox
      AlignWithMargins = True
      Left = 295
      Top = 21
      Width = 282
      Height = 23
      Align = alClient
      DropDownRows = 20
      KeyField = 'TQ_NUMERO'
      ListField = 'TQ_NUMERO;COMBUSTIVEL'
      ListSource = dsTanque
      TabOrder = 2
      ExplicitLeft = 294
      ExplicitWidth = 281
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 580
    Height = 41
    Align = alTop
    Caption = 'Cadastro de Bombas e Bicos'
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
  object gridBombaBico: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 137
    Width = 580
    Height = 325
    Align = alClient
    DataSource = dsBombaBico
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = gridBombaBicoTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BB_BOMBA'
        Title.Caption = 'Bomba'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BB_BICO'
        Title.Caption = 'Bico'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BB_TANQUE'
        Title.Caption = 'Tanque'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMBUSTIVEL'
        Title.Caption = 'Combust'#237'vel'
        Width = 200
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
  object dsBombaBico: TDataSource
    DataSet = dm.qryBombaBico
    OnDataChange = dsBombaBicoDataChange
    Left = 40
    Top = 200
  end
  object dsTanque: TDataSource
    DataSet = dm.qryTanque
    Left = 144
    Top = 200
  end
end
