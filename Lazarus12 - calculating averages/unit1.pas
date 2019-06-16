unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  i, n: integer;
  s, a: real;
begin
  s := 0;
  n := ListBox1.Items.Count;
  for i:=0 to n-1 do
    s := s + StrToFloat(ListBox1.Items[i]);
    a := s/n;
    Edit1.Text := FloatToStr(a);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
begin
  i := ListBox1.ItemIndex;
  ListBox1.Items.Delete(i);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  code: integer;
  a: real;
begin
  Val(Edit1.Text, a, code);
  if code = 0 then
    ListBox1.Items.Add(FloatToStr(a))
  else
    ShowMessage('Enter a number!');
  Edit1.Text := '';
  Edit1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i, n: integer;
  s, a: real;
begin
  s := 0;
  n := ListBox1.Items.Count;
  for i := 0 to n-1 do
    begin
      s := s + sqr(StrToFloat(ListBox1.Items[i]));
    end;
  a := sqrt(s/n);
  Edit1.Text := FloatToStr(a);
end;

end.

