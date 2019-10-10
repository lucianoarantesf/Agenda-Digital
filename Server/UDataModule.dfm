object DataModule2: TDataModule2
  OldCreateOrder = False
  Encoding = esUtf8
  Height = 286
  Width = 208
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 64
    Top = 232
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    CommitRecords = 100
    Connection = FDConnection1
    Left = 64
    Top = 176
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Password=saavecom14'
      'User_Name=root'
      'Database=agenda'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 120
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 64
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 64
    Top = 64
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 144
    Top = 120
  end
end
