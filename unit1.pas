<<<<<<< HEAD
unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

=======
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
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record
     meno:string;
     heslo:integer;
end;
const n=10;
var zamestnanci: array [1..n] of zaznam;
    subor: textfile;
    znak: char;
    heslo:integer;
    meno: string;
  Form1: TForm1;

implementation
uses
  Unit2;

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
var j: integer;
begin
heslo:=strtoint(edit2.text);
meno:= edit1.text;
label7.visible:=False;

for j:= 1 to n do
    begin
      if (meno=zamestnanci[j].meno) and (heslo=zamestnanci[j].heslo) then
                                                                     begin
                                                                     Form1.Visible:=False;
                                                                     Form2.Show;

                                                                     end
      else begin
           label7.visible:=True;
           label7.caption:='CHYBNE PRIHLASOVACIE UDAJE! SKUSTE ZNOVU';
           end;
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
  assignfile(subor,'ZAMESTNANCI.txt');
  reset(subor);
  i:=0;
  while not eof (subor) do
        begin
          inc(i);

          readln(subor,zamestnanci[i].meno);
          readln(subor,zamestnanci[i].heslo);

          memo1.append(zamestnanci[i].meno);
          memo1.append(inttostr(zamestnanci[i].heslo));

        end;
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin

end;

end.

>>>>>>> 08ad622f321fb392a5889439fef73e19e541a629
