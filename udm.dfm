object dm: Tdm
  Height = 406
  Width = 640
  object qryTanque: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select t.tq_numero, t.tq_combustivel, t.tq_valor,'
      'case t.tq_combustivel'
      'when 0 then '#39'Gasolina'#39
      'when 1 then '#39#211'leo Diesel'#39
      'when 2 then '#39'Etanol'#39
      'else '#39'N'#227'o identificado'#39
      'end as combustivel'
      'from tanque t'
      'order by t.tq_numero')
    Left = 48
    Top = 88
    object qryTanqueTQ_NUMERO: TSmallintField
      DisplayWidth = 3
      FieldName = 'TQ_NUMERO'
      Origin = 'TQ_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object qryTanqueTQ_COMBUSTIVEL: TSmallintField
      FieldName = 'TQ_COMBUSTIVEL'
      Origin = 'TQ_COMBUSTIVEL'
      Required = True
    end
    object qryTanqueTQ_VALOR: TFMTBCDField
      FieldName = 'TQ_VALOR'
      Origin = 'TQ_VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryTanqueCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
  end
  object qryBombaBico: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_bomba, b.bb_bico, b.bb_tanque,'
      'case t.tq_combustivel'
      'when 0 then '#39'Gasolina'#39
      'when 1 then '#39#211'leo Diesel'#39
      'when 2 then '#39'Etanol'#39
      'else '#39'N'#227'o identificado'#39
      'end as combustivel'
      'from bombas_bicos b'
      'join tanque t on (b.bb_tanque = t.tq_numero)')
    Left = 48
    Top = 144
    object qryBombaBicoBB_BOMBA: TSmallintField
      FieldName = 'BB_BOMBA'
      Origin = 'BB_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object qryBombaBicoBB_BICO: TSmallintField
      FieldName = 'BB_BICO'
      Origin = 'BB_BICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
    object qryBombaBicoBB_TANQUE: TSmallintField
      FieldName = 'BB_TANQUE'
      Origin = 'BB_TANQUE'
      Required = True
      DisplayFormat = '00'
    end
    object qryBombaBicoCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
  end
  object qryBomba: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_bomba'
      'from bombas_bicos b'
      'group by b.bb_bomba'
      'order by b.bb_bomba')
    Left = 176
    Top = 24
    object qryBombaBB_BOMBA: TSmallintField
      FieldName = 'BB_BOMBA'
      Origin = 'BB_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryBico: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_bico'
      'from bombas_bicos b'
      'where b.bb_bomba = :BOMBA'
      'order by b.bb_bico')
    Left = 176
    Top = 80
    ParamData = <
      item
        Name = 'BOMBA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qryBicoBB_BICO: TSmallintField
      FieldName = 'BB_BICO'
      Origin = 'BB_BICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryBombaPesq: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_bomba'
      'from bombas_bicos b'
      'group by b.bb_bomba'
      'order by b.bb_bomba')
    Left = 176
    Top = 144
    object qryBombaPesqBB_BOMBA: TSmallintField
      FieldName = 'BB_BOMBA'
      Origin = 'BB_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
  end
  object qryBicoPesq: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_bico'
      'from bombas_bicos b'
      'group by b.bb_bico'
      'order by b.bb_bico')
    Left = 176
    Top = 200
    object qryBicoPesqBB_BICO: TSmallintField
      FieldName = 'BB_BICO'
      Origin = 'BB_BICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00'
    end
  end
  object qryAbastecimentos: TFDQuery
    CachedUpdates = True
    Connection = conexao
    SQL.Strings = (
      'select a.ab_data, a.ab_hora, a.ab_tanque, a.ab_bomba,'
      'a.ab_bico, a.ab_quantidade,a.ab_valor_unitario, a.ab_imposto,'
      '(a.ab_quantidade*a.ab_valor_unitario) valor_total,'
      '((a.ab_quantidade*a.ab_valor_unitario)-a.ab_imposto)'
      'valor_liquido,'
      'case t.tq_combustivel'
      'when 0 then '#39'Gasolina'#39
      'when 1 then '#39#211'leo Diesel'#39
      'when 2 then '#39'Etanol'#39
      'else '#39'N'#227'o identificado'#39
      'end as combustivel'
      'from abastecimentos a'
      'join tanque t on (t.tq_numero = a.ab_tanque)')
    Left = 176
    Top = 328
    object qryAbastecimentosAB_DATA: TDateField
      FieldName = 'AB_DATA'
      Origin = 'AB_DATA'
      Required = True
    end
    object qryAbastecimentosAB_HORA: TTimeField
      FieldName = 'AB_HORA'
      Origin = 'AB_HORA'
      Required = True
    end
    object qryAbastecimentosAB_TANQUE: TSmallintField
      FieldName = 'AB_TANQUE'
      Origin = 'AB_TANQUE'
      Required = True
      DisplayFormat = '00'
    end
    object qryAbastecimentosAB_BOMBA: TSmallintField
      FieldName = 'AB_BOMBA'
      Origin = 'AB_BOMBA'
      Required = True
      DisplayFormat = '00'
    end
    object qryAbastecimentosAB_BICO: TSmallintField
      FieldName = 'AB_BICO'
      Origin = 'AB_BICO'
      Required = True
      DisplayFormat = '00'
    end
    object qryAbastecimentosAB_QUANTIDADE: TFMTBCDField
      FieldName = 'AB_QUANTIDADE'
      Origin = 'AB_QUANTIDADE'
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
    object qryAbastecimentosAB_VALOR_UNITARIO: TFMTBCDField
      FieldName = 'AB_VALOR_UNITARIO'
      Origin = 'AB_VALOR_UNITARIO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentosAB_IMPOSTO: TFMTBCDField
      FieldName = 'AB_IMPOSTO'
      Origin = 'AB_IMPOSTO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryAbastecimentosVALOR_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 5
    end
    object qryAbastecimentosVALOR_LIQUIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_LIQUIDO'
      Origin = 'VALOR_LIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 5
    end
    object qryAbastecimentosCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 296
    Top = 80
  end
  object qryBombaBicoPesq: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select b.bb_tanque,t.tq_valor,'
      'case t.tq_combustivel'
      'when 0 then '#39'Gasolina'#39
      'when 1 then '#39#211'leo Diesel'#39
      'when 2 then '#39'Etanol'#39
      'else '#39'N'#227'o identificado'#39
      'end as combustivel'
      'from bombas_bicos b'
      'join tanque t on (b.bb_tanque = t.tq_numero)'
      'where b.bb_bomba = :BOMBA and b.bb_bico = :BICO')
    Left = 176
    Top = 264
    ParamData = <
      item
        Name = 'BOMBA'
        DataType = ftSmallint
        ParamType = ptInput
      end
      item
        Name = 'BICO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qryBombaBicoPesqBB_TANQUE: TSmallintField
      FieldName = 'BB_TANQUE'
      Origin = 'BB_TANQUE'
      Required = True
    end
    object qryBombaBicoPesqTQ_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TQ_VALOR'
      Origin = 'TQ_VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryBombaBicoPesqCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
  end
  object qryRelatorio: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select a.ab_data, a.ab_tanque, a.ab_bomba, a.ab_bico,'
      
        'cast((sum((a.ab_quantidade*a.ab_valor_unitario))) as float) valo' +
        'r_total,'
      'case t.tq_combustivel'
      'when 0 then '#39'Gasolina'#39
      'when 1 then '#39#211'leo Diesel'#39
      'when 2 then '#39'Etanol'#39
      'else '#39'N'#227'o identificado'#39
      'end as combustivel'
      'from abastecimentos a'
      'join tanque t on (t.tq_numero = a.ab_tanque)'
      'where a.ab_data between :DATAINI and :DATAFIN'
      'group by a.ab_data, a.ab_tanque, a.ab_bomba,'
      'a.ab_bico, t.tq_combustivel'
      'order by a.ab_data')
    Left = 296
    Top = 24
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATAFIN'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelatorioAB_DATA: TDateField
      FieldName = 'AB_DATA'
      Origin = 'AB_DATA'
      Required = True
    end
    object qryRelatorioAB_TANQUE: TSmallintField
      FieldName = 'AB_TANQUE'
      Origin = 'AB_TANQUE'
      Required = True
      DisplayFormat = '00'
    end
    object qryRelatorioAB_BOMBA: TSmallintField
      FieldName = 'AB_BOMBA'
      Origin = 'AB_BOMBA'
      Required = True
      DisplayFormat = '00'
    end
    object qryRelatorioAB_BICO: TSmallintField
      FieldName = 'AB_BICO'
      Origin = 'AB_BICO'
      Required = True
      DisplayFormat = '00'
    end
    object qryRelatorioVALOR_TOTAL: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object qryRelatorioCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 16
    end
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Posto_ABC\BancoDados\SISTEMA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
end
