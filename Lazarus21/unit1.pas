unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Spin,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ScrollBox1: TScrollBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  Image1.Canvas.FillRect(ClientRect);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, xb, yb, xe, ye, nx, ny, n1, np,
    dxb, dyb, xn, yn, px, py, p, x, y: integer;
begin
  xb := 0;
  yb := 0;
  a := SpinEdit1.Value; // cell size
  n1:= SpinEdit2.Value; // start square
  nx:= SpinEdit3.Value; // width
  ny:= SpinEdit4.Value; // height
  np:= SpinEdit5.Value; // coefficient

  if nx < n1 then
  begin
    ShowMessage('The length should be greater than the starting square');
    exit;
  end;
  with Image1.Canvas do
  begin
    Pen.Color := clBlue;
    dxb := nx*a;     // width * cell size
    dyb := ny*a;     // height * cell size
    xn := xb + n1*a;
    yn := yb + dyb;
    xe := xb + dxb;
    ye := yb + dyb;
    Rectangle(xb, yb, xe+1, ye+1);
    MoveTo(xn,ye);
    px := 1;
    py := 1;
    p := 0;
    repeat
      if (x=xb) or (x=xe) then px:= px*(-1);
      if (y=yb) or (y=ye) then py:= py*(-1);
      LineTo(x, y+a*py);
      LineTo(x+a*px, y+a*py);
      x:= x+a*px;
      y:= y+a*py;
      if (x=xn) and ((y=yn) or (y=yb)) then
        p:= p+1;
    until p=np;
  end;
end;

end.

