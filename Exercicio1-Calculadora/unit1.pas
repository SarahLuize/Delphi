unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, LCLType;

type

  { TfView }

  TfView = class(TForm)
    btn0: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btnBackspace: TButton;
    btnCE: TButton;
    btnDecimal: TButton;
    btnDivisao: TButton;
    btnIgual: TButton;
    btnLimpar: TButton;
    btnMultiplicacao: TButton;
    btnPorcentagem: TButton;
    btnSinal: TButton;
    btnSoma: TButton;
    btnSubtracao: TButton;
    edDisplay: TEdit;
    edHistorico: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btn0Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btnBackspaceClick(Sender: TObject);
    procedure btnCEClick(Sender: TObject);
    procedure btnDecimalClick(Sender: TObject);
    procedure btnDivisaoClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnMultiplicacaoClick(Sender: TObject);
    procedure btnPorcentagemClick(Sender: TObject);
    procedure btnSinalClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure btnSubtracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PrimeiroNumero, SegundoNumero, Resultado: string;
    Operador: char;
    LimparDisplay: boolean;
    procedure AdicionarDigito(Digito: string);
  public

  end;

var
  fView: TfView;

implementation

procedure TfView.AdicionarDigito(Digito: string);
begin

  if LimparDisplay or (edDisplay.Text = '0') then
  begin
    // Se começou novo cálculo após clicar em =, limpa o histórico e a memória
    if LimparDisplay and (Operador = #0) then
    begin
      edHistorico.Text := '';
      PrimeiroNumero := '';
    end;

    edDisplay.Text := Digito;
    LimparDisplay := False;
  end
  else
  begin
    // Adiciona o dígito ao que já existe
    edDisplay.Text := edDisplay.Text + Digito;
  end;

  // Se houver um operador, o histórico mostra: (PrimeiroNumero) (Operador) (NúmeroAtual)
  if Operador <> #0 then
  begin
    edHistorico.Text := PrimeiroNumero + ' ' + Operador + ' ' + edDisplay.Text;
  end
  else
  begin
    // Se ainda não tem operador o histórico mostra o primeiro número digitado/clicado
    edHistorico.Text := edDisplay.Text;
  end;
end;

{$R *.lfm}

{ TfView }

procedure TfView.FormCreate(Sender: TObject);
begin
  // Configuração inicial do formulário
  BorderStyle := bsSingle; // impede redimensionamento
  BorderIcons := [biSystemMenu, biMinimize]; // remove botão de maximizar
  edDisplay.Text := '0';
  edHistorico.Text := '';
  Operador := #0; // inicializar o operador em null
  PrimeiroNumero := '';
  SegundoNumero := '';
  LimparDisplay := False;
end;

//Botões numéricos
procedure TfView.btn0Click(Sender: TObject);
begin
  AdicionarDigito('0');
end;

procedure TfView.btn1Click(Sender: TObject);
begin
  AdicionarDigito('1');
end;

procedure TfView.btn2Click(Sender: TObject);
begin
  AdicionarDigito('2');
end;

procedure TfView.btn3Click(Sender: TObject);
begin
  AdicionarDigito('3');
end;

procedure TfView.btn4Click(Sender: TObject);
begin
  AdicionarDigito('4');
end;

procedure TfView.btn5Click(Sender: TObject);
begin
  AdicionarDigito('5');
end;

procedure TfView.btn6Click(Sender: TObject);
begin
  AdicionarDigito('6');
end;

procedure TfView.btn7Click(Sender: TObject);
begin
  AdicionarDigito('7');
end;

procedure TfView.btn8Click(Sender: TObject);
begin
  AdicionarDigito('8');
end;

procedure TfView.btn9Click(Sender: TObject);
begin
  AdicionarDigito('9');
end;

procedure TfView.btnBackspaceClick(Sender: TObject);
begin
  edDisplay.Text := copy(edDisplay.Text, 1, length(edDisplay.Text) - 1);
  if edDisplay.Text = '' then
    edDisplay.Text := '0';

end;

procedure TfView.btnCEClick(Sender: TObject);
var
  PrNum, SegNum: string;
begin
  //PrNum é a variável PrimeiroNumero e SegNum é a variável SegundoNumero.
  edDisplay.Text := '0';
  PrNum := '';
  SegNum := '';
  Resultado := '';
end;

procedure TfView.btnDecimalClick(Sender: TObject);
begin
  edDisplay.Text := edDisplay.Text + ',';
end;

procedure TfView.btnDivisaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '/';
  SegundoNumero := '';
  edHistorico.Text := PrimeiroNumero + operador;
  edDisplay.Text := '0';
  LimparDisplay:= true;
end;

procedure TfView.btnMultiplicacaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '*';
  SegundoNumero := '';
  edHistorico.Text := PrimeiroNumero + operador;
  edDisplay.Text := '0';
  LimparDisplay:= true;
end;

procedure TfView.btnPorcentagemClick(Sender: TObject);
var
  Valor: double;
begin
  // cálculo baseado na calculadora do Google

  Valor := StrToFloat(edDisplay.Text) / 100;
  edDisplay.Text := FloatToStr(Valor);
  LimparDisplay := True;
end;

procedure TfView.btnSinalClick(Sender: TObject);
var
  sinal: double;
begin
  if edDisplay.Text = '' then Exit;

  // Se tiver número terminado em vírgula ação é cancelada
  if edDisplay.Text[Length(edDisplay.Text)] = FormatSettings.DecimalSeparator then Exit;

  sinal := strToFloat(edDisplay.Text);

  edDisplay.Text := FloatToStr(-1 * sinal);
end;

procedure TfView.btnSubtracaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '-';
  SegundoNumero := '';
  edHistorico.Text := PrimeiroNumero + operador;
  LimparDisplay:= true;
end;

procedure TfView.btnSomaClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '+';
  SegundoNumero := '';
  edHistorico.Text := PrimeiroNumero + operador;
  LimparDisplay:= true;
end;

procedure TfView.btnIgualClick(Sender: TObject);
begin
  SegundoNumero := edDisplay.Text;

  case (Operador) of
    '+':
      Resultado := FloatToStr(StrToFloat(PrimeiroNumero) + StrToFloat(SegundoNumero));

    '-':
      Resultado := FloatToStr(StrToFloat(PrimeiroNumero) - StrToFloat(SegundoNumero));

    '*':
      Resultado := FloatToStr(StrToFloat(PrimeiroNumero) * StrToFloat(SegundoNumero));

    '/':
      Resultado := FloatToStr(StrToFloat(PrimeiroNumero) / StrToFloat(SegundoNumero));
  end;

  edDisplay.Text := Resultado;
  edHistorico.Text := PrimeiroNumero + ' ' + Operador + ' ' + SegundoNumero;
  Operador := #0;
  LimparDisplay := True; //próximo número substitui o resultado

end;

procedure TfView.btnLimparClick(Sender: TObject);
begin
  edDisplay.Text := '0';
  edHistorico.Text := '';
  operador := #0;
end;

end.
