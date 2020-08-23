unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids;

type
  TForm1 = class(TForm)
    HourEdit: TLabeledEdit;
    MinuteEdit: TLabeledEdit;
    SecEdit: TLabeledEdit;
    DayEdit: TLabeledEdit;
    WeeksEdit: TLabeledEdit;
    WeeksResult: TLabeledEdit;
    DaysResult: TLabeledEdit;
    HoursResult: TLabeledEdit;
    MinutesResult: TLabeledEdit;
    SecondsResult: TLabeledEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    ListBox2: TListBox;
    TimeGrid: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Open1: TOpenDialog;
    Save1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EditSelectAllText(Sender: TObject);
    procedure SecEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
WEEK_ID=0;
DAY_ID=1;
HOUR_ID=2;
MIN_ID=3;
SEC_ID=4;

//-----------------------------------------------

function FillZeroes(val:String):String;
begin
if length(val)=1 then
  result:= '0'+val
else
  result:= val;
end;

procedure LoadTimegridToEdits(index:Integer);
begin
with Form1 do
  begin
  WeeksEdit.Text:= TimeGrid.Cells[WEEK_ID,index];
  DayEdit.Text := TimeGrid.Cells[DAY_ID,index];
  HourEdit.Text := TimeGrid.Cells[HOUR_ID,index];
  MinuteEdit.Text := TimeGrid.Cells[MIN_ID,index];
  SecEdit.Text := TimeGrid.Cells[SEC_ID,index];
  end;
end;

procedure LoadEditsToListbox(index:Integer);
var vs:string;
begin
with Form1 do
 begin
 if not( WeeksEdit.Text='0') then
   vs:=WeeksEdit.Text+'W ';
 if not( DayEdit.Text='0') then
   vs:=vs+DayEdit.Text+'D ';
 vs:=vs+'        '+FillZeroes(HourEdit.Text)+':';
 vs:=vs+FillZeroes(MinuteEdit.Text)+':';
 vs:=vs+FillZeroes(SecEdit.Text);
 if Listbox2.Items.Count=index then
   Listbox2.Items.Add(vs)
 else
   Listbox2.Items.Strings[index]:=vs;
 end;
end;

procedure LoadEditsToTimegrid(index:Integer);
begin
with Form1 do
 begin
 TimeGrid.Cells[WEEK_ID,index]:= WeeksEdit.Text;
 TimeGrid.Cells[DAY_ID,index] := DayEdit.Text;
 TimeGrid.Cells[HOUR_ID,index] := HourEdit.Text;
 TimeGrid.Cells[MIN_ID,index] := MinuteEdit.Text;
 TimeGrid.Cells[SEC_ID,index] := SecEdit.Text;
 end;
end;

function SumSeconds():Integer;
var
sum, i, selected:Integer;
begin
sum:=0;
if Form1.ListBox2.ItemIndex>-1 then
  selected:=Form1.ListBox2.ItemIndex
else
  selected:=Form1.TimeGrid.RowCount-1;
with Form1 do
if Listbox2.Items.Count>0 then
for i:=0 to selected do
  begin
  sum:= sum
  +(StrToInt(TimeGrid.Cells[WEEK_ID, i])*3600*24*7 )
  +(StrToInt(TimeGrid.Cells[DAY_ID , i])*3600*24   )
  +(StrToInt(TimeGrid.Cells[HOUR_ID, i])*3600      )
  +(StrToInt(TimeGrid.Cells[MIN_ID , i])*60        )
  +(StrToInt(TimeGrid.Cells[SEC_ID , i])           )
  end;
result:=sum;
end;

function SumMinutes(sec:Integer): String;
var
m,s:integer;
begin
 m:=sec div 60;
 s:=sec mod 60;
 result:=FillZeroes(IntToStr(m))+':'+FillZeroes(IntToStr(s));
end;

function sumHours(sec:Integer): String;
var
h:integer;
begin
 h:= sec div 3600;
 result:= FillZeroes(IntToStr(h))+':'+SumMinutes(sec mod 3600);
end;

function sumDays(sec:Integer): String;
var
d:integer;
begin
d:= sec div (3600*24);
result:= IntToStr(d)+'D     '+sumHours(sec mod (3600*24));
end;

function sumWeeks(sec:Integer): String;
var
w:Integer;
begin
w:= sec div (3600*24*7);
result:= IntToStr(w)+'W '+sumDays(sec mod (3600*24*7));
end;

procedure SumUpResults();
var
s:integer;
begin
s:=SumSeconds;
with Form1 do
  begin
  SecondsResult.Text:=IntToStr(s);
  MinutesResult.Text:=sumMinutes(s);
  HoursResult.Text:=sumHours(s);
  DaysResult.Text:=sumDays(s);
  WeeksResult.Text:=sumWeeks(s);
  end;
end;

procedure FillTimegridBasedOnListbox();
var
i,posW,posD:integer;
s:string;
begin
Form1.TimeGrid.RowCount:=Form1.ListBox2.Items.Count;
with Form1 do
  for i:=0 to listbox2.Items.Count-1 do
    begin
    s:=Listbox2.Items.Strings[i];

    posW:= pos('W',s);
    if posW=0 then
      TimeGrid.Cells[WEEK_ID,i]:=intToStr(0)
     else
      begin
      TimeGrid.Cells[WEEK_ID,i]:=copy(s,1,posW-1);
      s:=copy(s,posW+2,255);
      end;

    posD:= pos('D',s);
    if posD=0 then
      TimeGrid.Cells[DAY_ID,i]:=intToStr(0)
     else
      begin
      TimeGrid.Cells[DAY_ID,i]:=copy(s,1,posD-1);
      s:=copy(s,posD+2,255);
      end;

     s:=copy(s,9,8);
     TimeGrid.Cells[HOUR_ID,i] := copy(s,1,2);
     TimeGrid.Cells[MIN_ID,i] := copy(s,4,2);
     TimeGrid.Cells[SEC_ID,i] := copy(s,7,2);
    end;
end;

//-----------------------------------------------


procedure TForm1.Button1Click(Sender: TObject);
var
vs:string;
s: string;
i:integer;
begin
i:= TimeGrid.RowCount-1;
if length(TimeGrid.Cells[0,0])>0 then
  begin
  TimeGrid.RowCount:=TimeGrid.RowCount+1;
  inc(i);
  end;
LoadEditsToTimegrid(i);
LoadEditsToListbox(Listbox2.items.count);
Listbox2.ItemIndex:=Listbox2.Items.Count-1;
SumUpResults;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
i: integer;
begin
i:=Listbox2.ItemIndex;

if i>-1 then
 begin
 LoadEditsToTimegrid(i);
 LoadEditsToListbox(i);
 SumUpResults;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Timegrid.RowCount:=Timegrid.RowCount-1;
Listbox2.Items.Delete(Listbox2.Items.Count-1);
if Listbox2.Items.Count=0 then
  Timegrid.Rows[0].Clear;
SumUpResults;
end;

procedure TForm1.EditSelectAllText(Sender: TObject);
begin
(Sender as TLabeledEdit).SelectAll;
end;

procedure TForm1.SecEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_Return then
Form1.Button1Click(nil);
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
SumUpResults;
LoadTimegridToEdits(Listbox2.ItemIndex);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if Open1.Execute then
  begin
  Listbox2.Items.LoadFromFile(Open1.FileName);
  FillTimegridBasedOnListbox;
  Form1.Caption:= 'Time Calculator - '+ Open1.FileName;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if Save1.Execute then
  begin
  Listbox2.Items.SaveToFile(Save1.FileName);
  end;
end;

end.
