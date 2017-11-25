/*
    Personnage Function :
                  Function : Character Function
                  Params : N/A
                  By Jaber
*/

/**----------------------------------------------------**/

#tryinclude "RP\PLAYER\PERSONNAGE\persoMysql.pwn"

#if !defined LoadPersoActor
	#error Impossible de Charger le Fichier De Mysql Personnage , introuvable
#endif

stock InitPerso(playerid)
{
  TogglePlayerSpectating(playerid, false);
  SpawnPlayer(playerid);
  SetPlayerInterior(playerid, 1);
  SetPlayerPos(playerid, 453.181640625, -18.0888671875, 1001.1328125);
  MapData[perso][vw] += 1;
  PlayerData[playerid][pVW] = MapData[perso][vw];
  LoadPersoActor(playerid);
  SetPlayerVirtualWorld(playerid, MapData[perso][vw]);
  PlayerData[playerid][pInPerso] = true;
  return 1;
}

/**----------------------------------------------------**/

Player::KeyStateChange(playerid, newkeys, oldkeys)
{
  if (PRESSED(KEY_NO))
  {
    if(IsPlayerInRangeOfPoint(playerid, 3,454.5087890625, -14.1015625, 1000.734375))
    {
      if(isValidPerso(playerid, 1))
      {
				static query[125];
				mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso1]);
				mysql_tquery(_Connect,query,"InitPersoData","i",playerid);
      }
      return 1;
    }
    if(IsPlayerInRangeOfPoint(playerid, 3,443.68, -10, 1000.734375))
    {
      if(isValidPerso(playerid, 2))
      {
				static query[125];
				mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso2]);
				mysql_tquery(_Connect,query,"InitPersoData","i",playerid);
      }
      return 1;
    }
    if(IsPlayerInRangeOfPoint(playerid, 3,440.4296875, -21.150390625, 1001.1328125))
    {
      if(isValidPerso(playerid, 3))
      {
				static query[125];
				mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso3]);
				mysql_tquery(_Connect,query,"InitPersoData","i",playerid);
      }
      return 1;
    }
  }
  return 1;
}

/**----------------------------------------------------**/

stock SpawnPerso(playerid)
{
	DestroyPersoActor(playerid);
	InitSpawnPlayer(playerid);
	InitPlayer(playerid);
	SetPlayerInterior(playerid, PersoData[playerid][pInterior]);
	SetPlayerVirtualWorld(playerid, PersoData[playerid][pVw]);
	SetPlayerPos(playerid, PersoData[playerid][pX], PersoData[playerid][pY], PersoData[playerid][pZ]);
	SetPlayerSkin(playerid, PersoData[playerid][pSkins]);
	MapData[perso][vw] -= 1;
	return 1;
}

/**----------------------------------------------------**/

forward InitPersoData(playerid);

public InitPersoData(playerid)
{
	cache_get_value_int(0, "Skins", PersoData[playerid][pSkins]);
	cache_get_value_name(0, "Name", PersoData[playerid][pName]);

	cache_get_value_float(0, "posX", PersoData[playerid][pX]);
	cache_get_value_float(0, "posY", PersoData[playerid][pY]);
	cache_get_value_float(0, "posZ", PersoData[playerid][pZ]);

	cache_get_value_int(0, "interior", PersoData[playerid][pInterior]);
	cache_get_value_int(0, "VW", PersoData[playerid][pVw]);

	UnloadPersoInfoTD(playerid);
	LoadPersoInfoTD(playerid, PersoData[playerid][pName], PersoData[playerid][pSkins]);
	return 1;
}

/**----------------------------------------------------**/
