program StrawberryFields;

uses
  Forms,
  Morango in 'Morango.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Morango';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
