unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
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

var i: integer = 1;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Screen.Cursor := crHourGlass;
  //Sleep(3000);
  //Screen.Cursor := crDefault;
  dec(i);
  if i < -22 then Close else
    begin
      Edit1.Text := IntToStr(i);
      Screen.Cursor := i;
    end;
end;

end.

