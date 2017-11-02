stock bool:isfp[MAX_PLAYERS] = false;
stock FPOBJ[MAX_PLAYERS];

stock EnableFP(playerid)
{
  isfp[playerid] = 0;
  switch(isfp[playerid])
  {
    case true:
    {
      SetCameraBehindPlayer(playerid);
      DestroyObject(FPOBJ[playerid]);
      isfp[playerid] = false;
    }
    case false:
    {
      FPOBJ[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
      AttachObjectToPlayer(FPOBJ[playerid],playerid, 0.0, 0.12, 0.7, 0.0, 0.0, 0.0);
      AttachCameraToObject(playerid, FPOBJ[playerid]);
      isfp[playerid] = true;
    }
  }
  return 1;
}
