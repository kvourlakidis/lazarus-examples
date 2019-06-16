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
    Image1: TImage;
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

{$GOTO ON}

function isPrime(x:integer):boolean;
var
  i: integer;
begin
  //isPrime:= true;
  //for i:=2 to trunc(sqrt(x)) do
  //  if (x mod i = 0) then
  //  begin
  //    isPrime:=false;
  //    exit;
  //  end;

  //if frac(sqrt(x)) = 0 then isPrime := true
  //else isPrime := false;

  isPrime := false;
  if x mod 33 = 0 then isPrime:=true;
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
label
  up;
var
  i, // loop counter
  x,y, // current coords
  n, // current value
  nx,ny: integer; // steps along axis
begin
  n:= 1;
  x:= Image1.Width div 2 + 1;
  y:= x - 1;
  with Image1.Canvas do
  begin
    Brush.Color := clYellow;
    FillRect(ClientRect);
    //Pixels[x,y]:= clBlack;
    ny:=1;
    ///////////////////////////////////////////////
    up: // GOTO LABEL
    for i:=1 to ny do // going up
      begin
        dec(y);
        inc(n);
        if isPrime(n) then Pixels[x,y] := clBlack;
      end;
    nx:= ny + 1;
    for i:=1 to nx do // going left
      begin
        dec(x);
        inc(n);
        if isPrime(n) then Pixels[x,y] := clBlack;
      end;
    ny:= nx;
    for i:=1 to ny do // going down
      begin
        inc(y);
        inc(n);
        if isPrime(n) then Pixels[x,y] := clBlack;
      end;
    nx:= ny + 1;
    for i:=1 to nx do // going right
      begin
        inc(x);
        inc(n);
        if isPrime(n) then Pixels[x,y]:= clBlack;
      end;
    if n >= Image1.Width*Image1.Height then
      exit;
    ny:= nx;
    Application.ProcessMessages; // re-render form
    goto up;
    ///////////////////////////////////////////////
  end;
end;

end.

