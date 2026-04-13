{
		Project:		CAL
		Module:			About.pas
		Description:	Aboutbox
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
unit About;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SysUtils;

type
  TAboutDlg = class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutDlg: TAboutDlg;

implementation

{$R *.DFM}

procedure TAboutDlg.FormCreate(Sender: TObject);
var
	infoSize, hnd	: DWORD;
	versionBuf		: Pointer;
	langPtr			: Pointer;
	langPath		: string;
	legalPtr		: Pointer;
	fileInfo		: PVSFixedFileInfo;
	versionSize		: UINT;
	versionString	: string;
	legalPChar		: PChar;
	legalString		: string;
begin
	versionString := '';
	legalString := '';
	InfoSize := GetFileVersionInfoSize(PChar(Application.Exename), hnd);
	if InfoSize > 0 then
	begin
		GetMem(versionBuf, InfoSize);
		try
			if GetFileVersionInfo( PChar(Application.Exename), hnd, infoSize, versionBuf ) then
			begin
				if VerQueryValue(versionBuf, '\', Pointer(fileInfo), versionSize) then
				begin
				VersionString := Format('%d.%d.%d.%d', [
					HiWord(fileInfo.dwFileVersionMS), // Major
					LoWord(fileInfo.dwFileVersionMS), // Minor
					HiWord(fileInfo.dwFileVersionLS), // Release
					LoWord(fileInfo.dwFileVersionLS)  // Build
				]);
				end;

				if VerQueryValue(versionBuf, '\VarFileInfo\Translation', langPtr, versionSize) then
				begin
					langPath := Format('\StringFileInfo\%.4x%.4x\LegalCopyright', [
						Loword(PLongInt(langPtr)^),
						Hiword(PLongInt(langPtr)^)
					]);
					if VerQueryValue(versionBuf, PChar(langPath), Pointer(legalPChar), versionSize) then
					begin
					  legalString := legalPChar;
					end;
				end;
			end;
		finally
			FreeMem(versionBuf);
		end;
	end;
	if Length(versionString) > 0 then
		Version.Caption := versionString;
	if Length(legalString) > 0 then
		Copyright.Caption := legalString;
end;

end.
 
