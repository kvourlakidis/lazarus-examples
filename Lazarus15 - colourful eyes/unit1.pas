unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Spin, ComCtrls, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Shape1: TShape;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
const
  dfi = pi/30;
var
  i, n, r, x1, y1, x2, y2: integer; // counters, radius, center coords
  fi: real = 0; // angle of rotation
  p1, n1, p2, n2: TPoint; // sector end points
begin

  with Shape1 do
  begin
    r := Width div 5;
    x1 := Left + Width div 4;
    x2 := Left + 3*(Width div 4);
    y1 := Top + Height div 4;
    y2 := y1;
  end;

  n := SpinEdit1.Value;

  with ProgressBar1 do
  begin
    Position := 0;
    Max := n;
    //Refresh;
    Step := 1;
    //Show;
  end;

  p1.x := x1;
  p1.y := y1 - r;
  p2.x := x2;
  p2.y := y2 - r;

  for i :=1 to n do
  begin
    ProgressBar1.StepIt;
    fi := fi + dfi;
    n1.x := x1 - round(r*sin(fi));
    n1.y := y1 - round(r*cos(fi));
    n2.x := x2 - round(r*sin(fi));
    n2.y := y2 - round(r*cos(fi));
    with Canvas.Brush do
    begin
      case (i div 256) mod 3 of
        0: Color := RGB(i mod 256, 255, 255);
        1: Color := RGB(255, i mod 256, 255);
        2: Color := RGB(255, 255, i mod 256);
      end;
    end;
    Canvas.Pie(x1-r, y1-r, x1+r, y1+r, p1.x, p1.y, n1.x, n1.y);
    Canvas.Pie(x2-r, y2-r, x2+r, y2+r, p2.x, p2.y, n2.x, n2.y);
    Sleep(10);
    p1 := n1;
    p2 := n2;
  end;
  //ProgressBar1.SendToBack;
end;

end.

