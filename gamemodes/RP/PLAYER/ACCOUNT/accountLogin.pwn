/*
    Player Login :
                  Function : Log player
                  Params : N/A
                  By Jaber
*/

stock _login_;

/**----------------------------------------------------**/

#tryinclude "RP/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "easyDialog"

#if !defined Dialog_Opened
	#error Veuillez Télécharger l'include EasyDialog | github.com/Awsomedude/easyDialog
#endif

/**----------------------------------------------------**/

#tryinclude "RP/PLAYER/PERSONNAGE/persoIndex.pwn"

#if !defined _perso
	#error Impossible de Charger le Fichier De Personnage , Index introuvable
#endif

/**----------------------------------------------------**/

forward CheckPass(playerid);

/**----------------------------------------------------**/

Dialog:Connection(playerid, response, listitem, inputtext[])
{
	if(!response) return Kick(playerid);

	static
      	string[129];
	if(strlen(inputtext) < 5 || strlen(inputtext) > 128)
	{
  	return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion", "Erreur: Votre Mot de passe ne respecte pas les parmétres suivant : Minimum 5 caractères , Maximum 128", "Connexion", "Annuler");
	}

	format(PlayerData[playerid][pPassword], 129, inputtext);

	mysql_format(_Connect, string, sizeof(string), "SELECT * FROM `compte` WHERE `Username` = '%s'", PlayerData[playerid][pName]);
	return mysql_tquery(_Connect, string, "CheckPass", "i", playerid);
}

/**----------------------------------------------------**/

stock IntToBoolString(int)
{
	new string[25];
	switch(int)
	{
		case 0:
		{
			format(string, sizeof(string), "False");
		}
		case 1:
		{
			format(string, sizeof(string), "True");
		}		
	}
	return string;
}

public CheckPass(playerid)
{
	static
				string[129], query[129], pass[129];
	cache_get_value_name(0, "Password", pass);

	if(strcmp(pass, PlayerData[playerid][pPassword], true) == 0)
	{
		mysql_format(_Connect, query, sizeof(query), "SELECT * FROM `compte` WHERE `Username` = '%s'", PlayerData[playerid][pName]);
		mysql_tquery(_Connect, query, "InitPerso", "i", playerid);

		format(string, sizeof(string), "Map\tDownload\nVice City\t%s\nLiberty City\t%s", IntToBoolString(PlayerData[playerid][ViceCity]), IntToBoolString(PlayerData[playerid][LibertyCity]));
		Dialog_Show(playerid, City, DIALOG_STYLE_TABLIST_HEADERS, "Map", string, "Spawn", "Annuler");
	}
	else return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion","Erreur :( MDP Incorrect : Veuillez insérer votre Mot De Passe pour vous Connecter :)", "Connexion", "Annuler");

	return 1;
}

/**----------------------------------------------------**/

Dialog:City(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			{
				switch(PlayerData[playerid][ViceCity])
				{
					case 0:
					{
						DownloadMap(MAP_VC);
					}
					case 1:
					{
						InitPerso(playerid);
					}
				}
			}
		}
	}
	return 1;
}