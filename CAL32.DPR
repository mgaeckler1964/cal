{
		Project:		CAL
		Module:			CAL32.pas
		Description:	Das Hauptprogramm
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
program CAL32;

uses
  Forms,
  About in 'About.pas' {AboutDlg},
  Crt_lekt in 'Crt_lekt.pas' {CreateLektionDlg},
  Language in 'Language.pas' {LangForm},
  Lerncfg in 'Lerncfg.pas' {LernConfigDlg},
  Lernen in 'Lernen.pas' {LernenDlg},
  Main in 'Main.pas' {MainForm},
  W_lekt in 'W_lekt.pas' {WortListForm},
  Worte in 'Worte.pas' {WortForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Computer Aided Learning';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutDlg, AboutDlg);
  Application.CreateForm(TCreateLektionDlg, CreateLektionDlg);
  Application.CreateForm(TLernConfigDlg, LernConfigDlg);
  Application.CreateForm(TLernenDlg, LernenDlg);
  Application.Run;
end.
