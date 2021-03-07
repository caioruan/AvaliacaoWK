object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ViewPrincipal'
  ClientHeight = 552
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
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
    object SpeedButton1: TSpeedButton
      Left = 680
      Top = 5
      Width = 100
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Gravar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 786
      Top = 5
      Width = 100
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object btnCancelar: TSpeedButton
      Left = 573
      Top = 5
      Width = 100
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object btnConsultar: TSpeedButton
      Left = 468
      Top = 5
      Width = 100
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Consultar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnConsultarClick
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
    Top = 531
    Width = 889
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    Color = 4194368
    ParentBackground = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 889
    Height = 474
    Align = alClient
    BevelOuter = bvNone
    Color = clPurple
    ParentBackground = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 83
      Width = 889
      Height = 80
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
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
        Left = 535
        Top = 6
        Width = 104
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 708
        Top = 6
        Width = 47
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAdicionar: TSpeedButton
        Left = 761
        Top = 37
        Width = 100
        Height = 35
        Action = actAdicionar
        Anchors = [akTop, akRight]
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227327
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtProduto: TEdit
        Left = 3
        Top = 37
        Width = 182
        Height = 33
        NumbersOnly = True
        TabOrder = 0
        TextHint = 'INFORME O C'#211'DIGO OU DESCRI'#199#195'O DO PRODUTO'
        OnExit = edtProdutoExit
      end
      object edtQuantidade: TEdit
        Left = 535
        Top = 37
        Width = 109
        Height = 33
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        NumbersOnly = True
        TabOrder = 2
      end
      object edtPrecoVenda: TEdit
        Left = 650
        Top = 37
        Width = 105
        Height = 33
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        NumbersOnly = True
        TabOrder = 3
        OnExit = edtPrecoVendaExit
      end
      object edtDescricaoProduto: TEdit
        Left = 191
        Top = 37
        Width = 338
        Height = 33
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
        TextHint = 'DESCRI'#199#195'O DO PRODUTO'
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 889
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      TabStop = True
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
      object edtCliente: TEdit
        Left = 3
        Top = 37
        Width = 182
        Height = 33
        NumbersOnly = True
        TabOrder = 0
        TextHint = 'INFORME O C'#211'DIGO '
        OnChange = edtClienteChange
        OnExit = edtClienteExit
      end
      object edtNomeCliente: TEdit
        Left = 191
        Top = 37
        Width = 670
        Height = 33
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 166
      Width = 883
      Height = 272
      Margins.Bottom = 0
      TabStop = False
      Align = alClient
      DataSource = dsVendaItem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'C'#243'digo produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 341
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Total'
          Width = 99
          Visible = True
        end>
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 438
      Width = 883
      Height = 33
      Margins.Top = 0
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        883
        33)
      object Label7: TLabel
        Left = 700
        Top = 6
        Width = 43
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 699
        Top = 5
        Width = 43
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227327
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 748
        Top = -1
        Width = 119
        Height = 33
        TabStop = False
        Anchors = [akTop, akRight]
        DataField = 'TOTAL_TOTAL'
        DataSource = dsVendaItem
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object mmVendaItem: TFDMemTable
    AfterPost = mmVendaItemAfterPost
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 304
    object mmVendaItemPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object mmVendaItemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object mmVendaItemQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,##0.00'
    end
    object mmVendaItemVALOR: TCurrencyField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object mmVendaItemTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
    object mmVendaItemTOTAL_TOTAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'TOTAL_TOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = '#,##0.00'
      Expression = 'SUM(TOTAL)'
    end
  end
  object dsVendaItem: TDataSource
    DataSet = mmVendaItem
    Left = 432
    Top = 264
  end
  object actEventos: TActionList
    Left = 248
    Top = 328
    object actAdicionar: TAction
      Caption = 'Adicionar'
      OnExecute = actAdicionarExecute
    end
    object actAtualizar: TAction
      Caption = 'Atualizar'
      OnExecute = actAtualizarExecute
    end
  end
end
