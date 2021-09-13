unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xpman, inifiles, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Edit1: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit2: TLabeledEdit;
    Button1: TButton;
    ListView1: TListView;
    RichEdit1: TRichEdit;
    Button2: TButton;
    Save: TSaveDialog;
    Open: TOpenDialog;
    ListView2: TListView;
    Edit4: TLabeledEdit;
    Button3: TButton;
    Edit5: TLabeledEdit;
    Button4: TButton;
    Label2: TLabel;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure ListView2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ini: tinifile;
  li: tlistitem;
  recn: integer;
  vrLength, vrSelStart: byte;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
begin
  if (edit1.Text <> '') and (edit2.Text <> '') and (edit3.Text <> '') then
  begin
    if save.Execute then
    begin
      if extractfileext(save.FileName) <> '.tes' then
        ini:= tinifile.Create(save.FileName + '.tes')
      else
        ini:= tinifile.Create(save.FileName);
      with ini do
      begin
        WriteString('����', 'tema', edit1.Text);
        WriteString('�������', 'variant', edit2.Text);
        WriteString('����� ��������', 'voprosov', edit3.Text);
      end;
      ListView1.Clear;
      for i:= 1 to strtoint(edit3.Text) do
      begin
        application.ProcessMessages;
        with ini do
        begin
          WriteString('�������', inttostr(i), '');
          Writestring('��������� ������', inttostr(i), '');
          WriteString('���������� �����', inttostr(i), '');
          WriteString(inttostr(i), '1', '');
        end;
        Li := listview1.Items.Add;
        Li.Caption := inttostr(i);
      end;
    end;
  end
  else
    messagebox(handle, '��������� ��� ��� ���� �����', '������', 16);
end;

procedure TForm1.ListView1Click(Sender: TObject);
var
  i: integer;
begin
  try
    with ini do
    begin
      recn:= listview1.ItemIndex + 1;
      listview2.Clear;
      listview1.Column[0].Caption:= '������ � ' + inttostr(recn);
      label2.Caption:= '������� ������ � ' + inttostr(recn);
      richedit1.Text:= ReadString('�������', inttostr(recn), '');
      edit4.Text:= readString('��������� ������', inttostr(recn), '');
      edit5.Text:= ReadString('���������� �����', inttostr(recn), '');
      for i:= 1 to strtoint(edit4.Text) do
        with listview2 do
        begin
          li:= items.Add;
          li.Caption:= ReadString(inttostr(recn), inttostr(i), '');
        end;
    end;
  except
//    messagebox(handle, '�������� ������� ������ �� ����� ��������� ������', '������', 16);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if recn <> 0 then
    ini.WriteString('�������', inttostr(recn), richedit1.Text)
  else
    messagebox(handle, '�������� ������', '������', 16);  
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if save.FileName <> '' then
    filesetattr(save.FileName, fareadonly);
  if open.FileName <> '' then
    filesetattr(open.FileName, fareadonly);
  if ini <> nil then
    ini.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i: integer;
begin
  try
    if (edit4.Text <> '') and (edit5.Text <> '') then
      with ini do
      begin
        WriteString('��������� ������', inttostr(recn), edit4.Text);
        writeString('���������� �����', inttostr(recn), edit5.Text);
        for i:= 1 to strtoint(edit4.text) do
          li:= listview2.Items.Add;
      end
    else
      messagebox(handle, '������� ���-�� ��������� ������ � ����� ����������� ������', '������', 16);
  except
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i: integer;
begin
  if listview2.Items.Count > 0 then
    for i:= 1 to strtoint(edit4.text) do
      ini.WriteString(inttostr(recn), inttostr(i), listview2.Items.Item[i - 1].Caption);
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  button3.Caption:= '�������� ' + edit4.Text + ' ��������� ������';
  button4.Caption:= '��������� ����� ' + edit4.Text +  ' ������� ';
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TLabeledEdit do
  begin
    vrLength := Length(Text); //���������� ����� ������
    vrSelStart := SelStart; //���������� ��������� �������
  end;
  case Key of

    '0'..'9':;
    ',', '.':
      begin
        if (vrSelStart = 0) or (vrLength = 0) then
          Key := #0 //"��������" �������
        else
          Key := #44; //������ �������� ����� �� �������
      end;
    #8: ; //��������� �������� ������ �������� 'Back Space'
  else
    Key := #0; //"��������" ��� ��������� �������
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TLabeledEdit do
  begin
    vrLength := Length(Text); //���������� ����� ������
    vrSelStart := SelStart; //���������� ��������� �������
  end;
  case Key of

    '0'..'9':;
    ',', '.':
      begin
        if (vrSelStart = 0) or (vrLength = 0) then
          Key := #0 //"��������" �������
        else
          Key := #44; //������ �������� ����� �� �������
      end;
    #8: ; //��������� �������� ������ �������� 'Back Space'
  else
    Key := #0; //"��������" ��� ��������� �������
  end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TLabeledEdit do
  begin
    vrLength := Length(Text); //���������� ����� ������
    vrSelStart := SelStart; //���������� ��������� �������
  end;
  case Key of

    '0'..'9':;
    ',', '.':
      begin
        if (vrSelStart = 0) or (vrLength = 0) then
          Key := #0 //"��������" �������
        else
          Key := #44; //������ �������� ����� �� �������
      end;
    #8: ; //��������� �������� ������ �������� 'Back Space'
  else
    Key := #0; //"��������" ��� ��������� �������
  end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TLabeledEdit do
  begin
    vrLength := Length(Text); //���������� ����� ������
    vrSelStart := SelStart; //���������� ��������� �������
  end;
  case Key of

    '0'..'9':;
    ',', '.':
      begin
        if (vrSelStart = 0) or (vrLength = 0) then
          Key := #0 //"��������" �������
        else
          Key := #44; //������ �������� ����� �� �������
      end;
    #8: ; //��������� �������� ������ �������� 'Back Space'
  else
    Key := #0; //"��������" ��� ��������� �������
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i: integer;
begin
  try
    if open.Execute then
      with ini do
      begin
        filesetattr(open.FileName, faArchive);
        ini:= tinifile.Create(open.FileName);
        edit1.Text:= readString('����', 'tema', '');
        edit2.Text:= readString('�������', 'variant', '');
        edit3.Text:= readString('����� ��������', 'voprosov', '');
        for i:= 1 to strtoint(edit3.Text) do
        begin
          Li:= listview1.Items.Add;
          Li.Caption := inttostr(i);
        end;
      end;
  except
  end;
end;

procedure TForm1.ListView2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then listview2.ItemFocused.EditCaption;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  application.HintHidePause:= 5000;
end;

end.
