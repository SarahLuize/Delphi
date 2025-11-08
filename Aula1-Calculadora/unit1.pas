unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel4: TPanel;
    pnFundo: TPanel;
    pnDisplay: TPanel;
    Panel3: TPanel;
    pnFundoBotoes: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure pnDisplayClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Panel3Click(Sender: TObject);
begin

end;

procedure TForm1.pnDisplayClick(Sender: TObject);
begin
  Panel4.BorderSpacing.Left := 0;
  ShowMessage(
  'Top: ' + IntToStr(Panel4.BorderSpacing.Top) + sLineBreak +
  'Bottom: ' + IntToStr(Panel4.BorderSpacing.Bottom) + sLineBreak +
  'Left: ' + IntToStr(Panel4.BorderSpacing.Left) + sLineBreak +
  'Right: ' + IntToStr(Panel4.BorderSpacing.Right)
);

end;

end.

