unit StudentInformation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, DataModule, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    qry1: TADOQuery;
    pnl1: TPanel;
    img1: TImage;
    img2: TImage;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    cbb2: TComboBox;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    mmo1: TMemo;
    mmo2: TMemo;
    lbl17: TLabel;
    lbl18: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
Unit6;

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Visible := false;
  Form6.Visible := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

    qry1.open;
    while not qry1.Eof do
    begin
      cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
      Qry1.Next;
    end;
  qry1.Close;

end;

procedure TForm1.img1Click(Sender: TObject);
var
  iConfirm : integer;
begin

iConfirm := MessageDlg('Are you sure you want DELETE this record?', mtConfirmation, [mbYes, mbNo], 0);
  if iConfirm = mrYes then
  begin
    qry1.SQL.Text := 'Select * FROM Students WHERE FirstName = ''' + Copy(cbb1.Text, 1, Pos(' ', cbb1.Text) - 1) + ''' OR LastName = ''' + Copy(cbb1.Text, Pos(' ', cbb1.Text) + 1, Length(cbb1.Text) - Pos(' ', cbb1.Text))  + '''';
    qry1.Open;
    qry1.Delete;
    qry1.close;

  // Refresh combobox
      cbb1.Clear;
      qry1.SQL.Text := 'SELECT FirstName, LastName, ID FROM Students';
      qry1.Open;
      while not qry1.Eof do
      begin
        cbb1.Items.Add(qry1.FieldByName('FirstName').AsString + ' ' + qry1.FieldByName('LastName').AsString);
        qry1.Next;
      end;
      qry1.Close;

  if cbb1.Text = '' then
  begin
        {lbl2.Visible := False;
        lbl3.Visible := False;
        lbl4.Visible := False;
        lbl5.Visible := False;
        edt1.Visible := False;
        edt2.Visible := False;
        edt3.Visible := False;
        edt4.Visible := False;
        img4.Visible := False;
        chk1.Visible := False;
      end
      else
      begin
        lbl2.Visible := true;
        lbl3.Visible := True;
        lbl4.Visible := True;
        lbl5.Visible := True;
        edt1.Visible := False;
        edt2.Visible := False;
        edt3.Visible := False;
        edt4.Visible := False;
        img4.Visible := False;
        chk1.Visible := True;
      end;            }
  end;


end;
end;

end.
