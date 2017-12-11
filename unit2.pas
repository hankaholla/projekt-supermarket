unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons,unit3;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
 type zaznam=record
      nazov: string;
      kod: integer;
 end;
const n=10;
var zoznam: array[1..n] of zaznam;
  subor: textfile;
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button2Click(Sender: TObject);
var l,k,kod_tovaru: integer;
begin
  kod_tovaru:=strtoint(edit1.text);
  for k:= 1 to n do
      begin
        if kod_tovaru=zoznam[k].kod then begin
                                         memo2.append(zoznam[k].nazov);
                                         end;
      end;
end;
procedure TForm2.Button1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.FormCreate(Sender: TObject);
var i: integer;
begin
 assignfile(subor,'zoznam.txt');
 reset(subor);
 i:=0;
 memo1.clear;
 memo2.clear;

 while not eof (subor) do
       begin
         inc(i);

         readln(subor,zoznam[i].nazov);
         readln(subor,zoznam[i].kod);

         memo1.append(zoznam[i].nazov + ' ' + inttostr(zoznam[i].kod));
end;

end;

end.

