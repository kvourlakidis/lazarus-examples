unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ExtCtrls, StdCtrls, Spin, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    DrawGrid1: TDrawGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  m, rest, n: integer;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := false;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
    DrawGrid1.GridLineWidth := 1
  else
    DrawGrid1.GridLineWidth := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  n := SpinEdit1.Value;
  m := SpinEdit2.Value;
  rest := SpinEdit3.Value;
  Timer1.Interval := SpinEdit4.Value;
  with DrawGrid1 do
    begin
      DefaultColWidth := round(Width div n);
      DefaultRowHeight := round(Height div n);
      ColCount := n;
      RowCount := n;
      if CheckBox1.Checked = true then
        GridLinewidth := 1
      else
        GridLineWidth := 0;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  c,r,i: integer;
  myArea: TRect;
begin
  inc(rest);
  SpinEdit2.Value := m;
  SpinEdit3.Value := rest;
  with DrawGrid1 do
    begin
      //Canvas.Brush.Color := clWhite;
      //for r:=0 to n-1 do
      //  for c:=0 to n-1 do
      //    begin
      //      myArea := CellRect(c,r);
      //      Canvas.FillRect(myArea);
      //    end;
      Refresh;
      Canvas.Brush.Color := random($1000000);
      for r:=0 to n-1 do
        for c:=0 to n-1 do
          begin
            i:= c*r;
            //if i mod m = rest then
            if frac(sqrt(i)) = 0 then
              begin
                myArea := CellRect(c,r);
                Canvas.FillRect(myArea);
              end;
          end;
      if rest >= m-1 then
        begin
          rest := -1;
          inc(m);
          if m >= n*n then
            begin
              m:= 2;
              Timer1.Enabled := false;
            end;
        end;
    end;

end;

initialization
  randomize;

end.

