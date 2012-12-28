//
// scrShopkeeperAnger(message)
//
// Make the nearest shopkeeper angry.  RAWR! 
//

shp = instance_nearest(x, y, oShopkeeper);
if (shp)
{
    if (not shp.dead and not shp.angered)
    {
        shp.status = 2;
        if (global.murderer) global.message = global.mShopkeeperangermurderer;//"YOU'LL PAY FOR YOUR CRIMES!";
        else if (argument0 == 0) global.message = global.mShopkeeperanger1//"COME BACK HERE, THIEF!";
        else if (argument0 == 1) global.message = global.mShopkeeperanger2;//"DIE, YOU VANDAL!";
        else if (argument0 == 2) global.message = global.mShopkeeperanger3;//"TERRORIST!";
        else if (argument0 == 3) global.message = global.mShopkeeperanger4;//"HEY, ONLY I CAN DO THAT!";
        else global.message = global.mShopkeeperanger5;//"NOW I'M REALLY STEAMED!";
        global.message2 = "";
        global.messageTimer = 80;
        if (global.thiefLevel > 0) global.thiefLevel += 3;
        else global.thiefLevel += 2;
    }
}
