//This is the source code for the tip calculator app from Week 2 of the
//Introduction to Android Mobile Development with Delphi by Jim McKeeth
//https://www.embarcaderoacademy.com/p/introduction-to-mobile-development/
//
//Written in Delphi 10.2.1 "Tokyo"
//Designed for Android, iOS, macOS, and Windows.
//
//Copyright (c) 2017 by Jim McKeeth, Embarcadero Technologies

unit TipCalcUnit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Controls.Presentation, FMX.ListBox,
  FMX.Layouts,
  // This unit gives us the nice mobile preview theme
  FMX.MobilePreview;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    lbQualities: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Label1: TLabel;
    edtNet: TNumberBox;
    lblMin: TLabel;
    trkMin: TTrackBar;
    ListBoxItem5: TListBoxItem;
    lblMax: TLabel;
    trkMax: TTrackBar;
    lblTip: TListBoxItem;
    procedure Recalc(Sender: TObject);
    procedure edtNetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

// This function counts the number of items checked in a listbox
function CountChecks(lb:TListBox): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to lb.Items.Count - 1 do
    if lb.ListItems[I].IsChecked then
      Result := Result + 1;
end;

procedure TForm1.edtNetClick(Sender: TObject);
begin
  edtNet.SelectAll;
end;

procedure TForm1.Recalc(Sender: TObject);
var
  rate, ratevar, tip: Single;
begin
  // Format %d is for a integer (whole number) and %% shows a percent sign
  lblMin.Text := Format('Min Tip: %d%%', [Trunc(trkMin.Value)]);

  // If the Min is higher than the max, adjust it!
  if trkMin.Value > trkMax.Value then
    trkMax.Value := trkMin.Value;

  lblMax.Text := Format('Max Tip: %d%%', [Trunc(trkMax.Value)]);

  ratevar := trkMax.Value - trkMin.Value;
  rate := trkMin.Value + (ratevar * CountChecks(lbQualities) / lbQualities.Count);
  tip := edtNet.Value * rate / 100;

  // Display the final tip : %m formats like currency
  lblTip.Text := Format('Tip: %m (%d%%) / Total: %m',
    [tip, Trunc(rate), tip + edtNet.Value]);
end;

end.
