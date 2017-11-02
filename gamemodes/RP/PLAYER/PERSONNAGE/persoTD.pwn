forward LoadPersoInfoTD(playerid, name[], skin);

new PlayerText:perso_info[7][MAX_PLAYERS];

public LoadPersoInfoTD(playerid, name[], skin)
{
  new tdstring[250], tdstring2[250];


  perso_info[0][playerid] = CreatePlayerTextDraw(playerid, 554.386535, 146.750015, "usebox");
  PlayerTextDrawLetterSize(playerid, perso_info[0][playerid], 0.000000, 8.687120);
  PlayerTextDrawTextSize(playerid, perso_info[0][playerid], 349.859588, 0.000000);
  PlayerTextDrawAlignment(playerid, perso_info[0][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[0][playerid], 0);
  PlayerTextDrawUseBox(playerid, perso_info[0][playerid], true);
  PlayerTextDrawBoxColor(playerid, perso_info[0][playerid], 102);
  PlayerTextDrawSetShadow(playerid, perso_info[0][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[0][playerid], 0);
  PlayerTextDrawFont(playerid, perso_info[0][playerid], 0);

  perso_info[1][playerid] = CreatePlayerTextDraw(playerid, 352.327941, 144.666671, "New perso_info");
  PlayerTextDrawLetterSize(playerid, perso_info[1][playerid], 0.449999, 1.600000);
  PlayerTextDrawTextSize(playerid, perso_info[1][playerid], 75.900428, 81.666664);
  PlayerTextDrawAlignment(playerid, perso_info[1][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[1][playerid], -1);
  PlayerTextDrawUseBox(playerid, perso_info[1][playerid], true);
  PlayerTextDrawBoxColor(playerid, perso_info[1][playerid], 0);
  PlayerTextDrawSetShadow(playerid, perso_info[1][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[1][playerid], 1);
  PlayerTextDrawBackgroundColor(playerid, perso_info[1][playerid], 51);
  PlayerTextDrawFont(playerid, perso_info[1][playerid], 5);
  PlayerTextDrawSetProportional(playerid, perso_info[1][playerid], 1);
  PlayerTextDrawSetPreviewModel(playerid, perso_info[1][playerid], skin);

  perso_info[2][playerid] = CreatePlayerTextDraw(playerid, 431.977172, 148.166687, "Nom:");
  PlayerTextDrawLetterSize(playerid, perso_info[2][playerid], 0.226515, 1.477499);
  PlayerTextDrawTextSize(playerid, perso_info[2][playerid], -158.360153, 10.500002);
  PlayerTextDrawAlignment(playerid, perso_info[2][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[2][playerid], -1);
  PlayerTextDrawUseBox(playerid, perso_info[2][playerid], true);
  PlayerTextDrawBoxColor(playerid, perso_info[2][playerid], 0);
  PlayerTextDrawSetShadow(playerid, perso_info[2][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[2][playerid], 1);
  PlayerTextDrawBackgroundColor(playerid, perso_info[2][playerid], 51);
  PlayerTextDrawFont(playerid, perso_info[2][playerid], 2);
  PlayerTextDrawSetProportional(playerid, perso_info[2][playerid], 1);

  format(tdstring, sizeof(tdstring), "Nom:%s", name);
  PlayerTextDrawSetString(playerid, perso_info[2][playerid], tdstring);

  perso_info[3][playerid] = CreatePlayerTextDraw(playerid, 465.241699, 220.500000, "LD_SPAC:white");
  PlayerTextDrawLetterSize(playerid, perso_info[3][playerid], 0.000000, 0.000000);
  PlayerTextDrawTextSize(playerid, perso_info[3][playerid], 46.852157, -16.916721);
  PlayerTextDrawAlignment(playerid, perso_info[3][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[3][playerid], -1);
  PlayerTextDrawSetShadow(playerid, perso_info[3][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[3][playerid], 0);
  PlayerTextDrawFont(playerid, perso_info[3][playerid], 4);
  PlayerTextDrawSetSelectable(playerid, perso_info[3][playerid], true);

  perso_info[4][playerid] = CreatePlayerTextDraw(playerid, 431.976562, 163.333374, "Skin:");
  PlayerTextDrawLetterSize(playerid, perso_info[4][playerid], 0.316002, 1.325832);
  PlayerTextDrawAlignment(playerid, perso_info[4][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[4][playerid], -1);
  PlayerTextDrawSetShadow(playerid, perso_info[4][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[4][playerid], 1);
  PlayerTextDrawBackgroundColor(playerid, perso_info[4][playerid], 51);
  PlayerTextDrawFont(playerid, perso_info[4][playerid], 2);
  PlayerTextDrawSetProportional(playerid, perso_info[4][playerid], 1);
  format(tdstring2, sizeof(tdstring2), "Skin:%d", skin);
  PlayerTextDrawSetString(playerid, perso_info[4][playerid], tdstring2);

  perso_info[5][playerid] = CreatePlayerTextDraw(playerid, 431.976776, 177.333374, "Heures_de_jeux:");
  PlayerTextDrawLetterSize(playerid, perso_info[5][playerid], 0.191844, 1.541666);
  PlayerTextDrawAlignment(playerid, perso_info[5][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[5][playerid], -1);
  PlayerTextDrawSetShadow(playerid, perso_info[5][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[5][playerid], 1);
  PlayerTextDrawBackgroundColor(playerid, perso_info[5][playerid], 51);
  PlayerTextDrawFont(playerid, perso_info[5][playerid], 2);
  PlayerTextDrawSetProportional(playerid, perso_info[5][playerid], 1);

  perso_info[6][playerid] = CreatePlayerTextDraw(playerid, 468.052764, 202.999969, "Spawn");
  PlayerTextDrawLetterSize(playerid, perso_info[6][playerid], 0.380190, 1.576666);
  PlayerTextDrawAlignment(playerid, perso_info[6][playerid], 1);
  PlayerTextDrawColor(playerid, perso_info[6][playerid], -1);
  PlayerTextDrawSetShadow(playerid, perso_info[6][playerid], 0);
  PlayerTextDrawSetOutline(playerid, perso_info[6][playerid], 1);
  PlayerTextDrawBackgroundColor(playerid, perso_info[6][playerid], 51);
  PlayerTextDrawFont(playerid, perso_info[6][playerid], 1);
  PlayerTextDrawSetProportional(playerid, perso_info[6][playerid], 1);
  PlayerTextDrawSetSelectable(playerid, perso_info[6][playerid], true);
  for(new i = 0; i < 7; i++)
  {
    PlayerTextDrawShow(playerid, perso_info[i][playerid]);
  }
  SelectTextDraw(playerid, 0x0000FFFF);
  return 1;
}

forward UnloadPersoInfoTD(playerid);

public UnloadPersoInfoTD(playerid)
{
  for(new i = 0; i < 7; i++)
  {
    PlayerTextDrawHide(playerid, perso_info[i][playerid]);
    PlayerTextDrawDestroy(playerid, perso_info[i][playerid]);
  }
  CancelSelectTextDraw(playerid);
  return 1;
}

Player::ClickPlayerTD(playerid, PlayerText:playertextid)
{
  if(playertextid == perso_info[6][playerid])
  {
    SpawnPerso(playerid);
    UnloadPersoInfoTD(playerid);
    return 1;
  }
  return 0;
}
