unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLIntf, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Refresh;
end;

procedure TForm1.Button2Click(Sender: TObject);
const
  w = 10; // width
  dh = 2; // height delta
  d = 2; // horizontal gap
var
  Rect:TRect; // rectangle
  ix, iy, h, i: integer; // top left corner coords, height, counter
begin
  h := 2;
  ix := - w - d;
  iy := 100;
  for i:=1 to 25 do
  begin
    ix := ix + w + d;
    iy := iy - dh;
    h := h + dh;
    //if (i Mod 3) = 0 then Continue;
    //if i = 20 then Break;
    Rect := Bounds(ix,iy,w,h);
    Canvas.Brush.Color := RGB(0,0,i*10);
    Canvas.FillRect(Rect);
    //sleep(200);
  end;
  //////////////////////////////////////////////////////////////
  h := 2;
  ix := - w - d;
  iy := 200;
  i := 0;
  while i < 25 do
  begin
    inc(i);
    ix := ix + w + d;
    iy := iy - dh;
    h := h + dh;
    //if (i Mod 3) = 0 then Continue;
    //if i = 20 then Break;
    Rect := Bounds(ix,iy,w,h);
    Canvas.Brush.Color := RGB(0,i*10,0);
    Canvas.FillRect(Rect);
    //sleep(200);
  end;
  //////////////////////////////////////////////////////////////
  h := 2;
  ix := - w - d;
  iy := 300;
  i := 0;
  repeat
    inc(i);
    ix := ix + w + d;
    iy := iy - dh;
    h := h + dh;
    //if (i Mod 3) = 0 then Continue;
    //if i = 20 then Break;
    Rect := Bounds(ix,iy,w,h);
    Canvas.Brush.Color := RGB(i*10,0,0);
    Canvas.FillRect(Rect);
    //sleep(200);
  until i >= 25;
  //////////////////////////////////////////////////////////////

end;

end.

