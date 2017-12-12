unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Grids, ActnList, Menus, CheckLst,unit3;



type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    ScrollBar1: TScrollBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);

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
uses
  Unit1,Unit4;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button2Click(Sender: TObject);
var l,k,kod_tovaru,mnozstvo: integer;
begin
  mnozstvo:=strtoint(edit2.text);
  kod_tovaru:=strtoint(edit1.text);
  for k:= 1 to n do
      begin
        if kod_tovaru=zoznam[k].kod then begin
                                         memo2.append(zoznam[k].nazov + ' ' + inttostr(mnozstvo));
                                         end
                                     else Label3.Caption:='Chyba! Nenasiel som kod.';
      end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form3.Show;

end;

procedure TForm2.FormCreate(Sender: TObject);
var x,y,i: integer;
begin
 assignfile(subor,'najpredavanejsie.txt');
 reset(subor);
 i:=0;
 x:=20;
 y:=20;
 //memo1.clear;
 memo2.clear;
// nevieme komunikovat medzi formami = label4.caption:='pokladnik: ';


 Image1.Canvas.FillRect(clientrect);

 while not eof (subor) do
       begin
         inc(i);

         readln(subor,zoznam[i].nazov);
         readln(subor,zoznam[i].kod);

         Image1.Canvas.textout(x,y*i,zoznam[i].nazov);
         end;
Memo2.Append('ÚČTENKA');

end;

procedure TForm2.MenuItem1Click(Sender: TObject);
begin

end;


end.

