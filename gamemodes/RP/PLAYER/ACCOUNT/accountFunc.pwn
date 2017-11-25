stock IsPlayerLoged(playerid)
 {
   return PlayerData[playerid][pLogged];
 }

 stock IsPlayerSpawned(playerid)
 {
   return PlayerData[playerid][pSpawn];
 }

 forward InitPlayer(playerid);
 public InitPlayer(playerid)
 {
   PlayerData[playerid][pLogged] = true;
   cache_get_value_int(0, "Vice", PlayerData[playerid][ViceCity]);
   cache_get_value_int(0, "Liberty", PlayerData[playerid][LibertyCity]);
   return 1;
 }

 stock InitSpawnPlayer(playerid)
 {
   PlayerData[playerid][pSpawn] = true;
   PlayerData[playerid][pInPerso] = false;   
   CreatePlayerFile(playerid);
   return 1;
 }

 stock UnloadSpawnedPlayer(playerid)
 {
   DestroyPlayerFile(playerid);
   PlayerData[playerid][pLogged] = false;
   return 1;
 }

 stock ResetPlayerVar(playerid)
 {
   PlayerData[playerid][pLogged] = false;
   PlayerData[playerid][pSpawn] = false;
   PlayerData[playerid][pInPerso] = false;
   isDev[playerid] = false;
   panelState[playerid] = false;
   return 1;
 }
