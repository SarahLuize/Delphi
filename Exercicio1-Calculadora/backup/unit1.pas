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
    procedure edDisplayChange(Sender: TObject);
    procedure edHistoricoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure pnDisplayClick(Sender: TObject);
    procedure pnFundoClick(Sender: TObject);
    procedure pnLinha1Click(Sender: TObject);
  private
    PrimeiroNumero, SegundoNumero, Resultado:String;
    Operador:Char;
  public

  end;

var
  fView: TfView;

implementation

{$R *.lfm}

{ TfView }

procedure TfView.FormCreate(Sender: TObject);
begin
  BorderStyle := bsSingle; // impede redimensionamento
  BorderIcons := [biSystemMenu, biMinimize]; // remove botão de maximizar
  edDisplay.Text := '0';
  edHistorico.Text := '';

end;

procedure TfView.btn0Click(Sender: TObject);
begin
  if edDisplay.Text <> '0' then
      edDisplay.Text := edDisplay.Text + '0';
end;

procedure TfView.btn1Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '1'
  else
      edDisplay.Text := edDisplay.Text + '1';
end;

procedure TfView.btn2Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '2'
  else
      edDisplay.Text := edDisplay.Text + '2';
end;

procedure TfView.btn3Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '3'
  else
      edDisplay.Text := edDisplay.Text + '3';
end;

procedure TfView.btn4Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '4'
  else
      edDisplay.Text := edDisplay.Text + '4';
end;

procedure TfView.btn5Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '5'
  else
      edDisplay.Text := edDisplay.Text + '5';
end;

procedure TfView.btn6Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '6'
  else
      edDisplay.Text := edDisplay.Text + '6';
end;

procedure TfView.btn7Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '7'
  else
      edDisplay.Text := edDisplay.Text + '7';
end;

procedure TfView.btn8Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '8'
  else
      edDisplay.Text := edDisplay.Text + '8';
end;

procedure TfView.btn9Click(Sender: TObject);
begin
  if edDisplay.Text = '0' then
     edDisplay.Text := '9'
  else
      edDisplay.Text := edDisplay.Text + '9';
end;

procedure TfView.btnBackspaceClick(Sender: TObject);
begin
  edDisplay.Text := copy(edDisplay.Text, 1, length(edDisplay.Text)-1);
  if edDisplay.Text = '' then
     edDisplay.Text := '0';

end;

procedure TfView.btnCEClick(Sender: TObject);
var
  PrNum, SegNum: string;
begin
  //PrimeiroNumero, SegundoNumero, Resultado
  edDisplay.Text := '0';
  PrNum := '';
  SegNum := '';
  Resultado := '';
end;

procedure TfView.btnDecimalClick(Sender: TObject);
begin
  edDisplay.Text:= edDisplay.Text + ',';
end;

procedure TfView.btnDivisaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '/';
  edHistorico.Text := PrimeiroNumero + ' /';
  edDisplay.Text := '0';
end;

procedure TfView.btnMultiplicacaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '*';
  edHistorico.Text := PrimeiroNumero + ' *';
  edDisplay.Text := '0';
end;

procedure TfView.btnPorcentagemClick(Sender: TObject);
begin
  //
end;

procedure TfView.btnSinalClick(Sender: TObject);
var
  sinal:real;
begin
  if edDisplay.Text = '' then Exit;

  if edDisplay.Text[Length(edDisplay.Text)] = FormatSettings.DecimalSeparator then Exit;

  sinal := strToFloat(edDisplay.Text);

  edDisplay.Text := FloatToStr(-1 * sinal);
end;

procedure TfView.btnSubtracaoClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '-';
  edHistorico.Text := PrimeiroNumero + ' -';
  edDisplay.Text := '0';
end;

procedure TfView.btnSomaClick(Sender: TObject);
begin
  PrimeiroNumero := edDisplay.Text;
  Operador := '+';
  edHistorico.Text := PrimeiroNumero + ' +';
  edDisplay.Text := '0';
end;

procedure TfView.btnIgualClick(Sender: TObject);
begin
  SegundoNumero := edDisplay.Text;

  case (Operador) of
  '+':
    Resultado:= FloatToStr(StrToFloat(PrimeiroNumero) + StrToFloat(SegundoNumero));

  '-':
    Resultado:= FloatToStr(StrToFloat(PrimeiroNumero) - StrToFloat(SegundoNumero));

  '*':
    Resultado:= FloatToStr(StrToFloat(PrimeiroNumero) * StrToFloat(SegundoNumero));

  '/':
    Resultado:= FloatToStr(StrToFloat(PrimeiroNumero) / StrToFloat(SegundoNumero));
  end;

  edDisplay.Text := Resultado;

end;

procedure TfView.edDisplayChange(Sender: TObject);
begin

end;

procedure TfView.edHistoricoChange(Sender: TObject);
begin

end;

procedure TfView.btnLimparClick(Sender: TObject);
begin
  edDisplay.Text := '0';
  edHistorico.Text := '0';
end;

procedure TfView.pnDisplayClick(Sender: TObject);
begin

end;

procedure TfView.pnFundoClick(Sender: TObject);
begin

end;

procedure TfView.pnLinha1Click(Sender: TObject);
begin

end;

end.

