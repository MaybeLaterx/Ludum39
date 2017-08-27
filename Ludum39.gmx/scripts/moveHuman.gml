/// moveHuman(humanInst,floorInst);     void

_hmn = argument0; 
_flr = argument1; 

with (_hmn) { 
    newHuman = instance_create(other._flr.x,other._flr.y,oHuman);
    with (newHuman) { 
        if (global.ai != "humans" && global.ai != "simulation") selected = true;
        
        if (!isBatteryAdjacent(x,y)) { 
            charge = other.charge;   
        } else if (other.charge < maxCharge) {
            charge = maxCharge;
            if (!global.mutedSfx) audio_play_sound(sndRecharge,0,false); 
        }
    }
    if (!global.mutedSfx) audio_play_sound(sndMove,0,false);
    oController.movesLeft--;
    instance_create(x,y,oFloor); 
    with (other._flr) instance_destroy(); 
    instance_destroy();
}
