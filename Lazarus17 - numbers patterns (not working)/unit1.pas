unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DrawGrid1: TDrawGrid;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

var
  m: integer = 1;
  n: integer;

procedure TForm1.FormResize(Sender: TObject);
begin
  //DrawGrid1.Left := 0;
  //DrawGrid1.Top := 0;
  //DrawGrid1.Width := Form1.Width;
  //DrawGrid1.Height := Form1.Height - 50;
  //n := round(DrawGrid1.Height / DrawGrid1.DefaultRowHeight);
  //DrawGrid1.RowCount := n;
  //DrawGrid1.ColCount := 10;
  //Button1.Top := Form1.Height - 25 - Button1.Height div 2;
  //Button2.Top := Form1.Height - 25 - Button2.Height div 2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  k, i, j: integer;
  Area: TRect;
begin
  inc(m);
  Form1.Caption := '   ' + IntToStr(m);
  DrawGrid1.ColCount := m;
  DrawGrid1.Canvas.Brush.Color := clBlack;
  for i:=0 to n-1 do
    for j:=0 to m-1 do
      begin
        Area := DrawGrid1.CellRect(j,i);
        DrawGrid1.Canvas.FillRect(Area);
      end;
  k := -1;
  DrawGrid1.Canvas.Brush.Color := clWhite;
  for i:=0 to n-1 do
    for j:=0 to m-1 do
      begin
        inc(k);
        if Frac(sqrt(k)) = 0 then
          begin
            Area := DrawGrid1.CellRect(j,i);
            DrawGrid1.Canvas.FillRect(Area);
          end;
      end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled:= false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j: integer;
  myArea: TRect;
begin
  DrawGrid1.ColCount := 10;
  DrawGrid1.RowCount := 10;
  DrawGrid1.Canvas.Brush.Color := clRed;
  for i:=0 to 99 do
    for j:=0 to 99 do
      begin
        myArea := DrawGrid1.CellRect(j,i);
        DrawGrid1.Canvas.FillRect(myArea);
        //sleep(10);
      end;
  DrawGrid1.Refresh;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  n := round(DrawGrid1.Height / DrawGrid1.DefaultRowHeight);
  DrawGrid1.RowCount := n;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:= true;
end;

end.

