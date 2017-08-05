// attemptSpawn();      returns bool

corners = ds_list_create(); 
singles = ds_list_create();
with (oHuman) { 
    for (i = 0; i < 7; i++) { 
        for (j = 0; j < 7; j++) { 
            xx = x - 32*4 + (32*j);
            yy = y - 32*4 + (32*i);
            flr = instance_position(xx,yy,oFloor); 
            if (flr != noone) {
                if (canGrow(flr.x,flr.y)) ds_list_add(other.corners,flr);
                else if (isSuitable(flr.x,flr.y)) ds_list_add(other.singles,flr);
            }
        }
    }
}

/*
trace("Corners");
for (i = 0; i < ds_list_size(corners); i++) { 
    trace(ds_list_find_value(corners,i));
}

trace("Singles");
for (i = 0; i < ds_list_size(singles); i++) { 
    trace(ds_list_find_value(singles,i));
}
*/

attempts = 0; 
while (oController.powersLeft > 0 && attempts < 50) {
    attempts++; 
    rnd = random(1); 
    if (rnd < 0.8) list = corners;
    else list = singles;
    
    if (!ds_list_empty(list)) {  
        rnd2 = irandom(ds_list_size(list) - 1);
        //trace(rnd2);
        tile = ds_list_find_value(list,rnd2);
        if (instance_exists(tile)) { 
            instance_create(tile.x,tile.y,oShadow1);
            with (tile) instance_destroy();
            oController.powersLeft--;
            audio_play_sound(sndShadow,0,false); 
            ds_list_destroy(corners);
            ds_list_destroy(singles); 
            return true;
        }
    }
}          
    
ds_list_destroy(corners);
ds_list_destroy(singles); 

return false;
