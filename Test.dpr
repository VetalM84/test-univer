program Test;

uses
  Forms,
  windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit5 in 'Unit5.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

var
  hwnd: THandle;

{$R *.res}

begin
  hwnd := FindWindow('TForm1', 'Тест');
  if hwnd = 0 then
  begin
    Application.Initialize;
    Application.Title := 'Тест по электропиводу';
    Application.CreateForm(TForm1, Form1);
    Application.CreateForm(TForm2, Form2);
    Application.Run;
  end
  else
    SetForegroundWindow(hwnd);
end.
