unit Morango;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, ShellAPI, Buttons, jpeg, MPlayer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Morango: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    procedure MorangoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MorangoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MorangoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    MouseDownSpot: TPoint;
    Capturing: BOOL;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MorangoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Capturing then begin
    ReleaseCapture;
    Capturing := false;
    Morango.Left := Morango.Left - (MouseDownSpot.x -x);
    Morango.Top := Morango.Top - (MouseDownSpot.y - y);
end;
end;

procedure TForm1.MorangoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Capturing then
  begin
    Morango.Left:= Morango.Left-(MouseDownSpot.x-x);
    Morango.Top:= Morango.Top - (MouseDownSpot.y-y);
  end;
end;

procedure TForm1.MorangoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetCapture(Morango.Handle);
  Capturing := true;
  MouseDownSpot.X := x;
  MouseDownSpot.Y := Y;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   ShellExecute(Handle,'open','https://conceito.de/morango', '',nil,0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  fundo:TImage;
  CaminhoImg:String;
  CaminhoMp3: string;
begin
  fundo:= TImage.Create(Panel1);
  fundo.Parent:= Panel1;
  fundo.Visible:=True;
  fundo.Align:= alClient;
  Button1.Font.Color:= clRed;

  CaminhoImg:= GetCurrentDir + '\fundo.bmp';
  fundo.Picture.LoadFromFile(CaminhoImg);

  MediaPlayer1 := TMediaPlayer.Create(Self);
  MediaPlayer1.Parent := Self;
  CaminhoMp3:= GetCurrentDir + '\musica.wav';
  MediaPlayer1.FileName := CaminhoMp3;
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

end.
