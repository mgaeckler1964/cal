{
		Project:		CAL
		Module:			Lerncfg.pas
		Description:	Anfangen zu lernen
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
unit Lerncfg;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Buttons, DB, DBTables;

type
  TLernConfigDlg = class(TForm)
	okButton: TBitBtn;
	BitBtn2: TBitBtn;
    deutschRadio: TRadioButton;
    mixedRadio: TRadioButton;
    fremdRadio: TRadioButton;
    GroupBoxLanguage: TGroupBox;
	LektionCombo: TComboBox;
	Label1: TLabel;
	Label2: TLabel;
	timeoutEdit: TEdit;
	lektionSql: TQuery;
    SprachCombo: TComboBox;
    sprachSQL: TQuery;
    Label3: TLabel;
	procedure check4Ok;
	procedure LektionComboChange(Sender: TObject);
	procedure timeoutEditChange(Sender: TObject);
	procedure FormShow(Sender: TObject);
    procedure SprachComboChange(Sender: TObject);

	private
	lektionId  : Integer;
	sprachId  : Integer;

	public
	function getLektionId : Integer;
	function getLanguage : Integer;
	function getSprachId : Integer;
  end;

var
  LernConfigDlg : TLernConfigDlg;

implementation

{$R *.DFM}

function TLernConfigDlg.getLanguage : Integer;
begin
	if deutschRadio.Checked then
		getLanguage := 1
	else if mixedRadio.Checked then
		getLanguage := 2
	else
		getLanguage := 3;
end;

function TLernConfigDlg.getLektionId : Integer;
begin
	getLektionId := lektionId;
end;

function TLernConfigDlg.getSprachId : Integer;
begin
	getSprachId := sprachId;
end;

procedure TLernConfigDlg.check4Ok;
begin
	if (LektionCombo.Text > '') and (timeoutEdit.Text > '') then
		okButton.Enabled := true
	else
		okButton.Enabled := false;
end;

procedure TLernConfigDlg.LektionComboChange(Sender: TObject);
begin
	with lektionSql do
	begin
		open;
		lektionId := 0;
		while (lektionId = 0) and (not eof) do
		begin
			if FieldByName( 'lektion' ).asString = LektionCombo.Text then
			begin
				lektionId := FieldByName( 'Id' ).asInteger;
			end
			else
				next;
		end;
		close;
	end;

	check4Ok;
end;

procedure TLernConfigDlg.timeoutEditChange(Sender: TObject);
begin
	check4Ok;
end;

procedure TLernConfigDlg.FormShow(Sender: TObject);
begin
	lektionId := 0;
	sprachId := 0;

	LektionCombo.Enabled := false;

	SprachCombo.Items.Clear;
	with sprachSQL do
	begin
		open;
		while not eof do
		begin
			SprachCombo.Items.add( FieldByName( 'sprache' ).asString );
			next;
		end;
		close;
	end;
end;

procedure TLernConfigDlg.SprachComboChange(Sender: TObject);
begin
	with sprachSql do
	begin
		open;
		sprachId := 0;
		while (sprachId = 0) and (not eof) do
		begin
			if FieldByName( 'sprache' ).asString = SprachCombo.Text then
			begin
				sprachId := FieldByName( 'id' ).asInteger;
			end
			else
				next;
		end;
		close;
	end;

	LektionCombo.Enabled := true;

	LektionCombo.Items.Clear;
	with lektionSql do
	begin
		Params[0].AsInteger := sprachId;
		open;
		while not eof do
		begin
			LektionCombo.Items.add( FieldByName( 'lektion' ).asString );
			next;
		end;
		close;
	end;
end;

end.
