unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLType, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
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
  AR1: array[0..3] of TPoint =
    (
    (X:150;Y:175),
    (X:175;Y:85),
    (X:200;Y:80),
    (X:175;Y:65)
    );
  AR2: array[0..3] of TPoint =
    (
    (X:250;Y:80),
    (X:280;Y:65),
    (X:300;Y:70),
    (X:280;Y:85)
    );
  AR3: array[0..4] of TPoint =
    (
    (X:190;Y:185),
    (X:220;Y:170),
    (X:250;Y:170),
    (X:270;Y:180),
    (X:230;Y:210)
    );
  Rgn1, Rgn2, Rgn3: HRGN;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rgn1 := CreatePolygonRgn(AR1, 4, WINDING);
  Rgn2 := CreatePolygonRgn(AR2, 4, WINDING);
  Rgn3 := CreatePolygonRgn(AR3, 5, WINDING);

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if PTInRegion(Rgn1,X,Y) then Label2.Show else Label2.Hide;
  if PTInRegion(Rgn2,X,Y) then Label3.Show else Label3.Hide;
  if PTInRegion(Rgn3,X,Y) then Label1.Show else Label1.Hide;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DeleteObject(Rgn1);
  DeleteObject(Rgn2);
  DeleteObject(Rgn3);
end;

end.

