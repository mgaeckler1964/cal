{
		Project:		CAL
		Module:			Lernen.pas
		Description:	Lernen
		Author:			Martin Gäckler
		Address:		Hofmannsthalweg 14, A-4030 Linz
		Web:			https://www.gaeckler.at/

		Copyright:		(c) 1995-2026 Martin Gäckler

		This program is free software: you can redistribute it and/or modify  
		it under the terms of the GNU General Public License as published by  
		the Free Software Foundation, version 3.

		You should have received a copy of the GNU General Public License 
		along with this program. If not, see <http://www.gnu.org/licenses/>.

		THIS SOFTWARE IS PROVIDED BY Martin Gäckler, Linz, Austria ``AS IS''
		AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
		TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
		PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
		CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
		SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
		LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
		USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
		ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
		OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
		OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
		SUCH DAMAGE.
}
unit Lernen;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, DB, DBTables, SysUtils, Dialogs, ComCtrls;

type
  TLernenDlg = class(TForm)
	OKButton: TBitBtn;
	BadButton: TBitBtn;
	Bevel1: TBevel;
	Label1: TLabel;
	Label2: TLabel;
	resultList: TListBox;
    BitBtnClose: TBitBtn;
	timeoutTimer: TTimer;
	showButton: TBitBtn;
	selectWortSql: TQuery;
	resultSql: TQuery;
	updateSql: TQuery;
	incFehler: TQuery;
	WortField: TMemo;
	TestFeld: TMemo;
	ProgressBar: TProgressBar;
	countErrorSQL: TQuery;
	theProgressLabel: TLabel;
	procedure timeoutTimerTimer(Sender: TObject);
	procedure showButtonClick(Sender: TObject);
	procedure OKButtonClick(Sender: TObject);
	procedure BadButtonClick(Sender: TObject);
	procedure FormCreate(Sender: TObject);
  private
	{ Private declarations }
	lektionId 	: Integer;
	timeout   	: Integer;
	selLanguage	: Integer;
	curLanguage : Integer;
	selSprache	: Integer;
	lastWordId 	: Integer;

	procedure displayResult;
	procedure displayQuestion;
  public
	{ Public declarations }
	procedure setLearnData( newLektionId : Integer; newTimeout : Integer; language : Integer; sprachId : Integer );
  end;

var
  LernenDlg: TLernenDlg;

implementation

{$R *.DFM}

procedure TLernenDlg.displayQuestion;
var
	wordCount		: Integer;
	newPosition		: Integer;
	minFehlerCount	: Integer;
	found			: Boolean;
	maxSelects		: Integer;
begin
	OKButton.Enabled := false;
	BadButton.Enabled := false;
	resultList.Items.clear;

	Randomize;
	found := false;
	maxSelects := 20;

	while (not found) and (maxSelects > 0) do
	begin
		maxSelects := maxSelects -1;
		selectWortSql.close;
		selectWortSql.ParamByName('lektionId').asInteger := lektionId;
		selectWortSql.ParamByName('lastWordId').asInteger := lastWordId;

		minFehlerCount := Round( Random( 4 ) ) +1;
		selectWortSql.ParamByName('minFehlerCount').asInteger := minFehlerCount;

		selectWortSql.open;

		if selectWortSql.recordCount > 0 then
			found := true;
	end;

	if( maxSelects = 0 ) then
		MessageDlg( 'Keine Worte mehr', mtError, [mbOk], 0 )
	else
	begin

		selectWortSql.moveBy( Trunc( Random( selectWortSql.recordCount ) ) );
		lastWordId := selectWortSql.FieldByName( 'id' ).AsInteger;

		if (selLanguage = 1) or (selLanguage = 3) then
			curLanguage := selLanguage
		else if Random < 0.5 then
			curLanguage := 1
		else
			curLanguage := 3;

		if curLanguage = 1 then
			WortField.Text := selectWortSql.FieldByName( 'deutsch' ).AsString
		else
			WortField.Text := selectWortSql.FieldByName( 'fremdsprache' ).AsString;

		TestFeld.Lines.clear;
		ActiveControl := TestFeld;
		timeoutTimer.interval := timeout;
		showButton.Enabled := true;
	end;

	countErrorSQL.open;
	newPosition :=
		ProgressBar.Max - countErrorSQL.FieldByName('errorCount').AsInteger;
	wordCount := countErrorSQL.FieldByName('wordCount').AsInteger;
	countErrorSQL.Close;
	if newPosition < 0 then
	begin
		ProgressBar.Max := ProgressBar.Max - newPosition;
		newPosition := 0;
	end;
	ProgressBar.Position := newPosition;

	theProgressLabel.Caption :=
		IntToStr(selectWortSql.FieldByName( 'fehler' ).AsInteger) + '/' +
		IntToStr(wordCount) + '/' +
		IntToStr(newPosition) + '/' +
		IntToStr(ProgressBar.Max);
end;

procedure TLernenDlg.displayResult;
begin
	showButton.Enabled := false;
	timeoutTimer.interval := 0;

	if curLanguage = 1 then
	begin
		resultSql.ParamByName( 'deutsch' ).AsString :=
								selectWortSql.FieldByName( 'deutsch' ).AsString;
		resultSql.ParamByName( 'fremdsprache' ).AsString := 'X';
	end
	else
	begin
		resultSql.ParamByName( 'fremdsprache' ).AsString :=
								selectWortSql.FieldByName( 'fremdsprache' ).AsString;
		resultSql.ParamByName( 'deutsch' ).AsString := 'X';
	end;
	resultSql.ParamByName( 'sprache' ).AsInteger := selSprache;

	resultSql.open;
	while not resultSql.eof do
	begin
		if curLanguage = 1 then
			resultList.items.add( resultSql.FieldByName( 'fremdsprache' ).AsString )
		else
			resultList.items.add( resultSql.FieldByName( 'deutsch' ).AsString );
		resultSql.next;
	end;
	resultSql.close;

	OKButton.Enabled := true;
	BadButton.Enabled := true;
end;

procedure TLernenDlg.setLearnData( newLektionId : Integer;
									newTimeout : Integer;
									language : Integer;
									sprachId : Integer );
begin
	lektionId := newLektionId;
	timeout   := newTimeout;
	if( timeout > 60 ) then
		timeout := 60;
	if( timeout < 10 ) then
		timeout := 10;

	timeout := timeout * 1000;
	selLanguage := language;
	selSprache := sprachId;
	lastWordId := -1;

	countErrorSQL.ParamByName( 'lektionID' ).AsInteger := lektionId;
	countErrorSQL.open;
	ProgressBar.Max := countErrorSQL.FieldByName('errorCount').AsInteger;
	countErrorSQL.Close;

	displayQuestion;
end;

procedure TLernenDlg.timeoutTimerTimer(Sender: TObject);
begin
	timeoutTimer.interval := 0;
	displayResult;
end;

procedure TLernenDlg.showButtonClick(Sender: TObject);
begin
	displayResult;
end;

procedure TLernenDlg.OKButtonClick(Sender: TObject);
begin
	updateSql.ParamByName( 'fehlercount' ).AsSmallInt :=
							selectWortSql.FieldByName( 'fehler' ).AsInteger - 1;

	updateSql.ParamByName( 'wortId' ).AsInteger :=
							selectWortSql.FieldByName( 'id' ).AsInteger;
	updateSql.ParamByName( 'newDate' ).AsDate := Date;

	updateSql.execSql;
	displayQuestion;
end;

procedure TLernenDlg.BadButtonClick(Sender: TObject);
begin
	updateSql.ParamByName( 'fehlercount' ).AsSmallInt :=
							selectWortSql.FieldByName( 'fehler' ).AsInteger +1;

	updateSql.ParamByName( 'wortId' ).AsInteger :=
							selectWortSql.FieldByName( 'id' ).AsInteger;
	updateSql.ParamByName( 'newDate' ).AsDate := Date;

	updateSql.execSql;
	displayQuestion;
end;

procedure TLernenDlg.FormCreate(Sender: TObject);
begin
	incFehler.execSql;
end;

end.
