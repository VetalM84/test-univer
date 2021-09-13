unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, psvDialogs;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Button2: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button3: TButton;
    Folder: TpsvBrowseFolderDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit4, uEncrypt;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
  ini.WriteString('OpenDir', 'dir', edit1.Text);
  if edit3.Modified = true then
    ini.WriteString('Password', 'Hint', edit3.Text);
  close;
end;

procedure TForm2.Button1Click(Sender: TObject);
  label 1;
begin
  1: decr:= decrypt(ini.ReadString('Password', 'pas', ''), my_key);
  pas:= inputbox('»зменение парол€', '¬ведите старый пароль', '');
  if pas = decr then begin
    pas:= inputbox('»зменение парол€', '¬ведите новый пароль', '');
    encr:= encrypt(pas, my_key);
    ini.WriteString('Password', 'pas', encr);
  end
  else
  begin
    otv:= MessageBox(handle,PChar('¬веденный пароль не совпадает со старым'),
    PChar('»зменение парол€'), 21);
    if otv = IDRETRY then
      goto 1;
    if otv = IDCANCEL then ;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  edit1.Text:= ini.ReadString('OpenDir', 'Dir', '');
  edit3.Text:= ini.ReadString('Password', 'Hint', '');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  folder.Execute;
  edit1.Text:= folder.FolderName;
  form2.SetFocus
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  form2:= nil;
end;
{var
  sEncrypted, sDecrypted :AnsiString;
begin
  // Encrypt a string
  sEncrypted := Encrypt(edit1.text, strtoint(edit2.Text));
  // Show encrypted string
  label1.Caption:= sencrypted;
  // Decrypt the string
  sDecrypted := Decrypt(sEncrypted, strtoint(edit2.text));
   // Show decrypted string
  label2.Caption:= sDecrypted;
}
end.


