/*
    Player Index :
                  Function : Load All The player scripts
                  Params : N/A
                  By Jaber
*/

stock _player();

/**----------------------------------------------------**/

#tryinclude "RP/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\playerData.pwn"

#if !defined PlayerData
  #error Impossible de Charger le Fichier playerData il est introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\mapData.pwn"

#if !defined MapData
  #error Impossible de Charger le Fichier mapData il est introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\ACCOUNT\accountIndex.pwn"

#if !defined _compte_
  #error Impossible de Charger le Fichier de Compte , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\fps.pwn"

#if !defined EnableFP
  #error Impossible de Charger le Fichier FPS : introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\playerFunc.pwn"

#if !defined RespawnPlayer
  #error Impossible de Charger le Fichier FPS : introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\SYNC\syncIndex.pwn"

#if !defined CreatePlayerFile
	#error Impossible de Charger le Fichier SYNC , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\UTILS\utilsIndex.pwn"

#if !defined utilIndex
	#error Impossible de Charger le Fichier Utils , Index introuvable
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

forward BanCheck(playerid);
forward Connect(playerid);
/**----------------------------------------------------**/

Player::Connect(playerid)
{
	if(NameValidator(playerid))
	{
		GetPlayerName(playerid, PlayerData[playerid][pName], MAX_PLAYER_NAME);
		GetPlayerIp(playerid, PlayerData[playerid][pIp], 16);
	}
	else
	{
		SendClientMessage(playerid, COLOR_RED, "Veuillez choisir un nom RP : Nom_Prenom");
		Kick(playerid);
	}
	return 1;
}

/**----------------------------------------------------**/

Player::Disconnect(playerid, reason)
{
	if(PlayerData[playerid][pInPerso])
	{
		PlayerData[playerid][pInPerso] = false;
		MapData[perso][vw] -= 1;
	}
	if(IsPlayerLoged(playerid))
	{
		if(IsPlayerSpawned(playerid))
		{
			UnloadSpawnedPlayer(playerid);
		}
		ResetPlayerVar(playerid);
	}
	return 1;
}

/**----------------------------------------------------**/

Player::RequestClass(playerid, classid)
{
  if(!IsPlayerLoged(playerid))
  {
      static
            query[150];
      TogglePlayerSpectating(playerid, true);

      mysql_format(_Connect, query, sizeof(query), "SELECT * FROM `Bans` WHERE `IP` = '%s'", PlayerData[playerid][pIp]);
      mysql_tquery(_Connect, query, "BanCheck", "i", playerid);
  }
  return 1;
}

/**----------------------------------------------------**/

Player::Spawn(playerid)
{
	if(IsPlayerSpawned(playerid))
	{
		InitSpawnPlayer(playerid);
	}
	if(PlayerData[playerid][pInPerso])
	{
		PlayerData[playerid][pInPerso] = false;
		MapData[perso][vw] -= 1;
	}
	return 1;
}

Player::Death(playerid, killerid, reason)
{
	RespawnPlayer(playerid);
	return 1;
}
/**----------------------------------------------------**/

public BanCheck(playerid)
{
  static
        row, query[128];
  cache_get_row_count(row);

  if(!row) goto noban;

  new
      Ban_Time;
  cache_get_value_name_int(0, "BanTime", Ban_Time);

  if(Ban_Time == -1)
  {
    return Kick(playerid);
  }

  noban:

  mysql_format(_Connect, query, sizeof(query), "SELECT * FROM `Compte` WHERE `Username` = '%s'", PlayerData[playerid][pName]);
  return mysql_tquery(_Connect, query, "Connect", "i", playerid);
}

/**----------------------------------------------------**/

public Connect(playerid)
{
  static
        row;
  cache_get_row_count(row);

  if(row)
  {
    static
          ID;
    cache_get_value_name_int(0, "ID", ID);
    PlayerData[playerid][pIDSql] = ID;
    return Dialog_Show(playerid, Connection, DIALOG_STYLE_PASSWORD, "Connexion","Veuillez insérer votre Mot De Passe pour vous Connecter :)", "Connexion", "Annuler");
  }
  return Dialog_Show(playerid, SignUp, DIALOG_STYLE_INPUT, "Inscription","Veuillez insérer un Mot De Passe pour vous Inscrire :)", "Inscription", "Annuler");
}
