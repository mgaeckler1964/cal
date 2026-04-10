{
		Project:		CAL
		Module:			Worte.pas
		Description:	Wörterbuch bearbeiten
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
unit Worte;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, Grids, ExtCtrls,
  TabNotBk, Dialogs;

type
  TWortForm = class(TForm)
	DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
	Panel2: TPanel;
    WortTabelle: TTable;
    WortTabelleDeutsch: TStringField;
    WortTabelleFremdsprache: TStringField;
    RadioButtonDeutsch: TRadioButton;
    RadioButtonFremdsprache: TRadioButton;
    WortSource: TDataSource;
	WortTabelleFehler: TSmallintField;
	WortTabelleFrageDatum: TDateField;
	SprachCombo: TComboBox;
	SprachTabelle: TTable;
    _SprachSource: TDataSource;
    SprachTabelleId: TIntegerField;
    SprachTabelleSprache: TStringField;
	WortTabelleSprache: TIntegerField;
	Label1: TLabel;
	procedure RadioButtonDeutschClick(Sender: TObject);
	procedure RadioButtonFremdspracheClick(Sender: TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure SprachComboChange(Sender: TObject);
	procedure FormShow(Sender: TObject);
  private
	{ private declarations }
	procedure selectLanguage;
  public
	{ public declarations }
  end;

var
  WortForm: TWortForm;

implementation

{$R *.DFM}

procedure TWortForm.selectLanguage;
var
	wordFound : Boolean;
begin
	with SprachTabelle do
	begin
		first;
		wordFound := false;
		while not wordFound and not eof do
		begin
			if SprachCombo.Text = FieldByName( 'Sprache' ).asString then
			begin
				wordFound := true;
				WortTabelle.Open;
			end
			else
				next;
		end;
	end;
end;

procedure TWortForm.RadioButtonDeutschClick(Sender: TObject);
begin
	WortTabelle.indexName := 'deutschIdx';
	selectLanguage;
end;

procedure TWortForm.RadioButtonFremdspracheClick(Sender: TObject);
begin
	WortTabelle.indexName := 'fremdIdx';
	selectLanguage;
end;

procedure TWortForm.FormClose(Sender: TObject; var Action: TCloseAction );
begin
	Action := caFree;
end;

procedure TWortForm.SprachComboChange(Sender: TObject);
begin
	selectLanguage;
end;

procedure TWortForm.FormShow(Sender: TObject);
begin
	SprachTabelle.Open;

	with SprachTabelle do
	begin
		SprachCombo.items.clear;
		first;

		while not eof do
		begin
			SprachCombo.items.add( FieldByName( 'Sprache' ).asString );
			next;
		end;
		first;
		SprachCombo.Text := FieldByName( 'Sprache' ).asString;
	end;
end;

end.
