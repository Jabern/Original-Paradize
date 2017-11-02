/*
    Debug Function :
                  Function : Useful ( or uselesse ) function to show some code info
                  By Jaber
*/

#define SUCCES_CODE "0x0"
#define FAIL_CODE "0x1"
#define BAD_CODE "0x2"


stock strrchr(const str[], chr)
{
        new str_len = strlen(str);
        if(str_len <= 0) return 0;
        for(new str_pos = str_len-1; str_pos >= 0; str_pos--) if(str[str_pos] == chr) return str_pos+1;
        return 0;
}

stock Debug(FileName[] ,Callback[], Line, Function[], ErrId[])
{
  return printf("DEBUG : File %s , CallBack %s , Line : %d, Function : %s, Code : %s\n", FileName,Callback, Line, Function, ErrId);
}
