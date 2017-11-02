
stock utilIndex();

/**----------------------------------------------------**/

#tryinclude "RP/UTILS/utilsCallback.pwn"

#if !defined fcreate
	#error Impossible de Charger le Fichier Callback Utils , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/UTILS/utilsDebug.pwn"

#if !defined Debug
	#error Impossible de Charger le Fichier Debug Utils , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/UTILS/utilsColor.pwn"

#if !defined COLOR_ACTIVEBORDER
	#error Impossible de Charger le Fichier Color Utils , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/UTILS/utilsDev.pwn"

#if !defined EnableDevMode
	#error Impossible de Charger le Fichier Dev Utils , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "YSI\y_timers"

#if !defined _INC_y_timers
	#error Impossible de Charger y_timers , introuvable
#endif

/**----------------------------------------------------**/
