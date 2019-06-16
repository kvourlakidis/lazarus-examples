unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
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
var
  myArea: TRect;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Fillrect(ClientRect);
  Image1.Refresh;
  //myArea := Bounds(0,0,100,100);
  //Image1.Canvas.Brush.Color := clRed;
  //Image1.Canvas.FillRect(myArea);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,k,w,h,x,y: integer;
  myArea: TRect;
begin
  x := Image1.Width;
  y := Image1.Height;
  w:= 10;
  h:= 10;
  k:= 0;
  Image1.Canvas.Brush.Color := clRed;
  for i:=0 to x-1 do
    for j:=0 to y-1 do
      begin
        if (i mod w = 0) and (j mod h = 0) then
          begin
            inc(k);
            if frac(sqrt(k)) = 0 then
              begin
                myArea := Bounds(i,j,w,h);
                Image1.Canvas.FillRect(myArea);
                Image1.Refresh;
                //sleep(100);
              end;
          end;
          //Image1.Canvas.Pixels[i,j] := clRed;
      end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Left := 0;
  Image1.Top := 0;
  Image1.Width := Form1.width;
  Image1.Height := Form1.Height - 50;
  Button1.Top := Form1.Height - 25 - Button1.Height div 2;
  Button2.Top := Form1.Height - 25 - Button2.Height div 2;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Image1.Width := Form1.width;
  Image1.Height := Form1.Height - 50;
  //Image1.Canvas.Width := Image1.Width;
  //Image1.Canvas.Height := Image1.Height;
  Image1.Refresh;
  Button1.Top := Form1.Height - 25 - Button1.Height div 2;
  Button2.Top := Form1.Height - 25 - Button2.Height div 2;
end;

end.

