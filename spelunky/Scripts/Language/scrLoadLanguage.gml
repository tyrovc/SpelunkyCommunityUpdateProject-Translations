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
            case "derekyupresents": global.derekyupresents=splitarray[1]; break;
            case "betterlucknexttime": global.mBetterlucknexttime=splitarray[1]; break;
            case "finalscore": global.mFinalscore=splitarray[1]; break;
            case "forhighscores": global.mForhighscores=splitarray[1]; break;
            case "gameover": global.mGameover=splitarray[1]; break;
            case "minifinished": global.mMinifinished=splitarray[1]; break;
            case "newrecord": global.mNewrecord=splitarray[1]; break;
            case "paused": global.mPaused=splitarray[1]; break;
            case "pausebuttons2": global.mPausebuttons2=splitarray[1]; break;
            case "pausebuttons": global.mPausebuttons=splitarray[1]; break;
            case "pausebuttonsnodeath2": global.mPausebuttonsnodeath2=splitarray[1]; break;
            case "pausebuttonsnodeath": global.mPausebuttonsnodeath=splitarray[1]; break;
            case "toeditlevel": global.mToeditlevel=splitarray[1]; break;
            case "toloadanotherlevel": global.mToloadanotherlevel=splitarray[1]; break;
            case "welcometoshortcut": global.mWelcometoshortcut=splitarray[1]; break;
            case "completedlevel": global.mCompletedlevel=splitarray[1]; break;
            case "depth": global.mDepth=splitarray[1]; break;
            case "depthunit": global.mDepthunit=splitarray[1]; break;
            case "foranewshortcut": global.mForanewshortcut=splitarray[1]; break;
            case "level": global.mLevel=splitarray[1]; break;
            case "levelkills": global.mLevelkills=splitarray[1]; break;
            case "leveloot": global.mLeveloot=splitarray[1]; break;
            case "leveltime": global.mLeveltime=splitarray[1]; break;
            case "levelmoney": global.mLevelmoney=splitarray[1]; break;
            case "none": global.mNone=splitarray[1]; break;
            case "saveddamsel": global.mSaveddamsel=splitarray[1]; break;
            case "shortcutbuilt": global.mShortcutbuilt=splitarray[1]; break;
            case "tunnelmandigsshortcuts": global.mTunnelmandigsshortcuts=splitarray[1]; break;
            case "tunnelmandonate": global.mTunnelmandonate=splitarray[1]; break;
            case "tunnelmanintroduce": global.mTunnelmanintroduce=splitarray[1]; break;
            case "tunnelmanlendme": global.mTunnelmanlendme=splitarray[1]; break;
            case "tunnelmanneed": global.mTunnelmanneed=splitarray[1]; break;
            case "tunnelneverfinish": global.mTunnelneverfinish=splitarray[1]; break;
            case "tunnelthanks": global.mTunnelthanks=splitarray[1]; break;
            case "tutorialcompleted": global.mTutorialcompleted=splitarray[1]; break;
            case "armory": global.mArmory=splitarray[1]; break;
            case "bombshop": global.mBombshop=splitarray[1]; break;
            case "clothingshop": global.mClothingshop=splitarray[1]; break;
            case "dicehouse": global.mDicehouse=splitarray[1]; break;
            case "dicelost": global.mDicelost=splitarray[1]; break;
            case "dicewon": global.mDicewon=splitarray[1]; break;
            case "getoutdeadbeat": global.mGetoutdeadbeat=splitarray[1]; break;
            case "hesweet": global.mHesweet=splitarray[1]; break;
            case "ihavesomethingspecial": global.mIhavesomethingspecial=splitarray[1]; break;
            case "kissingparlor": global.mKissingparlor=splitarray[1]; break;
            case "kisspress": global.mKisspress=splitarray[1]; break;
            case "notenoughmoney": global.mNotenoughmoney=splitarray[1]; break;
            case "nowroll": global.mNowroll=splitarray[1]; break;
            case "onebet": global.mOnebet=splitarray[1]; break;
            case "pleaseroll": global.mPleaseroll=splitarray[1]; break;
            case "pleasuredoingbusiness": global.mPleasuredoingbusiness=splitarray[1]; break;
            case "rolledseven": global.mRolledseven=splitarray[1]; break;
            case "shesweet": global.mShesweet=splitarray[1]; break;
            case "shopkeeperanger1": global.mShopkeeperanger1=splitarray[1]; break;
            case "shopkeeperanger2": global.mShopkeeperanger2=splitarray[1]; break;
            case "shopkeeperanger3": global.mShopkeeperanger3=splitarray[1]; break;
            case "shopkeeperanger4": global.mShopkeeperanger4=splitarray[1]; break;
            case "shopkeeperanger5": global.mShopkeeperanger5=splitarray[1]; break;
            case "shopkeeperangermurderer": global.mShopkeeperangermurderer=splitarray[1]; break;
            case "specialityshop": global.mSpecialityshop=splitarray[1]; break;
            case "supplyshop": global.mSupplyshop=splitarray[1]; break;
            case "tobet": global.mTobet=splitarray[1]; break;
            case "topurchase": global.mTopurchase=splitarray[1]; break;
            case "welcometo": global.mWelcometo=splitarray[1]; break;
            case "wonprize": global.mWonprize=splitarray[1]; break;
            case "youbet": global.mYoubet=splitarray[1]; break;
            case "youneed": global.mYouneed=splitarray[1]; break;
            case "yourolleda": global.mYourolleda=splitarray[1]; break;
            case "ankh2": global.mAnkh2=splitarray[1]; break;
            case "ankh": global.mAnkh=splitarray[1]; break;
            case "ankhbuy": global.mAnkhbuy=splitarray[1]; break;
            case "bombbag": global.mBombbag=splitarray[1]; break;
            case "bombbagbuy": global.mBombbagbuy=splitarray[1]; break;
            case "bombbox": global.mBombbox=splitarray[1]; break;
            case "bombboxbuy": global.mBombboxbuy=splitarray[1]; break;
            case "bow": global.mBow=splitarray[1]; break;
            case "bowbuy": global.mBowbuy=splitarray[1]; break;
            case "cape": global.mCape=splitarray[1]; break;
            case "capebuy": global.mCapebuy=splitarray[1]; break;
            case "compass": global.mCompass=splitarray[1]; break;
            case "compassbuy": global.mCompassbuy=splitarray[1]; break;
            case "gloves": global.mGloves=splitarray[1]; break;
            case "glovesbuy": global.mGlovesbuy=splitarray[1]; break;
            case "glovewebcannon": global.mGlovewebcannon=splitarray[1]; break;
            case "hedjet2": global.mHedjet2=splitarray[1]; break;
            case "hedjet": global.mHedjet=splitarray[1]; break;
            case "jetpack": global.mJetpack=splitarray[1]; break;
            case "jetpackbuy": global.mJetpackbuy=splitarray[1]; break;
            case "jordans2": global.mJordans2=splitarray[1]; break;
            case "jordans": global.mJordans=splitarray[1]; break;
            case "jordansbuy": global.mJordansbuy=splitarray[1]; break;
            case "kapala2": global.mKapala2=splitarray[1]; break;
            case "kapala": global.mKapala=splitarray[1]; break;
            case "machete": global.mMachete=splitarray[1]; break;
            case "machetebuy": global.mMachetebuy=splitarray[1]; break;
            case "mattock2": global.mMattock2=splitarray[1]; break;
            case "mattock": global.mMattock=splitarray[1]; break;
            case "mattockbuy": global.mMattockbuy=splitarray[1]; break;
            case "parachute2": global.mParachute2=splitarray[1]; break;
            case "parachute": global.mParachute=splitarray[1]; break;
            case "parachutebuy": global.mParachutebuy=splitarray[1]; break;
            case "paste": global.mPaste=splitarray[1]; break;
            case "pastebuy": global.mPastebuy=splitarray[1]; break;
            case "pistol": global.mPistol=splitarray[1]; break;
            case "pistolbuy": global.mPistolbuy=splitarray[1]; break;
            case "pitchersmitt": global.mPitchersmitt=splitarray[1]; break;
            case "pitchersmittbuy": global.mPitchersmittbuy=splitarray[1]; break;
            case "ropepile": global.mRopepile=splitarray[1]; break;
            case "ropepilebuy": global.mRopepilebuy=splitarray[1]; break;
            case "shotgun": global.mShotgun=splitarray[1]; break;
            case "shotgunbuy": global.mShotgunbuy=splitarray[1]; break;
            case "spectacles2": global.mSpectacles2=splitarray[1]; break;
            case "spectacles": global.mSpectacles=splitarray[1]; break;
            case "spectaclesbuy": global.mSpectaclesbuy=splitarray[1]; break;
            case "spikeshoes": global.mSpikeshoes=splitarray[1]; break;
            case "spikeshoesbuy": global.mSpikeshoesbuy=splitarray[1]; break;
            case "springshoes2": global.mSpringshoes2=splitarray[1]; break;
            case "springshoes": global.mSpringshoes=splitarray[1]; break;
            case "springshoesbuy": global.mSpringshoesbuy=splitarray[1]; break;
            case "stealdamsel": global.mStealdamsel=splitarray[1]; break;
            case "teleporter": global.mTeleporter=splitarray[1]; break;
            case "teleporterbuy": global.mTeleporterbuy=splitarray[1]; break;
            case "udjateye2": global.mUdjateye2=splitarray[1]; break;
            case "udjateye": global.mUdjateye=splitarray[1]; break;
            case "webcannon": global.mWebcannon=splitarray[1]; break;
            case "webcannonbuy": global.mWebcannonbuy=splitarray[1]; break;
            case "ankhrevives": global.mAnkhrevives=splitarray[1]; break;
            case "ankhshatters": global.mAnkhshatters=splitarray[1]; break;
            case "levelselect": global.mLevelselect=splitarray[1]; break;
            case "outofarrows": global.mOutofarrows=splitarray[1]; break;
            case "press": global.mPress=splitarray[1]; break;
            case "sceptrefits2": global.mSceptrefits2=splitarray[1]; break;
            case "sceptrefits": global.mSceptrefits=splitarray[1]; break;
            case "kaliveryangry": global.mKaliveryangry=splitarray[1]; break;
            case "kaliangry": global.mKaliangry=splitarray[1]; break;
            case "kaliforgive": global.mKaliforgive=splitarray[1]; break;
            case "kaliheals": global.mKaliheals=splitarray[1]; break;
            case "kaliecstatic": global.mKaliecstatic=splitarray[1]; break;
            case "kalifillbombs": global.mKalifillbombs=splitarray[1]; break;
            case "kaliveryhappy": global.mKaliveryhappy=splitarray[1]; break;
            case "kalihappy": global.mKalihappy=splitarray[1]; break;
            case "kalibestows": global.mKalibestows=splitarray[1]; break;
            case "kalipleased": global.mKalipleased=splitarray[1]; break;
            case "kaliacceptssacrifice": global.mKaliacceptssacrifice=splitarray[1]; break;
            case "kalidevourssacrifice": global.mKalidevourssacrifice=splitarray[1]; break;
            case "defilealtar": global.mDefilealtar=splitarray[1]; break;
            case "defilealtar2": global.mDefilealtar2=splitarray[1]; break;
            case "ghost": global.mGhost=splitarray[1]; break;
            case "ghost2": global.mGhost2=splitarray[1]; break;
            case "aliencraft": global.mAliencraft=splitarray[1]; break;
            case "betteruseflares": global.mBetteruseflares=splitarray[1]; break;
            case "blackmarket": global.mBlackmarket=splitarray[1]; break;
            case "cantsee": global.mCantsee=splitarray[1]; break;
            case "cemetary": global.mCemetary=splitarray[1]; break;
            case "cityofgold": global.mCityofgold=splitarray[1]; break;
            case "hedjetshines": global.mHedjetshines=splitarray[1]; break;
            case "lake": global.mLake=splitarray[1]; break;
            case "sacrificepit": global.mSacrificepit=splitarray[1]; break;
            case "snakepit": global.mSnakepit=splitarray[1]; break;
            case "yetilair": global.mYetilair=splitarray[1]; break;
            case "secretchallenges": global.mSecretchallenges=splitarray[1]; break;
            case "sunscore": global.mSunscore=splitarray[1]; break;
            case "moonscore": global.mMoonscore=splitarray[1]; break;
            case "starsscore": global.mStarsscore=splitarray[1]; break;
            case "sunroom": global.mSunroom=splitarray[1]; break;
            case "suninstruction": global.mSuninstruction=splitarray[1]; break;
            case "suninstruction2": global.mSuninstruction2=splitarray[1]; break;
            case "suninstruction3": global.mSuninstruction3=splitarray[1]; break;
            case "suninstruction4": global.mSuninstruction4=splitarray[1]; break;
            case "sunbeginsin": global.mSunbeginsin=splitarray[1]; break;
            case "locked": global.mLocked=splitarray[1]; break;
            case "moonroom": global.mMoonroom=splitarray[1]; break;
            case "mooninstruction": global.mMooninstruction=splitarray[1]; break;
            case "mooninstruction2": global.mMooninstruction2=splitarray[1]; break;
            case "mooninstruction3": global.mMooninstruction3=splitarray[1]; break;
            case "moonbeginsin": global.mMoonbeginsin=splitarray[1]; break;
            case "starsroom": global.mStarsroom=splitarray[1]; break;
            case "starsinstruction": global.mStarsinstruction=splitarray[1]; break;
            case "starsinstruction2": global.mStarsinstruction2=splitarray[1]; break;
            case "starsinstruction3": global.mStarsinstruction3=splitarray[1]; break;
            case "starsbeginsin": global.mStarsbeginsin=splitarray[1]; break;
            case "changingroom": global.mChangingroom=splitarray[1]; break;
            case "ladyinred": global.mLadyinred=splitarray[1]; break;
            case "topdefilers": global.mTopdefilers=splitarray[1]; break;
            case "money": global.mMoney=splitarray[1]; break;
            case "kills": global.mKills=splitarray[1]; break;
            case "saves": global.mSaves=splitarray[1]; break;
            case "time": global.mTime=splitarray[1]; break;
            case "plays": global.mPlays=splitarray[1]; break;
            case "deaths": global.mDeaths=splitarray[1]; break;
            case "wins": global.mWins=splitarray[1]; break;
            case "statistics": global.mStatistics=splitarray[1]; break;
            case "thisclears": global.mThisclears=splitarray[1]; break;
            case "tojump": global.mTojump=splitarray[1]; break;
            case "tousewhip": global.mTousewhip=splitarray[1]; break;
            case "holdupandpress": global.mHoldupandpress=splitarray[1]; break;
            case "tutorial1": global.mTutorial1=splitarray[1]; break;
            case "tutorial2": global.mTutorial2=splitarray[1]; break;
            case "tutorial3": global.mTutorial3=splitarray[1]; break;
            case "tutorial4": global.mTutorial4=splitarray[1]; break;
            case "tutorialenter": global.mTutorialenter=splitarray[1]; break;
            case "holdupandpress": global.mHoldupandpress=splitarray[1]; break;
            case "toopenchests": global.mToopenchests=splitarray[1]; break;
            case "tutorial5": global.mTutorial5=splitarray[1]; break;
            case "tutorial6": global.mTutorial6=splitarray[1]; break;
            case "tutorial7": global.mTutorial7=splitarray[1]; break;
            case "tutorial8": global.mTutorial8=splitarray[1]; break;
            case "duckandpress": global.mDuckandpress=splitarray[1]; break;
            case "topickupitems": global.mTopickupitems=splitarray[1]; break;
            case "tothroworuseitems": global.Tothroworuseitems=splitarray[1]; break;
            case "tutorial9": global.mTutorial9=splitarray[1]; break;
            case "toselectyourropeand": global.mToselectyourropeand=splitarray[1]; break;
            case "touseit": global.mTouseit=splitarray[1]; break;
            case "crouchandpress": global.mCrouchandpress=splitarray[1]; break;
            case "tutorial10": global.mTutorial10=splitarray[1]; break;
            case "torunholddown": global.mTorunholddown=splitarray[1]; break;
            case "or": global.mOr=splitarray[1]; break;
            case "tutorial11": global.mTutorial11=splitarray[1]; break;
            case "toselectbombsand": global.mToselectbombsand=splitarray[1]; break;
            case "tutorial12": global.mTutorial12=splitarray[1]; break;
            case "tutorial13": global.mTutorial13=splitarray[1]; break;
            case "intro": global.mIntro=splitarray[1]; break;
            case "intro2": global.mIntro2=splitarray[1]; break;
            case "intro3": global.mIntro3=splitarray[1]; break;
            case "intro4": global.mIntro4=splitarray[1]; break;
            case "intro5": global.mIntro5=splitarray[1]; break;
            case "intro6": global.mIntro6=splitarray[1]; break;
            case "intro7": global.mIntro7=splitarray[1]; break;
            case "intro8": global.mIntro8=splitarray[1]; break;
            case "intro9": global.mIntro9=splitarray[1]; break;
            case "intro10": global.mIntro10=splitarray[1]; break;
            case "intro11": global.mIntro11=splitarray[1]; break;
            case "intro12": global.mIntro12=splitarray[1]; break;
            case "intro13": global.mIntro13=splitarray[1]; break;
            case "intro14": global.mIntro14=splitarray[1]; break;
            case "intro15": global.mIntro15=splitarray[1]; break;
            case "intro16": global.mIntro16=splitarray[1]; break;
            case "intro17": global.mIntro17=splitarray[1]; break;
            case "intro18": global.mIntro18=splitarray[1]; break;
            case "intro19": global.mIntro19=splitarray[1]; break;
            case "intro20": global.mIntro20=splitarray[1]; break;
            case "intro21": global.mIntro21=splitarray[1]; break;
            case "intro22": global.mIntro22=splitarray[1]; break;
            case "intro23": global.mIntro23=splitarray[1]; break;
            case "intro24": global.mIntro24=splitarray[1]; break;
            case "agameby": global.mAgameby=splitarray[1]; break;
            case "thanksforplaying": global.mThanksforplaying=splitarray[1]; break;
            case "SeeYouNextAdventure": global.mSeeyounextadventure=splitarray[1]; break;
            case "youmadeit": global.mYoumadeit=splitarray[1]; break;
            case "finalscore": global.mFinalscore=splitarray[1]; break;
            case "rememberedas": global.mRememberedas=splitarray[1]; break;
            case "levelselectreturn": global.mLevelselectreturn=splitarray[1]; break;
            case "levelselectload": global.mLevelselectload=splitarray[1]; break;
            case "levelselectlevels": global.mLevelselectlevels=splitarray[1]; break;
            case "levelselectnotexist": global.mLevelselectnotexist=splitarray[1]; break;
            case "editlevel": global.mEditlevel=splitarray[1]; break;
            case "editlabel": global.mEditlabel=splitarray[1]; break;;
            case "editmessage": global.mEditmessage=splitarray[1]; break;
            case "editlevelname": global.mEditlevelname=splitarray[1]; break;
            case "editauthor": global.mEditauthor=splitarray[1]; break;
            case "editmusic": global.mEditmusic=splitarray[1]; break;
            case "editstartlife": global.mEditstartlife=splitarray[1]; break;
            case "editstartbombs": global.mEditstartbombs=splitarray[1]; break;
            case "editstartrope": global.mEditstartrope=splitarray[1]; break;
            case "editnextlevel": global.mEditnextlevel=splitarray[1]; break;
            case "savelevel": global.mSavelevel=splitarray[1]; break;
            case "warningnoentrance": global.mWarningnoentrance=splitarray[1]; break;
            case "warningnoexit": global.mWarningnoexit=splitarray[1]; break;
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
