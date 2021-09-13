unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
  form3:= nil;
end;

end.
