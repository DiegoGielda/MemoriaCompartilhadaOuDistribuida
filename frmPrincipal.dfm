object formPrincipal: TformPrincipal
  Left = 577
  Top = 316
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Menu Principal'
  ClientHeight = 405
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pageComunicacao: TPageControl
    Left = 0
    Top = 0
    Width = 903
    Height = 405
    ActivePage = paginaMapeamento
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object paginaConfiguracao: TTabSheet
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object lblTopologiaRede: TLabel
        Left = 67
        Top = 3
        Width = 184
        Height = 16
        Caption = 'Informe a topologia de Rede'
        FocusControl = cbTopologiaRede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCriarAmbiente: TButton
        Left = 5
        Top = 141
        Width = 886
        Height = 28
        Caption = 'Criar Ambiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnCriarAmbienteClick
      end
      object cbTopologiaRede: TComboBox
        Left = 67
        Top = 22
        Width = 184
        Height = 24
        TabOrder = 1
        TextHint = '*Campo obrigat'#243'rio'
        Items.Strings = (
          '(1) Ring'
          '(2) Mesh-2D')
      end
      object edtTamanhoX: TLabeledEdit
        Left = 347
        Top = 22
        Width = 169
        Height = 24
        Alignment = taCenter
        EditLabel.Width = 133
        EditLabel.Height = 16
        EditLabel.Caption = 'Tamanho NoC para X'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 2
        TextHint = '*Campo obrigat'#243'rio'
        OnChange = edtTamanhoXChange
        OnKeyPress = edtTamanhoXKeyPress
      end
      object edtTamanhoY: TLabeledEdit
        Left = 639
        Top = 22
        Width = 169
        Height = 24
        Alignment = taCenter
        EditLabel.Width = 133
        EditLabel.Height = 16
        EditLabel.Caption = 'Tamanho NoC para Y'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        TabOrder = 3
        TextHint = '*Campo obrigat'#243'rio'
        OnKeyPress = edtTamanhoYKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 56
        Top = 64
        Width = 752
        Height = 71
        Caption = 'Vamos criar uma aplica'#231#227'o!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object lblNomeAplicacao: TLabel
          Left = 104
          Top = 32
          Width = 191
          Height = 16
          Caption = 'Informe o nome da aplica'#231#227'o:'
        end
        object edtNomeDaAplicacao: TEdit
          Left = 301
          Top = 28
          Width = 356
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = '*Campo obrigat'#243'rio'
        end
      end
    end
    object paginaMapeamento: TTabSheet
      Caption = 'Mapeamento'
      ImageIndex = 2
      object gbAdicionarTarefas: TGroupBox
        Left = 3
        Top = 3
        Width = 888
        Height = 86
        Caption = 'Vamos adicionar tarefas na aplica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblNumeroTarefa: TLabel
          Left = 17
          Top = 28
          Width = 296
          Height = 16
          Caption = 'Informe quantas tarefas a aplica'#231#227'o conter'#225':'
          FocusControl = edtNumeroTarefa
        end
        object lblNomeTarefa: TLabel
          Left = 401
          Top = 28
          Width = 119
          Height = 16
          Caption = 'Nome da 1'#176' tarefa'
        end
        object edtNumeroTarefa: TEdit
          Left = 320
          Top = 24
          Width = 66
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = '*N'#250'mero'
          OnKeyPress = edtNumeroTarefaKeyPress
        end
        object edtNomeTarefa: TEdit
          Left = 536
          Top = 22
          Width = 176
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TextHint = '*Nome tarefa'
        end
        object btnNumeroTarefas: TButton
          Left = 17
          Top = 52
          Width = 222
          Height = 25
          Caption = 'Confirmar n'#250'mero de Tarefas'
          TabOrder = 2
          OnClick = btnNumeroTarefasClick
        end
        object btnTarefa: TButton
          Left = 401
          Top = 52
          Width = 147
          Height = 25
          Caption = 'Confirmar Tarefa'
          Enabled = False
          TabOrder = 3
          OnClick = btnTarefaClick
        end
        object btnAtribuir1: TButton
          Left = 732
          Top = 22
          Width = 137
          Height = 26
          Caption = 'Atribuir Tarefas 1'
          Enabled = False
          TabOrder = 4
          OnClick = btnAtribuir1Click
        end
        object btnAtribuir2: TButton
          Left = 732
          Top = 54
          Width = 137
          Height = 26
          Caption = 'Atribuir Tarefas 2'
          Enabled = False
          TabOrder = 5
          OnClick = btnAtribuir2Click
        end
      end
      object StringGrid1: TStringGrid
        Left = 5
        Top = 95
        Width = 886
        Height = 276
        TabOrder = 1
        ColWidths = (
          64
          64
          64
          64
          64)
      end
    end
    object paginaSegunda: TTabSheet
      Caption = 'Comunica'#231#227'o'
      ImageIndex = 1
      object lblPayload: TLabel
        Left = 544
        Top = 3
        Width = 51
        Height = 16
        Caption = 'Payload'
      end
      object edtHeader: TLabeledEdit
        Left = 390
        Top = 41
        Width = 137
        Height = 24
        EditLabel.Width = 47
        EditLabel.Height = 16
        EditLabel.Caption = 'Header'
        TabOrder = 0
      end
      object edtTrailer: TLabeledEdit
        Left = 390
        Top = 89
        Width = 137
        Height = 24
        EditLabel.Width = 41
        EditLabel.Height = 16
        EditLabel.Caption = 'Trailer'
        TabOrder = 1
      end
      object mmPayload: TMemo
        Left = 544
        Top = 24
        Width = 345
        Height = 110
        TabOrder = 2
        OnExit = mmPayloadExit
      end
      object pnlNodo: TPanel
        Left = 5
        Top = 8
        Width = 364
        Height = 127
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        object lblNomeSource: TLabel
          Left = 169
          Top = 16
          Width = 135
          Height = 16
          Caption = 'Nome Aplica'#231#227'o Source'
        end
        object lblNomeTarget: TLabel
          Left = 169
          Top = 64
          Width = 133
          Height = 16
          Caption = 'Nome Aplica'#231#227'o Target'
        end
        object edtTarget: TLabeledEdit
          Left = 17
          Top = 82
          Width = 96
          Height = 24
          Alignment = taCenter
          EditLabel.Width = 81
          EditLabel.Height = 16
          EditLabel.Caption = 'C'#243'digo Target'
          TabOrder = 1
          OnChange = edtTargetChange
          OnKeyPress = edtTargetKeyPress
        end
        object edtSource: TLabeledEdit
          Left = 17
          Top = 34
          Width = 96
          Height = 24
          Alignment = taCenter
          EditLabel.Width = 83
          EditLabel.Height = 16
          EditLabel.Caption = 'C'#243'digo Source'
          TabOrder = 0
          OnChange = edtSourceChange
          OnKeyPress = edtSourceKeyPress
        end
        object edtNomeSource: TEdit
          Left = 136
          Top = 34
          Width = 201
          Height = 24
          Enabled = False
          TabOrder = 2
        end
        object edtNomeTarget: TEdit
          Left = 136
          Top = 82
          Width = 201
          Height = 24
          Enabled = False
          TabOrder = 3
        end
      end
      object btnEnviar: TButton
        Left = 5
        Top = 141
        Width = 884
        Height = 28
        Caption = 'Processar / Enviar Mensagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnEnviarClick
      end
      object edtResultadoHops: TEdit
        Left = 5
        Top = 175
        Width = 884
        Height = 24
        Enabled = False
        TabOrder = 5
      end
      object StringGrid2: TStringGrid
        Left = 3
        Top = 205
        Width = 889
        Height = 166
        TabOrder = 6
      end
    end
    object paginaLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 3
      object lblControleLog: TLabel
        Left = 3
        Top = 3
        Width = 113
        Height = 19
        Caption = 'Controle de Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object mmLogs: TMemo
        Left = 3
        Top = 25
        Width = 887
        Height = 342
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
