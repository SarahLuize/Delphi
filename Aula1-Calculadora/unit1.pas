unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btn7: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn8: TButton;
    btn9: TButton;
    btn0: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel4: TPanel;
    pnLinha1: TPanel;
    pnFundo: TPanel;
    pnDisplay: TPanel;
    pnFundoBotoesNumericos: TPanel;
    pnFundoBotoes: TPanel;
    pnLinha2: TPanel;
    pnLinha3: TPanel;
    pnLinha4: TPanel;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure onClickButton2(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure pnDisplayClick(Sender: TObject);
    procedure pnFundoClick(Sender: TObject);
    procedure pnLinha1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Panel4Click(Sender: TObject);
begin
  Panel4.BorderSpacing.Left := 0;
end;

procedure TForm1.pnDisplayClick(Sender: TObject);
begin

end;

procedure TForm1.pnFundoClick(Sender: TObject);
begin

end;

procedure TForm1.pnLinha1Click(Sender: TObject);
begin

end;

end.

