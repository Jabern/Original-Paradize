/*
    Fichier Index De Personnage By Jaber
    V0.1
*/

stock _perso();

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\PERSONNAGE\persoFunction.pwn"

#if !defined InitPerso
	#error Impossible de Charger le Fichier De Fonction Personnage , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\PERSONNAGE\persoMysql.pwn"

#if !defined LoadPersoActor
	#error Impossible de Charger le Fichier De Mysql Personnage , introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\PERSONNAGE\persoTD.pwn"

#if !defined LoadPersoInfoTD
	#error Impossible de Charger le Fichier De TD Personnage , introuvable
#endif

/**----------------------------------------------------*
