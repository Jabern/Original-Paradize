/*
    Mysql Personnage :
                  Function : Return Character from Mysql table
                  Params : N/A
                  By Jaber
*/


/**----------------------------------------------------**/

#tryinclude "RP/MYSQL/sqIndex.pwn"

#if !defined _sql
	#error Impossible de Charger le Fichier Mysql , Index introuvable
#endif

/**----------------------------------------------------**/

#tryinclude "RP\UTILS\utilsIndex.pwn"

#if !defined utilIndex
	#error Impossible de Charger le Fichier Utils , Index introuvable
#endif

/**----------------------------------------------------**/


stock LoadPersoActor(playerid)
{
  new req[150], aName[MAX_PLAYER_NAME];

  GetPlayerName(playerid, aName, 24);

  mysql_format(_Connect,req,sizeof(req),"SELECT * FROM Compte WHERE Username = '%s'", aName);
  mysql_tquery(_Connect,req,"CheckNomPersonnage","i",playerid);


  return 1;
}
forward LoadPersoActorStep2(playerid);
public LoadPersoActorStep2(playerid)
{
  new aFormat[125];
  if(strcmp(PlayerData[playerid][perso1],"vide",true) != 0)
  {
    print("In Perso 1");
    printf("Skins Perso 1 : %d", PersoData[playerid][pSkins]);
    format(aFormat, sizeof(aFormat), "%s{37DB45}\n(Interagir en appuyant sur N)", PlayerData[playerid][perso1]);
    PlayerData[playerid][pActorText1] = CreatePlayer3DTextLabel(playerid,aFormat,COLOR_BLUE, 454.5087890625, -14.1015625, 1000.734375,40.0);
    PlayerData[playerid][pActor1] = CreatePersoActor(PlayerData[playerid][pSkins1], 454.5087890625, -14.1015625, 1000.734375, 90, PlayerData[playerid][perso1], PlayerData[playerid][pVW], "ped", "SEAT_idle");
  }
  if(strcmp(PlayerData[playerid][perso2],"vide",true) != 0)
  {
    print("In Perso 2");
    printf("Skins Perso 2 : %d", PersoData[playerid][pSkins]);
    format(aFormat, sizeof(aFormat), "%s{37DB45}\n(Interagir en appuyant sur N)", PlayerData[playerid][perso2]);
    PlayerData[playerid][pActorText2] = CreatePlayer3DTextLabel(playerid,aFormat,COLOR_BLUE,443.68, -10, 1000.734375,40.0);
    PlayerData[playerid][pActor2] = CreatePersoActor(PlayerData[playerid][pSkins2], 443.68, -10, 1000.734375, 269, PlayerData[playerid][perso2], PlayerData[playerid][pVW], "RAPPING","RAP_B_Loop");
  }
  if(strcmp(PlayerData[playerid][perso3],"vide",true) != 0)
  {
    print("In Perso 3");
    printf("Skins Perso 3 : %d", PersoData[playerid][pSkins]);
    format(aFormat, sizeof(aFormat), "%s{37DB45}\n(Interagir en appuyant sur N)", PlayerData[playerid][perso3]);
    PlayerData[playerid][pActorText3] = CreatePlayer3DTextLabel(playerid,aFormat,COLOR_BLUE,440.4296875, -21.150390625, 1001.1328125,40.0);
    PlayerData[playerid][pActor3] = CreatePersoActor(PlayerData[playerid][pSkins3], 440.4296875, -21.150390625, 1001.1328125, 212.49256896973, PlayerData[playerid][perso3], PlayerData[playerid][pVW], "ped", "SEAT_idle");
  }
  return 1;
}

stock CreatePersoActor(modelid, Float:X, Float:Y, Float:Z, Float:Rotation, Name[], world, animlib[], animname[])
{
  new actor;
  actor = CreateActor(modelid, X, Y, Z, Rotation);
  SetActorVirtualWorld(actor, world);
  ApplyActorAnimation(actor, animlib,  animname,4.0,1,1,1,1,0);
  printf("Actor Created Name %s", Name);
  return actor;
}

forward  CheckNomPersonnage(playerid);

public CheckNomPersonnage(playerid)
{
  new query[256];
  cache_get_value_name(0, "Perso1", PlayerData[playerid][perso1]);
  cache_get_value_name(0, "Perso2", PlayerData[playerid][perso2]);
  cache_get_value_name(0, "Perso3", PlayerData[playerid][perso3]);
  printf("Perso 1 : %s", PlayerData[playerid][perso1]);
  printf("Perso 2 : %s", PlayerData[playerid][perso2]);
  printf("Perso 3 : %s", PlayerData[playerid][perso3]);
  mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso1]);
  new Cache:result = mysql_query(_Connect, query);
  cache_get_value_int(0, "Skins", PlayerData[playerid][pSkins1]);
  cache_delete(result);

  mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso2]);
  result = mysql_query(_Connect, query);
  cache_get_value_int(0, "Skins", PlayerData[playerid][pSkins2]);
  cache_delete(result);

  mysql_format(_Connect,query,sizeof(query),"SELECT * FROM Personnage WHERE Name = '%s'", PlayerData[playerid][perso3]);
  result = mysql_query(_Connect, query);
  cache_get_value_int(0, "Skins", PlayerData[playerid][pSkins3]);
  cache_delete(result);

  LoadPersoActorStep2(playerid);
  return 1;
}

stock DestroyPersoActor(playerid)
{
  DestroyActor(PlayerData[playerid][pActor1]);
  DestroyActor(PlayerData[playerid][pActor2]);
  DestroyActor(PlayerData[playerid][pActor3]);
  DeletePlayer3DTextLabel(playerid ,PlayerData[playerid][pActorText1]);
  DeletePlayer3DTextLabel(playerid ,PlayerData[playerid][pActorText2]);
  DeletePlayer3DTextLabel(playerid ,PlayerData[playerid][pActorText3]);
  return 1;
}

stock isValidPerso(playerid, slot)
{
  if(slot == 1)
  {
    if(strcmp(PlayerData[playerid][perso1],"vide",true) != 0)
    {
      return true;
    }
  }
  else if(slot == 2)
  {
    if(strcmp(PlayerData[playerid][perso2],"vide",true) != 0)
    {
      return true;
    }
  }
  else if(slot == 3)
  {
    if(strcmp(PlayerData[playerid][perso3],"vide",true) != 0)
    {
      return true;
    }
  }
  return false;
}
