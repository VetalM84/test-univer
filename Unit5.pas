unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Save: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  with form1 do
  begin
    VNo:= 0;
    StOtvet:= 0;
    PrOtvet:= 0;
    cache:= 0;
    pravotv:= 0;
    vno:= 1;
    bal:= 0;
    sl.Clear;
    button2.Enabled:= false;
    button4.Enabled:= true;
    button2.Caption:= 'Следующий вопрос';
    edit1.Clear;
    maskedit1.Clear;
    radio2.Items.Clear;
    memo1.Clear;
    label1.Caption:= 'Оценка: ';
    label2.Caption:= 'Тема: ';
    label3.Caption:= 'Вариант № ';
    label5.Visible:= false;
    ShowWindow(Application.Handle, sw_show);
  end;
  close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  save.FileName:= form1.Edit1.Text + ' ' + form1.MaskEdit1.Text + ' ' + datetostr(date) + '.txt';
  if save.Execute then
    listbox1.Items.SaveToFile(save.FileName);
  filesetattr(save.FileName, fareadonly);
  button1.Enabled:= true;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  button1.Enabled:= false;
end;

end.
