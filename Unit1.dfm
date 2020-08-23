object Form1: TForm1
  Left = 233
  Top = 171
  Width = 1229
  Height = 677
  Caption = 'Time Calculator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object HourEdit: TLabeledEdit
    Left = 32
    Top = 112
    Width = 81
    Height = 21
    EditLabel.Width = 16
    EditLabel.Height = 13
    EditLabel.Caption = 'Hrs'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    Text = '0'
    OnEnter = EditSelectAllText
  end
  object MinuteEdit: TLabeledEdit
    Left = 136
    Top = 112
    Width = 81
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'Min'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 1
    Text = '0'
    OnEnter = EditSelectAllText
  end
  object SecEdit: TLabeledEdit
    Left = 248
    Top = 112
    Width = 81
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Sec'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
    Text = '0'
    OnEnter = EditSelectAllText
    OnKeyUp = SecEditKeyUp
  end
  object DayEdit: TLabeledEdit
    Left = 248
    Top = 32
    Width = 81
    Height = 21
    TabStop = False
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Days'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 3
    Text = '0'
    OnEnter = EditSelectAllText
  end
  object WeeksEdit: TLabeledEdit
    Left = 136
    Top = 32
    Width = 89
    Height = 21
    TabStop = False
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Weeks'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 4
    Text = '0'
    OnEnter = EditSelectAllText
  end
  object WeeksResult: TLabeledEdit
    Left = 920
    Top = 56
    Width = 289
    Height = 21
    TabStop = False
    Color = clInfoBk
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Weeks'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 5
  end
  object DaysResult: TLabeledEdit
    Left = 920
    Top = 96
    Width = 289
    Height = 21
    TabStop = False
    Color = clInfoBk
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Days'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 6
  end
  object HoursResult: TLabeledEdit
    Left = 920
    Top = 136
    Width = 289
    Height = 21
    TabStop = False
    Color = clInfoBk
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Hours'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 7
  end
  object MinutesResult: TLabeledEdit
    Left = 920
    Top = 176
    Width = 289
    Height = 21
    TabStop = False
    Color = clInfoBk
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Minutes'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 8
  end
  object SecondsResult: TLabeledEdit
    Left = 920
    Top = 216
    Width = 289
    Height = 21
    TabStop = False
    Color = clInfoBk
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Seconds'
    LabelPosition = lpAbove
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 9
  end
  object Panel1: TPanel
    Left = 32
    Top = 160
    Width = 401
    Height = 345
    TabOrder = 10
    object Button1: TButton
      Left = 288
      Top = 264
      Width = 97
      Height = 65
      Caption = '+'
      TabOrder = 0
      TabStop = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 264
      Width = 97
      Height = 65
      Caption = 'Update'
      TabOrder = 1
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 312
      Top = 8
      Width = 75
      Height = 49
      Caption = 'Delete Last'
      TabOrder = 2
      TabStop = False
      OnClick = Button3Click
    end
  end
  object UpDown1: TUpDown
    Left = 113
    Top = 112
    Width = 16
    Height = 21
    Associate = HourEdit
    Min = 0
    Max = 1000
    Position = 0
    TabOrder = 11
    Wrap = False
  end
  object UpDown2: TUpDown
    Left = 217
    Top = 112
    Width = 16
    Height = 21
    Associate = MinuteEdit
    Min = 0
    Max = 1000
    Position = 0
    TabOrder = 12
    Wrap = False
  end
  object UpDown3: TUpDown
    Left = 329
    Top = 112
    Width = 16
    Height = 21
    Associate = SecEdit
    Min = 0
    Max = 1000
    Position = 0
    TabOrder = 13
    Wrap = False
  end
  object UpDown4: TUpDown
    Left = 329
    Top = 32
    Width = 16
    Height = 21
    Associate = DayEdit
    Min = 0
    Max = 1000
    Position = 0
    TabOrder = 14
    Wrap = False
  end
  object UpDown5: TUpDown
    Left = 225
    Top = 32
    Width = 16
    Height = 21
    Associate = WeeksEdit
    Min = 0
    Max = 1000
    Position = 0
    TabOrder = 15
    Wrap = False
  end
  object ListBox2: TListBox
    Left = 472
    Top = 32
    Width = 225
    Height = 529
    TabStop = False
    ItemHeight = 13
    TabOrder = 16
    OnClick = ListBox2Click
  end
  object TimeGrid: TStringGrid
    Left = 736
    Top = 32
    Width = 169
    Height = 529
    TabStop = False
    DefaultColWidth = 25
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 17
  end
  object Button4: TButton
    Left = 624
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 18
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 472
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 19
    OnClick = Button5Click
  end
  object Open1: TOpenDialog
    Filter = 'Time List File|*.tlf'
    Left = 1128
    Top = 592
  end
  object Save1: TSaveDialog
    DefaultExt = '.tlf'
    Filter = 'Time List File|*.tlf'
    Left = 1160
    Top = 592
  end
end
