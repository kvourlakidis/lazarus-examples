unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  StrUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
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

procedure ins(e1,e2,e3,e4,e5: TEdit; s: string);
begin
  e1.Text := s[1];
  e2.Text := s[2];
  e3.Text := s[3];
  e4.Text := s[4];
  e5.Text := s[5];
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
  myList: array of string;
begin
  SetLength(myList,ListBox1.Items.Count);
  for i := 0 to (ListBox1.Items.Count-1) do
    begin
      myList[i] := ListBox1.Items[i]
    end;
  if (Length(Edit17.Text) = 5) and (AnsiMatchText(Edit17.Text,myList) = false) then
    ListBox1.Items.Add(Edit17.Text)
  else
    ShowMessage('Incorrect word length!');
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
  f: boolean;
  i0, i1, i2, i3, i4: integer;
begin
  f := false;
  i1 := -1;
  for i0:= 0 to ListBox1.Items.Count-1 do
    ListBox1.Selected[i0] := false;
    while (f = false) and (i1 < ListBox1.Items.Count-1) do
      begin
        inc(i1);
        Edit1.Text := '';
        Edit2.Text := '';
        Edit3.Text := '';
        Edit4.Text := '';
        Edit5.Text := '';
        Edit6.Text := '';
        Edit7.Text := '';
        Edit8.Text := '';
        Edit9.Text := '';
        Edit10.Text := '';
        Edit11.Text := '';
        Edit12.Text := '';
        Edit13.Text := '';
        Edit14.Text := '';
        Edit15.Text := '';
        Edit16.Text := '';
        if ListBox1.Selected[i1] = false then
          begin
            ListBox1.Selected[i1] := true;
            ins(Edit1,Edit2,Edit3,Edit4,Edit5,ListBox1.Items[i1]);
            i2 := -1;
            while (f = false) and (i2 < ListBox1.Items.Count-1) do
              begin
                inc(i2);
                if (ListBox1.Selected[i2]=false) and
                   (ListBox1.Items[i1][2]=ListBox1.Items[i2][2]) then
                  begin
                    ListBox1.Selected[i2] := true;
                    ins(Edit6,Edit2,Edit8,Edit11,Edit15,ListBox1.Items[i2]);
                    i3 := -1;
                    while (f=false) and (i3<ListBox1.Items.Count-1) do
                      begin
                        inc(i3);
                        if (ListBox1.Selected[i3]=false) and
                           (ListBox1.Items[i3][2]=ListBox1.Items[i2][4]) then
                          begin
                            ListBox1.Selected[i3] := true;
                            ins(Edit10,Edit11,Edit12,Edit13,Edit14,ListBox1.Items[i3]);
                            i4 := -1;
                            while (f=false) and (i4<ListBox1.Items.Count-1) do
                              begin
                                inc(i4);
                                if (ListBox1.Selected[i4]=false) and
                                   (ListBox1.Items[i4][2] = ListBox1.Items[i1][4]) and
                                   (ListBox1.Items[i4][4] = ListBox1.Items[i3][4]) then
                                  begin
                                    ListBox1.Selected[i4] := true;
                                    ins(Edit7, Edit4, Edit9, Edit13, Edit16, ListBox1.Items[i4]);
                                    f := true;
                                  end;
                              end;
                            if (f=false) then
                              ListBox1.Selected[i3] := false;
                          end;
                      end;
                    if (f=false) then
                      ListBox1.Selected[i2] := false;
                  end;
              end;
            if (f=false) then
              ListBox1.Selected[i1] := false;
          end;
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,n: integer;
begin
  n := ListBox1.Items.Count;
  for i:=0 to n-1 do
    begin
      ListBox1.Selected[i] := true;
      ListBox1.Refresh;
      Sleep(50);
    end;
end;

end.

