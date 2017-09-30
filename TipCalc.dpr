//This is the source code for the tip calculator app from Week 2 of the
//Introduction to Android Mobile Development with Delphi by Jim McKeeth
//https://www.embarcaderoacademy.com/p/introduction-to-mobile-development/
//
//Written in Delphi 10.2.1 "Tokyo"
//Designed for Android, iOS, macOS, and Windows.
//
//Copyright (c) 2017 by Jim McKeeth, Embarcadero Technologies
program TipCalc;

uses
  System.StartUpCopy,
  FMX.Forms,
  TipCalcUnit1 in 'TipCalcUnit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
