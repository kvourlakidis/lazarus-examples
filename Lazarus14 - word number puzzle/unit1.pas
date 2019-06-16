unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  k,o,m,p,j,u,t,e,r,i,
    kompjuter,port,piter: integer;
  Tick: Cardinal;
begin
  Tick := GetTickCount;
  for k:=1 to 9 do
    for o:=0 to 9 do
      if o<>k then
        for m:=0 to 9 do
          if (m<>k) and (m<>o) then
            for p:=1 to 9 do
              if (p<>k) and (p<>o) and (p<>m) then
                for j:=0 to 9 do
                  if (j<>k) and (j<>o) and (j<>m) and (j<>p) then
                    for u:=0 to 9 do
                      if (u<>k) and (u<>o) and (u<>m) and (u<>p) and (u<>j) then
                        for t:=0 to 9 do
                          if (t<>k) and (t<>o) and (t<>m) and (t<>p) and (t<>j) and (t<>u) then
                            for e:=0 to 9 do
                              if (e<>k) and (e<>o) and (e<>m) and (e<>p) and (e<>j) and (e<>u) and (e<>t) then
                                for r:=0 to 9 do
                                  if (r<>k) and (r<>o) and (r<>m) and (r<>p) and (r<>j) and (r<>u) and (r<>t) and (r<>e) then
                                    for i:=0 to 9 do
                                      if (i<>k) and (i<>o) and (i<>m) and (i<>p) and (i<>j) and (i<>u) and (i<>t) and (i<>e) and (i<>r) then
                                        begin
                                          port := p*1000 + o*100 + r*10 + t;
                                          piter := p*10000 + i*1000 + t*100 + e*10 + r;
                                          kompjuter := k*100000000 + o*10000000 + m*1000000 + p*100000 + j*10000 + u*1000 + t*100 + e*10 + r;
                                          if piter * port = kompjuter then
                                            ListBox1.Items.Add('KOMPJUTER= ' + IntToStr(kompjuter) + ' PORT= ' + IntToStr(port) + ' PITER= ' + IntToStr(piter));
                                        end;

  Button1.Caption := 'DONE';
  Form1.Caption := IntToStr(GetTickCount - Tick);
end;

end.

