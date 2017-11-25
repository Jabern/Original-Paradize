/*
    Player Data :
                  Function : All The player Data
                  Params : N/A
                  By Jaber
*/

enum _adata
{
  pIDSql,
  pIp[16],
  pName[MAX_PLAYER_NAME],
  pPassword[129],

  bool:pStaff,

  pMap,
  pVW,

  bool:pLogged,
  bool:pSpawn,
  bool:pInPerso,

  perso1[MAX_PLAYER_NAME],
  perso2[MAX_PLAYER_NAME],
  perso3[MAX_PLAYER_NAME],
  pSkins1,
  pSkins2,
  pSkins3,

  pActor1,
  pActor2,
  pActor3,

  PlayerText3D:pActorText1,
  PlayerText3D:pActorText2,
  PlayerText3D:pActorText3,

  ViceCity,
  LibertyCity
}
stock
    PlayerData[MAX_PLAYERS][_adata],
    ClonePlayerData[1][_adata];

enum _pData
{
  pIDSql,

  pName[MAX_PLAYER_NAME],
  pSkins,

  pScore,
  pLevel,
  pXp,

  pDeath,
  pKill,

  Float:pX,
  Float:pY,
  Float:pZ,

  pInterior,
  pVw,

  Float:pRot,

  bool:pSpawn
}
stock PersoData[MAX_PLAYERS][_pData];
