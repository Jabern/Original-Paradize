/*
	Script INIT :
							Function : Load All TMD fodlers Script By Indexing file
							Params : N/A
							By Jaber
*/

stock _init_();

/**----------------------------------------------------**/

#tryinclude "RP/CONFIG/confIndex.pwn"

#if !defined _conf
	#error Impossible de Charger le Fichier de configuration , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/PLAYER/playerIndex.pwn"

#if !defined _player
	#error Impossible de Charger le Fichier Player , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/IA/iaIndex.pwn"

#if !defined _ia
	#error Impossible de Charger le Fichier IA , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP/UTILS/utilsIndex.pwn"

#if !defined utilIndex
	#error Impossible de Charger le Fichier UTILS , Index introuvable
#endif
