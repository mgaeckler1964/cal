{
		Project:		CAL
		Module:			W_lekt.pas
		Description:	Lektionen bearbeiten
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
unit W_lekt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, DBCtrls, DBLookup, ExtCtrls,
  Grids, DBGrids, Crt_lekt;

type
  TWortListForm = class(TForm)
	WortSource: TDataSource;
	WortTabelle: TTable;
	WortTabelleDeutsch: TStringField;
	WortTabelleFremdsprache: TStringField;
	WortListSource: TDataSource;
	wortListSql: TQuery;
	WortTabelleId: TIntegerField;
	wortListSqlDeutsch: TStringField;
	wortListSqlFremdsprache: TStringField;
	wortListSqlId: TIntegerField;
    WortTabelleSprache: TIntegerField;
    woertBuchGrid: TDBGrid;
    WortListGrid: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LektionCombo: TComboBox;
    ButtonNewLesson: TButton;
    deleteLektion: TButton;
    lektionSql: TQuery;
    deleteAllSql: TQuery;
    deleteLektSql: TQuery;
    Label3: TLabel;
    addButton: TButton;
    deleteButton: TButton;
    insertAllButton: TButton;
	SortDeutsch: TRadioButton;
	SortForeign: TRadioButton;
    renameButton: TButton;
    newLektName: TEdit;
	insertSql: TQuery;
    deleteSQL: TQuery;
    insertAllSql: TQuery;
    updateNewSql: TQuery;
	renameLektSql: TQuery;
    SprachCombo: TComboBox;
    sprachSQL: TQuery;
	procedure LektionComboChange(Sender: TObject);
	procedure addButtonClick(Sender: TObject);
	procedure deleteButtonClick(Sender: TObject);
	procedure addNewButtonClick(Sender: TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure deleteLektionClick(Sender: TObject);
	procedure ButtonNewLessonClick(Sender: TObject);
	procedure SortDeutschClick(Sender: TObject);
	procedure SortForeignClick(Sender: TObject);
	procedure renameButtonClick(Sender: TObject);
	procedure newLektNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SprachComboChange(Sender: TObject);
  private
	{ Private declarations }
	lektionId		: Integer;
	sprachId		: Integer;
	procedure fillLektionCombo;
	procedure calcLektionId;
  public
	{ Public declarations }
  end;

var
  WortListForm	: TWortListForm;

implementation

{$R *.DFM}

procedure TWortListForm.fillLektionCombo;
begin
	LektionCombo.Items.Clear;

	if sprachId > 0 then
	begin
		with lektionSql do
		begin
			Params[0].AsInteger := sprachId;
			open;
			while not eof do
			begin
				LektionCombo.Items.add( FieldByName('lektion').asString );
				next;
			end;
			close;
		end;
		LektionCombo.Enabled := true;
	end
	else
		LektionCombo.Enabled := false;

	calcLektionId;
end;

procedure TWortListForm.calcLektionId;
begin
	lektionId := 0;

	with lektionSql do
	begin
		open;
		while (lektionId = 0) and (not eof) do
		begin
			if FieldByName('lektion').asString = LektionCombo.Text then
			begin
				lektionId := FieldByName('Id').asInteger;
			end
			else
				next;
		end;
		close;
	end;

	newLektName.Text := '';

	if lektionId > 0 then
	begin
		addButton.Enabled := true;
		deleteButton.Enabled := true;
		insertAllButton.Enabled := true;
		deleteLektion.Enabled := true;

		with WortListSql do
		begin
			close;
			Params[0].asInteger := lektionId;
			open;
		end;
	end
	else
	begin
		addButton.Enabled := false;
		deleteButton.Enabled := false;
		insertAllButton.Enabled := false;
		deleteLektion.Enabled := false;
		renameButton.enabled := false;

		WortListSQL.close;
	end;
end;

procedure TWortListForm.LektionComboChange(Sender: TObject);
begin
	calcLektionId;
end;

procedure TWortListForm.addButtonClick(Sender: TObject);
begin
	insertSql.Params[0].asInteger := lektionId;
	insertSql.Params[1].asInteger := WortTabelleId.Value;
	insertSql.execSql;

	WortListSql.close;
	WortListSql.open;
end;

procedure TWortListForm.deleteButtonClick(Sender: TObject);
begin
	deleteSql.Params[0].asInteger := lektionId;
	deleteSql.Params[1].asInteger := wortListSqlId.Value;
	deleteSql.execSql;

	WortListSql.close;
	WortListSql.open;
end;

procedure TWortListForm.addNewButtonClick(Sender: TObject);
begin
	insertAllSql.ParamByName('sprache').asInteger := sprachId;
	insertAllSql.open;
	while not insertAllSql.eof do
	begin
		insertSql.ParamByName('lekId').asInteger := lektionId;
		insertSql.ParamByName('wortId').asInteger := insertAllSql.fields[0].asInteger;
		insertSql.execSql;
		insertAllSql.next;
	end;
	insertAllSql.close;

	updateNewSql.ParamByName('newDate').asDate := date;
	updateNewSql.execSql;

	WortListSql.close;
	WortListSql.open;
end;

procedure TWortListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TWortListForm.deleteLektionClick(Sender: TObject);
begin
	with deleteAllSql do
	begin
		paramByName( 'lektionId' ).asInteger := lektionId;
		execSql;
	end;
	with deleteLektSql do
	begin
		paramByName( 'lektionId' ).asInteger := lektionId;
		execSql;
	end;
	fillLektionCombo;
end;

procedure TWortListForm.ButtonNewLessonClick(Sender: TObject);
begin
	CreateLektionDlg.ShowModal;
	fillLektionCombo;
end;

procedure TWortListForm.SortDeutschClick(Sender: TObject);
begin
	with WortTabelle do
	begin
		close;
		open;
		indexName := 'deutschIdx';
		setRangeStart;
		FieldByName('Sprache').asInteger := sprachId;
		setRangeEnd;
		FieldByName('Sprache').asInteger := sprachId+1;
		ApplyRange;
	end;
end;

procedure TWortListForm.SortForeignClick(Sender: TObject);
begin
	with WortTabelle do
	begin
		close;
		open;
		indexName := 'fremdIdx';
		setRangeStart;
		FieldByName('Sprache').asInteger := sprachId;
		setRangeEnd;
		FieldByName('Sprache').asInteger := sprachId+1;
		ApplyRange;
	end;
end;

procedure TWortListForm.renameButtonClick(Sender: TObject);
begin
	with renameLektSql do
	begin
		ParamByName( 'lektionId' ).asInteger := lektionId;
		ParamByName( 'newName' ).asString := newLektName.Text;

		execSql;
	end;

	fillLektionCombo;
	lektionCombo.Text := newLektName.Text;
end;

procedure TWortListForm.newLektNameChange(Sender: TObject);
begin
	if (lektionId > 0) and (newLektName.Text > '') then
		renameButton.enabled := true
	else
		renameButton.enabled := false;
end;

procedure TWortListForm.FormShow(Sender: TObject);
begin
	lektionId := 0;
	sprachId := 0;

	LektionCombo.Enabled := false;

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

procedure TWortListForm.SprachComboChange(Sender: TObject);
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

	if sprachId > 0 then
		with WortTabelle do
		begin
			close;
			open;
			setRangeStart;
			FieldByName('Sprache').asInteger := sprachId;
			setRangeEnd;
			FieldByName('Sprache').asInteger := sprachId+1;
			ApplyRange;
		end
	else
		WortTabelle.Close;

	fillLektionCombo;
end;

end.
