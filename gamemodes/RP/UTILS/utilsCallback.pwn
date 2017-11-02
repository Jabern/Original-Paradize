forward fcreate(filename[]);

public fcreate(filename[])
{
    if (fexist(filename)){return false;}
    new File:fhandle = fopen(filename,io_write);
    fclose(fhandle);
    return true;
}

stock fdeleteline(filename[], line[]){
	if(fexist(filename)){
		new temp[256];
		new File:fhandle = fopen(filename,io_read);
		fread(fhandle,temp,sizeof(temp),false);
		if(strfind(temp,line,true)==-1){return 0;}
		else{
			fclose(fhandle);
			fremove(filename);
			for(new i=0;i<strlen(temp);i++){
				new templine[256];
				strmid(templine,temp,i,i+strlen(line));
				if(equal(templine,line,true)){
					strdel(temp,i,i+strlen(line));
					fcreate(filename);
					fhandle = fopen(filename,io_write);
					fwrite(fhandle,temp);
					fclose(fhandle);
					return 1;
				}
			}
		}
	}
	return 0;
}

stock NameValidator(playerid)
{
    new pname[MAX_PLAYER_NAME],underline=0;
    GetPlayerName(playerid, pname, sizeof(pname));
    if(strfind(pname,"[",true) != (-1)) return 0;
    else if(strfind(pname,"]",true) != (-1)) return 0;
    else if(strfind(pname,"$",true) != (-1)) return 0;
    else if(strfind(pname,"(",true) != (-1)) return 0;
    else if(strfind(pname,")",true) != (-1)) return 0;
    else if(strfind(pname,"=",true) != (-1)) return 0;
    else if(strfind(pname,"@",true) != (-1)) return 0;
    else if(strfind(pname,"1",true) != (-1)) return 0;
    else if(strfind(pname,"2",true) != (-1)) return 0;
    else if(strfind(pname,"3",true) != (-1)) return 0;
    else if(strfind(pname,"4",true) != (-1)) return 0;
    else if(strfind(pname,"5",true) != (-1)) return 0;
    else if(strfind(pname,"6",true) != (-1)) return 0;
    else if(strfind(pname,"7",true) != (-1)) return 0;
    else if(strfind(pname,"8",true) != (-1)) return 0;
    else if(strfind(pname,"9",true) != (-1)) return 0;
    new maxname = strlen(pname);
    for(new i=0; i<maxname; i++)
    {
       if(pname[i] == '_') underline ++;
    }
    if(underline != 1) return 0;
    return 1;
}
