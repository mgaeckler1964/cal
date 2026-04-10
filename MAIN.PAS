{
		Project:		CAL
		Module:			Main.pas
		Description:	Das Hauptformular
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
unit Main;

interface

uses WinTypes, WinProcs, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, Worte, W_lekt, LernCfg,
  About, Lernen, Language;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    StatusLine: TPanel;
	File1: TMenuItem;
    Panel2: TPanel;
    Window1: TMenuItem;
    FileExitItem: TMenuItem;
	WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
	HelpAboutItem: TMenuItem;
	WindowMinimizeItem: TMenuItem;
	SpeedPanel: TPanel;
	ExitBtn: TSpeedButton;
	Wrterbearbeiten1: TMenuItem;
    Lektionen1: TMenuItem;
	Lektionenbearbeiten1: TMenuItem;
	Lernen1: TMenuItem;
	N1: TMenuItem;
	Sprachen1: TMenuItem;
	procedure FormCreate(Sender: TObject);
	procedure WindowCascadeItemClick(Sender: TObject);
	procedure UpdateMenuItems(Sender: TObject);
	procedure WindowTileItemClick(Sender: TObject);
	procedure WindowArrangeItemClick(Sender: TObject);
	procedure FileExitItemClick(Sender: TObject);
	procedure WindowMinimizeItemClick(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure Wrterbearbeiten1Click(Sender: TObject);
	procedure Lektionenbearbeiten1Click(Sender: TObject);
	procedure HelpAboutItemClick(Sender: TObject);
	procedure Lernen1Click(Sender: TObject);
	procedure Sprachen1Click(Sender: TObject);
  private
	{ Private declarations }
	procedure ShowHint(Sender: TObject);
  public
	{ Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  Screen.OnActiveFormChange := UpdateMenuItems;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusLine.Caption := Application.Hint;
end;

procedure TMainForm.FileExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.WindowCascadeItemClick(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.WindowTileItemClick(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.WindowArrangeItemClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.WindowMinimizeItemClick(Sender: TObject);
var
  I: Integer;
begin
  { Must be done backwards through the MDIChildren array }
  for I := MDIChildCount - 1 downto 0 do
	MDIChildren[I].WindowState := wsMinimized;
end;

procedure TMainForm.UpdateMenuItems(Sender: TObject);
begin
  WindowCascadeItem.Enabled := MDIChildCount > 0;
  WindowTileItem.Enabled := MDIChildCount > 0;
  WindowArrangeItem.Enabled := MDIChildCount > 0;
  WindowMinimizeItem.Enabled := MDIChildCount > 0;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
end;

procedure TMainForm.Wrterbearbeiten1Click(Sender: TObject);
begin
	Application.CreateForm(TWortForm, WortForm);
end;

procedure TMainForm.Lektionenbearbeiten1Click(Sender: TObject);
begin
	Application.CreateForm(TWortListForm, WortListForm);
end;

procedure TMainForm.HelpAboutItemClick(Sender: TObject);
begin
	AboutDlg.ShowModal;
end;

procedure TMainForm.Lernen1Click(Sender: TObject);
begin
	if LernConfigDlg.ShowModal = mrOK then
	begin
		LernenDlg.setLearnData(	LernConfigDlg.getLektionId,
									StrToInt( LernConfigDlg.timeoutEdit.Text ),
									LernConfigDlg.getLanguage,
									LernConfigDlg.getSprachId );
		LernenDlg.ShowModal;
	end;
end;

procedure TMainForm.Sprachen1Click(Sender: TObject);
begin
	Application.CreateForm( TLangForm, LangForm );
end;

end.
