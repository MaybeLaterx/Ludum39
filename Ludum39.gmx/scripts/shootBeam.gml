/// shootBeam(humanInst,dir);       void

humanInst = argument0;
_dir = argument1; 

with (humanInst) { 
    dir = other._dir;
    switch (dir) { 
        case 0 : 
            xd = 1; 
            yd = 0; 
            break; 
        case 90 : 
            xd = 0; 
            yd = -1; 
            break;
        case 180 : 
            xd = -1; 
            yd = 0;
            break; 
        case 270 : 
            xd = 0; 
            yd = 1;
            break; 
        default : trace("dir error"); 
    }
    
    if (!isBatteryAdjacent(x,y)) charge--;
    selected = false;
    shining = true;
    oController.powersLeft--;
    timer = 35;
    kill = false;
    for (i = 0; i < 5; i++) {
        lx = x + xd*size*(i+1);
        ly = y + yd*size*(i+1);
        if (place_meeting(lx,ly,oWall) || place_meeting(lx,ly,oHuman) || place_meeting(lx,ly,oShadow3)) break;
        
        if (place_meeting(lx,ly,oShadow1) || place_meeting(lx,ly,oShadow2)) { 
            kill = true;
            shadow = instance_position(lx,ly,oShadow1);
            if (shadow == noone) shadow = instance_position(lx,ly,oShadow2);
            if (shadow != noone) { 
                instance_create(lx,ly,oFloor);
                if (shadow.object_index == oShadow1) {
                    death = instance_create(lx,ly,oDeath);
                    death.sprite_index = sShadow1Death;
                }
                //#else instance_create(lx,ly,oShadow2Death);
                with (shadow) instance_destroy();
            }
        }
    }
        
    if (kill && !global.mutedSfx) audio_play_sound(sndShadowDeath,0,false); 
    
    if (!instance_exists(oShadow1) && !instance_exists(oShadow2)) room_goto(rHumans);
    else if (!global.mutedSfx) audio_play_sound(sndFlashlight,0,false);
}
