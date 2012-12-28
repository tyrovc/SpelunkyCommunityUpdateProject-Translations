//argument0: x position of text in view
//argument1: y position of text in view
//argument2: how big the outline is
//argument3: whether to center text, true or false
//argument4: the text shown.
//argument5: optional, true makes text absolute instead of based on view;
var color, n, i, j, xpos, ypos, absolute;
n=0;i=0;j=0;

if(!is_string(argument4))exit;
if(argument4=="")exit;

if(argument5==true){
    absolute=true
}else{
    absolute=false;
}

if(global.imagefont){
    if(argument3==true){
        strLen = string_length(argument4)*8;
        n = 320 - strLen;
        n = ceil(n / 2);
    }
    if(absolute){
        xpos=argument0+n;
        ypos=argument1;
    }else{
        xpos=view_xview[0]+argument0+n;
        ypos=view_yview[0]+argument1;
    }
    draw_text(xpos, ypos, argument4);
}else{
    if(argument3==true){
        strLen = string_length(argument4)*8;
        n = 320 - strLen;
        n = ceil(n / 2);
    }
    if(absolute){
        xpos=argument0+n;
        ypos=argument1;
    }else{
        xpos=view_xview[0]+argument0+n;
        ypos=view_yview[0]+argument1;
    }
    color=draw_get_color();
    draw_set_color(c_black);
    for(i=xpos-argument2;i<=xpos+argument2;i+=1){
        for(j=ypos-argument2;j<=ypos+argument2;j+=1){
            draw_text(i,j,argument4);
        }
    }
    draw_set_color(color);
    draw_text(xpos, ypos,argument4);
}
