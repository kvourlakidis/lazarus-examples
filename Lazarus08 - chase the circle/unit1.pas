unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Shape1: TShape;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseEnter(Sender: TObject);
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

procedure TForm1.Shape1MouseEnter(Sender: TObject);
begin
  with Sender as TShape do
  begin
    //Left := random(Form1.Width - Width);
    //Top := random(Form1.Height - Height);
  end;
end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Form1.Close;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  ks = 40;
var
  xl, yl, h, w, dx, dy: integer;
begin
  with Shape1 do
  begin
    h := Height div 2;
    w := Width div 2;
    xl := Left + w; // circle center x-coord
    yl := Top + h;  // circle center y-coord
    dx := abs(xl-x);
    dy := abs(yl-y);
    if (dx < ks) and (xl > x) then // if approaching from left
       if xl < Form1.Width-(w+dx) then Left := Left+dx
       else Left:= x-(w+dx);
    if (dx < ks) and (xl < x) then // if approaching from right
       if Left > dx then Left := Left-dx
       else Left := x+dx;
    if (dy < ks) and (yl > y) then // if approaching from top
       if yl < Form1.Height-(h+dy) then Top := Top+dy
       else Top := y-(h+dy);
    if (dy < ks) and (yl < y) then // if approaching from bottom
       if Top > dy then Top := Top-dy
       else Top := y + dy;
  end;
end;


end.

