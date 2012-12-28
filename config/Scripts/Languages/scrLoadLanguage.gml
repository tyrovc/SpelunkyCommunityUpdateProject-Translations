//
// scrLoadLanguage(String language identifier)
//
// Loads language from \languages\argument0
//
// Example usage: scrLoadLanguage("en")  loads english language
var languageid, characterset, useimagefont, filepointer, line, splitarray, spritemap, i, tempsprite, spritename, spriteindex;
languageid=argument0;

//Load up scrDefaultLanguage incase translators forgot something
scrDefaultLanguage();
charset=ANSI_CHARSET;
useimagefont=true;
splitarray[0]="";
global.myFontDigits = font_add_sprite(sFontDigits, ord(' '), false, 0);  
global.myFontDigitsSmall = font_add_sprite(sFontDigitsSmall, ord(' '), false, 0);  
  
if(!file_exists("languages\"+languageid+"\language.txt")){
    show_message("Selected language: "+argument0+" is missing language.txt #Reverting to default.");
    exit;
}
if(!file_exists("languages\"+languageid+"\text.txt")){
    show_message("Selected language: "+argument0+" is missing text.txt #Reverting to default.");
    exit;
}
    
//Get info about the language
filepointer=file_text_open_read("languages\"+languageid+"\language.txt"); 
while(!file_text_eof(filepointer)){
    line=file_text_read_string(filepointer);
    //See if it is charset= and choose charset if it is
    if(string_pos("charset=",line)!=0){
        line=string_replace(line,"charset=","");
        line=string_upper(line);
        switch(line){
            case "ANSI_CHARSET": charset=ANSI_CHARSET break;
            case "DEFAULT_CHARSET": charset=DEFAULT_CHARSET break;
            case "EASTEUROPE_CHARSET": charset=EASTEUROPE_CHARSET break;
            case "RUSSIAN_CHARSET": charset=RUSSIAN_CHARSET break;
            case "SYMBOL_CHARSET": charset=SYMBOL_CHARSET break;
            case "SHIFTJIS_CHARSET": charset=SHIFTJIS_CHARSET break;
            case "HANGEUL_CHARSET": charset=HANGEUL_CHARSET break;
            case "GB2312_CHARSET": charset=GB2312_CHARSET break;
            case "CHINESEBIG5_CHARSET": charset=CHINESEBIG5_CHARSET break;
            case "JOHAB_CHARSET": charset=JOHAB_CHARSET break;
            case "HEBREW_CHARSET": charset=HEBREW_CHARSET break;
            case "ARABIC_CHARSET": charset=ARABIC_CHARSET break;
            case "GREEK_CHARSET": charset=GREEK_CHARSET break;
            case "TURKISH_CHARSET": charset=TURKISH_CHARSET break;
            case "VIETNAMESE_CHARSET": charset=VIETNAMESE_CHARSET break;
            case "THAI_CHARSET": charset=THAI_CHARSET break;
            case "MAC_CHARSET": charset=MAC_CHARSET break;
            case "BALTIC_CHARSET": charset=BALTIC_CHARSET break;
            case "OEM_CHARSET": charset=OEM_CHARSET break;
            default: charset=ANSI_CHARSET; break;
        }
    }
    else if(string_pos("useimagefont=",line)!=0){
        line=string_replace(line,"useimagefont=","");
        line=string_lower(line);
        if(line=="false"){
            useimagefont=false;
        }
    }
    file_text_readln(filepointer);
}
file_text_close(filepointer);

//Load translated text
filepointer=file_text_open_read("languages\"+languageid+"\text.txt"); 
while(!file_text_eof(filepointer)){
    line=file_text_read_string(filepointer);
    if(scrExplodeString("splitarray","=",line)==2){
        splitarray[0]=variable_local_array_get("splitarray",0);
        splitarray[1]=variable_local_array_get("splitarray",1);
        splitarray[0]=string_lower(string(splitarray[0]));
        switch(splitarray[0]){
            //case "derekyupresents": global.derekyupresents=splitarray[1]; break;
        }
    }
    file_text_readln(filepointer);
}
file_text_close(filepointer);

//Setup font
message_text_charset(text_type,charset);
message_text_charset(button_type,charset);
message_text_charset(input_type,charset);
if(useimagefont){
    global.imagefont = true;
    if(file_exists("languages\"+languageid+"\font.gmspr")){
        sprite_replace_sprite(sFont,"languages\"+languageid+"\font.gmspr");
    }
    if(file_exists("languages\"+languageid+"\fontsmall.gmspr")){
        sprite_replace_sprite(sFontSmall,"languages\"+languageid+"\fontsmall.gmspr");
    }
    global.myFont = font_add_sprite(sFont, ord(' '), false, 0);
    global.myFontSmall = font_add_sprite(sFontSmall, ord(' '), false, 0);
}else{
    global.imagefont = false;
    switch(charset){
        case ANSI_CHARSET: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
        case DEFAULT_CHARSET: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
        case EASTEUROPE_CHARSET: global.myFont = fontEastEurope; global.myFontSmall = fontEastEuropeSmall; break;
        case RUSSIAN_CHARSET: global.myFont = fontRussian; global.myFontSmall = fontRussianSmall; break;
        case SYMBOL_CHARSET: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
        case SHIFTJIS_CHARSET: global.myFont = fontJapanese; global.myFontSmall = fontJapaneseSmall; break;
        case HANGEUL_CHARSET: global.myFont = fontKoreanH; global.myFontSmall = fontKoreanHSmall; break;
        case GB2312_CHARSET: global.myFont = fontChineseSimplified; global.myFontSmall = fontChineseSimplifiedSmall; break;
        case CHINESEBIG5_CHARSET: global.myFont = fontChineseTraditional; global.myFontSmall = fontChineseTraditionalSmall; break;
        case JOHAB_CHARSET: global.myFont = fontKoreanJ; global.myFontSmall = fontKoreanJSmall; break;
        case HEBREW_CHARSET: global.myFont = fontHebrew; global.myFontSmall = fontHebrewSmall; break;
        case ARABIC_CHARSET: global.myFont = fontArabic; global.myFontSmall = fontArabicSmall; break;
        case GREEK_CHARSET: global.myFont = fontGreek; global.myFontSmall = fontGreekSmall; break;
        case TURKISH_CHARSET: global.myFont = fontTurkish; global.myFontSmall = fontTurkishSmall; break;
        case VIETNAMESE_CHARSET: global.myFont = fontVietnamese; global.myFontSmall = fontVietnameseSmall; break;
        case THAI_CHARSET: global.myFont = fontThai; global.myFontSmall = fontThaiSmall; break;
        case MAC_CHARSET: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
        case BALTIC_CHARSET:  global.myFont = fontBaltic; global.myFontSmall = fontBalticSmall; break;
        case OEM_CHARSET: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
        default: global.myFont = fontAnsi; global.myFontSmall = fontAnsiSmall; break;
    }
}

//Load Sprites
//First, need to map sprite_index ids to sprite names so that we can replace them based on filename
    tempsprite = sprite_create_from_screen(0,0,1,1,false,false,0,0);//Make a new sprite and use it to get the highest sprite_index value
    sprite_delete(tempsprite);
    spritemap=ds_map_create();
    for (i=0; i<tempsprite; i+=1) {
        if (sprite_exists(i)) {
            ds_map_add(spritemap,sprite_get_name(i),i);
        }
    }

file_find_first("languages\"+languageid+"\sprites\*",false);

filepointer=file_find_next();
while(filepointer!=""){
    spritename=filename_change_ext(filepointer,"");
    spriteindex=ds_map_find_value(spritemap,spritename);
    if(sprite_exists(spriteindex)){
        sprite_replace(spriteindex,"languages\"+languageid+"\sprites\"+filepointer,sprite_get_number(spriteindex),false,false,sprite_get_xoffset(spriteindex),sprite_get_yoffset(spriteindex));
    }
    filepointer=file_find_next();
}
file_find_close();
ds_map_destroy(spritemap);
