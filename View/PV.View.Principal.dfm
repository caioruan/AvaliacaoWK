object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 561
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = 4194368
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -232
    ExplicitTop = 8
    DesignSize = (
      889
      57)
    object Label2: TLabel
      Left = 3
      Top = 8
      Width = 297
      Height = 45
      Caption = 'Pedidos de Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI Black'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 4
      Width = 297
      Height = 45
      Caption = 'Pedidos de Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -32
      Font.Name = 'Segoe UI Black'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 854
      Top = 4
      Width = 32
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = Label7Click
    end
    object Panel7: TPanel
      Left = 0
      Top = 46
      Width = 886
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 889
    Height = 65
    Align = alBottom
    BevelOuter = bvNone
    Color = 4194368
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      889
      65)
    object Button2: TButton
      Left = 821
      Top = 1
      Width = 65
      Height = 65
      Anchors = [akTop, akRight]
      Caption = 'Gravar Pedido'
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 889
    Height = 439
    Align = alClient
    BevelOuter = bvNone
    Color = clPurple
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 352
    ExplicitTop = 264
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel4: TPanel
      Left = 0
      Top = 83
      Width = 889
      Height = 80
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 24
      ExplicitTop = 89
      DesignSize = (
        889
        80)
      object Label4: TLabel
        Left = 3
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 559
        Top = 6
        Width = 74
        Height = 25
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 650
        Top = 6
        Width = 47
        Height = 25
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 3
        Top = 37
        Width = 550
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'INFORME O C'#211'DIGO OU DESCRI'#199#195'O DO PRODUTO'
      end
      object Edit2: TEdit
        Left = 559
        Top = 37
        Width = 85
        Height = 33
        Anchors = [akTop, akRight]
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 650
        Top = 37
        Width = 85
        Height = 33
        Anchors = [akTop, akRight]
        TabOrder = 2
      end
      object Button1: TButton
        Left = 741
        Top = 37
        Width = 120
        Height = 33
        Anchors = [akTop, akRight]
        Caption = 'Adicionar'
        TabOrder = 3
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 889
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        889
        83)
      object Label6: TLabel
        Left = 3
        Top = 6
        Width = 61
        Height = 25
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 3
        Top = 37
        Width = 858
        Height = 33
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TextHint = 'INFORME O C'#211'DIGO OU NOME DO CLIENTE'
      end
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 166
      Width = 883
      Height = 229
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'C'#243'digo produto'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Descri'#231#227'o'
          Width = 446
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Quantidade'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Total'
          Width = 122
          Visible = True
        end>
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 395
      Width = 883
      Height = 41
      Margins.Top = 0
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitLeft = 6
      ExplicitTop = 377
      ExplicitWidth = 867
      object DBText1: TDBText
        Left = 793
        Top = 3
        Width = 65
        Height = 22
      end
    end
  end
end
