#include "../Helpers/GWA2.au3"

$toto = GetLoggedCharNames()
$toto;### Debug MSGBOX ↓↓↓
MsgBox(262144, 'Debug line ~' & @ScriptLineNumber, 'Selection:' & @CRLF & '$toto' & @CRLF & @CRLF & 'Return:' & @CRLF & $toto)
