var i, languageobject;
i=0;

global.languagearraylength=0;

filepointer=file_find_first("languages\*",fa_directory);

while(filepointer!=""){
    //show_message("File Pointer: "+string(filepointer));
    
    if(filepointer=="." || filepointer=".."){
        filepointer=file_find_next();
        continue;
    }
    
    languageobject=instance_create(-128,-128,oLanguage);
    
    languageobject.languageid=filepointer;
    
    if(!file_exists("languages\"+languageobject.languageid+"\language.txt")){
    filepointer=file_find_next();
        continue;
    }
    
    //show_message("Loading "+languageobject.languageid);
//Get info about the language
filepointer=file_text_open_read("languages\"+languageobject.languageid+"\language.txt"); 
while(!file_text_eof(filepointer)){
    line=file_text_read_string(filepointer);
    //See if it is charset= and choose charset if it is
    if(string_pos("charset=",line)!=0){
        line=string_replace(line,"charset=","");
        line=string_upper(line);
        switch(line){
            case "ANSI_CHARSET": languageobject.charset=ANSI_CHARSET break;
            case "DEFAULT_CHARSET": languageobject.charset=DEFAULT_CHARSET break;
            case "EASTEUROPE_CHARSET": languageobject.charset=EASTEUROPE_CHARSET break;
            case "RUSSIAN_CHARSET": languageobject.charset=RUSSIAN_CHARSET break;
            case "SYMBOL_CHARSET": languageobject.charset=SYMBOL_CHARSET break;
            case "SHIFTJIS_CHARSET": languageobject.charset=SHIFTJIS_CHARSET break;
            case "HANGEUL_CHARSET": languageobject.charset=HANGEUL_CHARSET break;
            case "GB2312_CHARSET": languageobject.charset=GB2312_CHARSET break;
            case "CHINESEBIG5_CHARSET": languageobject.charset=CHINESEBIG5_CHARSET break;
            case "JOHAB_CHARSET": languageobject.charset=JOHAB_CHARSET break;
            case "HEBREW_CHARSET": languageobject.charset=HEBREW_CHARSET break;
            case "ARABIC_CHARSET": languageobject.charset=ARABIC_CHARSET break;
            case "GREEK_CHARSET": languageobject.charset=GREEK_CHARSET break;
            case "TURKISH_CHARSET": languageobject.charset=TURKISH_CHARSET break;
            case "VIETNAMESE_CHARSET": languageobject.charset=VIETNAMESE_CHARSET break;
            case "THAI_CHARSET": languageobject.charset=THAI_CHARSET break;
            case "MAC_CHARSET": languageobject.charset=MAC_CHARSET break;
            case "BALTIC_CHARSET": languageobject.charset=BALTIC_CHARSET break;
            case "OEM_CHARSET": languageobject.charset=OEM_CHARSET break;
            default: languageobject.charset=ANSI_CHARSET; break;
        }
    }
    else if(string_pos("useimagefont=",line)!=0){
        line=string_replace(line,"useimagefont=","");
        line=string_lower(line);
        if(line=="false"){
            useimagefont=false;
        }
    }
    else if(string_pos("name=",line)!=0){
        line=string_replace(line,"name=","");
        line=string_upper(line);
        languageobject.name=line;
        //show_message("Language Name "+languageobject.name);
    }
    file_text_readln(filepointer);
}
file_text_close(filepointer); 
   
if(file_exists("languages\"+languageobject.languageid+"\flag.png")){
    //show_message("Found flag image");
        languageobject.sprite_index=sprite_add("languages\"+languageobject.languageid+"\flag.png",1,false,false,16,12); 
}
    global.languagearray[i]=languageobject;
    global.languagearraylength+=1;
    i+=1;
    filepointer=file_find_next();
}

file_find_close();
