/// updateBatteryPromixity(range);        void

range = argument0; 

with (oBattery) { 
    range = other.range; 
    for (h = range; h >= 0; h--) { 
        for (i = 0; i < range*2; i++) { 
            for (j = 0; j < range*2; j++) { 
                if (i == 0 || i == range -1 || j == 0 || j == range - 1) { 
                    xx = x - (32*h) + (32*j); 
                    yy = y - (32*h) + (32*i); 
                    tile = instance_position(xx,yy,all); 
                    if (instance_exists(tile) && (tile.object_index == oFloor || tile.object_index == oHuman)) battery = max(tile.battery,range); 
                }    
            }
        }
    }
}
