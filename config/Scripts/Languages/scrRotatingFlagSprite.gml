var i, languageid;
i=0;

filepointer=file_find_first("languages\*",fa_directory);

while(filepointer!=""){
    
    if(filepointer=="." || filepointer=".."){
        filepointer=file_find_next();
        continue;
    }
    
    
    languageid=filepointer;
    
    if(!file_exists("languages\"+languageid+"\language.txt")){
    filepointer=file_find_next();
        continue;
    }

    if(file_exists("languages\"+languageid+"\flag.png")){
            sprite_merge(sRotatingFlags,sprite_add("languages\"+languageid+"\flag.png",1,false,false,16,12)); 
    }
  
    filepointer=file_find_next();
}

file_find_close();
