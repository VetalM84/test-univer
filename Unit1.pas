unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, inifiles, xpman, Mask, sCalculator, math,
  Spin, Buttons;

type
  TForm1 = class(TForm)
    Radio2: TRadioGroup;
    StatusBar1: TStatusBar;
    Button2: TButton;
    Button4: TButton;
    Openf: TOpenDialog;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Memo1: TRichEdit;
    Edit1: TEdit;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Calc: TsCalculator;
    Button1: TButton;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  test: tinifile;
  run: boolean;  // работает ли тест
  timestart, timeend: string;
  hot,  // горячая клавиша
  VNo,  // вопрос №
  StOtvet, // ответ студента
  otvet,
  PrOtvet, // правильный ответ
  cache,    // предварительный ответ
  pravotv // кол-во правильных ответов
  : integer;
  bal            // оценка
  : double;
  sl: tstringlist;
  const
    MOD_ALT = 1;
    MOD_CONTROL = 2;
    MOD_SHIFT = 4;
    VK_L = 76;

implementation

uses Unit5, Unit3;

{$R *.dfm}
procedure TForm1.WMHotKey(var Msg: TWMHotKey);
begin
  if (Msg.HotKey = hot) and form2.Visible then
  begin
    run:= false;
    form2.button1.Enabled:= true;
  end
  else
    if Msg.HotKey = hot then
    begin
      run:= false;
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
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  caption:= 'Тест';
  sl:= tstringlist.Create;
  hot:= GlobalAddAtom('AnLockApp');
  RegisterHotKey(Handle, hot, MOD_CONTROL + mod_alt, VK_L);
  vno:= 1;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i2: integer;
begin
  if GetKeyState(VK_SHIFT) < 0 then
  begin
    form3:= tform3.Create(form1);
    form3.ShowModal;
  end
  else
// открыть файл
  if openf.Execute then
  begin
    ShowWindow(Application.Handle, sw_Hide);
    run:= true;
    button4.Enabled:= false;
    test:= tinifile.Create(openf.FileName);
    label2.Caption:= 'Тема: ' + test.ReadString('Тема', 'tema', '');
    label3.Caption:= 'Вариант №' + test.ReadString('Вариант', 'variant', '');
    statusbar1.Panels[0].Text:= 'Всего вопросов: ' + test.Readstring('Всего вопросов', 'voprosov', '');
    button2.Enabled:= true;
    timestart:= timetostr(now);

    memo1.Text:= test.readstring('Вопросы', inttostr(vno), '');
    radio2.Items.Clear;
    for i2:= 0 to test.ReadInteger('Вариантов ответа', inttostr(vno), 0) - 1 do
    begin
      application.ProcessMessages;
      radio2.Items.Add(inttostr(i2));
      radio2.Items.Strings[i2]:= test.ReadString(inttostr(vno), inttostr(i2 + 1), '');//1
    end;
    with statusbar1 do
    begin
      Panels[1].Text:= 'Текущий вопрос № ' + inttostr(vno); //1
      panels[2].Text:= 'Осталось ответить на ' + inttostr(test.ReadInteger('Всего вопросов', 'voprosov', 0) - vno);
    end;
    inc(vno);
    otvet:= test.ReadInteger('Правильный ответ', inttostr(vno - 1), 0);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// отмена регистрации горячих клaвишь
  UnRegisterHotKey(Handle, hot);
  GlobalDeleteAtom(hot);
  sl.Free;
  if test <> nil then
    test.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, i2: integer;
begin
// отображаем следующий вопрос
  if button2.Caption = 'Завершить' then
  begin
    stotvet:= radio2.ItemIndex + 1;
    sl.Add(inttostr(vno - 1) + ' = ' + inttostr(stotvet));
    protvet:= test.ReadInteger('Правильный ответ', inttostr(vno - 1), 0);
    if stotvet = protvet then
      inc(pravotv);
    bal:= roundto((pravotv * 5)/test.Readinteger('Всего вопросов', 'voprosov', 0), -2);// оценка
    if bal > 5 then
      bal:= 5;
    if bal < 0 then
      bal:= 0;
    label1.Caption:= 'Оценка: ' + floattostr(bal);
    with form2.ListBox1.Items do
    begin
      clear;
      add('Дата ' + datetostr(date));
      add('Время начала ' + timestart);
      add('Время окончания ' + timetostr(now));
      Add('Студент: ' + form1.edit1.Text);
      add('Группа: ' + maskedit1.Text);
      add(form1.label2.Caption);
      add(form1.label3.Caption);
      add('Всего вопросов: ' +  inttostr(test.Readinteger('Всего вопросов', 'voprosov', 0)));
      add('Правильных ответов: ' + inttostr(pravotv));
      add('Неправильных ответов: ' + inttostr(test.Readinteger('Всего вопросов', 'voprosov', 0) - pravotv));
      add('Оценка: ' + floattostr(bal));
      add('');
      add('ОТВЕТЫ:');
      add('');
      add('Номер вопроса = Ответ студента');
      for i:= 0 to sl.Count - 1 do
        add(sl.Strings[i]);
    end;
    form2.Showmodal;
  end
  else
  begin
    stotvet:= cache;
    cache:= radio2.ItemIndex + 1;

    sl.Add(inttostr(vno - 1) + ' = ' + inttostr(cache));

    memo1.Text:= test.readstring('Вопросы', inttostr(vno), '');//2
    radio2.Items.Clear;                                        // загр. 2 вопр
    for i2:= 0 to test.ReadInteger('Вариантов ответа', inttostr(vno), 0) - 1 do
    begin
      application.ProcessMessages;
      if test.ReadInteger('Вариантов ответа', inttostr(vno), 0) <= 4 then
        radio2.Columns:= 1
      else
        radio2.Columns:= 2;
      with radio2.Items do
      begin
        Add(inttostr(i2));
        Strings[i2]:= test.ReadString(inttostr(vno), inttostr(i2 + 1), '');
      end;
    end;

    protvet:= test.ReadInteger('Правильный ответ', inttostr(vno - 1), 0); //1 проверяем ответ 1 вопр
    otvet:= test.ReadInteger('Правильный ответ', inttostr(vno), 0);

    if cache = protvet then
      inc(pravotv);
    stotvet:= radio2.ItemIndex + 1;     // запоминаем ответ 2 вопр

    with statusbar1 do
    begin
      Panels[1].Text:= 'Текущий вопрос № ' + inttostr(vno);
      panels[2].Text:= 'Осталось ответить на ' + inttostr(test.ReadInteger('Всего вопросов', 'voprosov', 0) - vno);
    end;
    if vno = test.ReadInteger('Всего вопросов', 'voprosov', 0) then
      button2.caption:= 'Завершить';
    inc(vno);  //3
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  calc.Execute;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if run then
  begin
    messagebox(handle, 'Нельзя выходить из программы до завершения теста!',
    'Внимание', 48);
    canclose:= false;
  end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if label5.Visible then
    label5.Visible:= false;
end;

procedure TForm1.SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if run then
  begin
    with label5 do
    begin
      Visible:= true;
      caption:= inttostr(otvet);
    end;
  end;
end;

end.

