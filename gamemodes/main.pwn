/*                                              /
                /--------------/
                / SA- Original Paradize V0.1 /
                / Jaber Dev    /
                /--------------/
/                                             */

/**----------------------------------------------------**\
	__Pawn -> Samp Compiler Macro
	0x302 -> The SAMP's compiler version. (3.2.3664)
	0x30A -> The Zeex's compiler version. (3.10.20160702)
  Credit to Dutheil
\**----------------------------------------------------**/

#if __Pawn != 0x30A
	#error Veuillez Télécharger Zeex's PAWN Compiler : github.com/Zeex/pawn/releases
#endif

/**----------------------------------------------------**/
#if __compat != 1
	#pragma compat 1
#endif

/**----------------------------------------------------**/

#include <a_samp>

/**----------------------------------------------------**/

#tryinclude "RP\INIT.pwn"

#if !defined _init_
  #error L'include BASE qui charge les Scripts est introuvable | ou a été renommer
#endif

/**----------------------------------------------------**/

#tryinclude "a_mysql"

#if !defined mysql_connect_file
	#error Veuillez Télécharger L'include Mysql R40 | github.com/pBlueG/SA-MP-MySQL/releases
#endif

/**----------------------------------------------------**/

#tryinclude "streamer"

#if !defined CreateDynamicObject
	#error Veuillez Télécharger L'include streamer | github.com/samp-incognito/samp-streamer-plugin/releases
#endif

/**----------------------------------------------------**/

#tryinclude "izcmd"

#if !defined CMD
	#error Veuillez Télécharger L'include izcmd | github.com/YashasSamaga/I-ZCMD
#endif

/**----------------------------------------------------**/

#tryinclude "YSI\y_hooks"

#if !defined _INC_y_hooks
	#error Veuillez Télécharger La Lib' YSI | github.com/Misiur/YSI-Includes
#endif

/**----------------------------------------------------**/

#tryinclude "easyDialog"

#if !defined Dialog_Opened
	#error Veuillez Télécharger l'include EasyDialog | github.com/Awsomedude/easyDialog
#endif

/**----------------------------------------------------**/

#include "strlib"

main() printf("Thanks to AMX MOD / Southclaws / Zeex / and fdf of Dutheil.");

GameMode::Init()
{
	static
		_exec;
	_exec = GetTickCount();
	SetGameModeText("OP:SA V0.1");
	printf("Original Paradize V%s LOADED", SERVER_VERSION);
	printf("Gamemode Init Loaded in %d MiliSeconds", GetTickCount() - _exec);

	return 1;
}
