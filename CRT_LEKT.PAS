{
		Project:		CAL
		Module:			Crt_lekt.pas
		Description:	Lektionen erstellen
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
unit Crt_lekt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Buttons, DBTables, DB;

type
  TCreateLektionDlg = class(TForm)
	OkButton: TBitBtn;
    BitBtnCancel: TBitBtn;
	lektionName: TEdit;
	Label1: TLabel;
    SprachCombo: TComboBox;
    Label2: TLabel;
    SprachTabelle: TTable;
    SprachTabelleId: TIntegerField;
    SprachTabelleSprache: TStringField;
	insertLektSql: TQuery;
	procedure EnableDisableOK;
	procedure FormActivate(Sender: TObject);
	procedure SprachComboChange(Sender: TObject);
	procedure OkButtonClick(Sender: TObject);
	procedure lektionNameChange(Sender: TObject);
  end;

var
  CreateLektionDlg : TCreateLektionDlg;
implementation

{$R *.DFM}

procedure TCreateLektionDlg.EnableDisableOK;
begin
	if (SprachCombo.Text > '') and (lektionName.Text > '') then
		OkButton.enabled := true
	else
		OkButton.enabled := false;
end;

procedure TCreateLektionDlg.FormActivate(Sender: TObject);
begin
	SprachTabelle.Open;

	SprachCombo.items.clear;
	SprachTabelle.first;

	while not SprachTabelle.eof do
	begin
		SprachCombo.items.add( SprachTabelle.FieldByName( 'Sprache' ).asString );
		SprachTabelle.next;
	end;
	SprachTabelle.first;
	SprachCombo.Text := SprachTabelle.FieldByName( 'Sprache' ).asString;
end;

procedure TCreateLektionDlg.SprachComboChange(Sender: TObject);
var
	found : Boolean;
begin
	SprachTabelle.first;
	found := false;
	while not found and not SprachTabelle.eof do
	begin
		if SprachCombo.Text = SprachTabelle.FieldByName( 'Sprache' ).asString then
			found := true
		else
			SprachTabelle.next;
	end;
	EnableDisableOK;
end;

procedure TCreateLektionDlg.OkButtonClick(Sender: TObject);
begin
	with insertLektSql do
	begin
		paramByName( 'lektion' ).asString := lektionName.text;
		paramByName( 'sprache' ).asInteger
							:=  SprachTabelle.fieldByName( 'Id' ).asInteger;
		execSql;
	end;
    close;
end;

procedure TCreateLektionDlg.lektionNameChange(Sender: TObject);
begin
	EnableDisableOK;
end;

end.
