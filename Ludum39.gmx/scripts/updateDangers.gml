// UpdateDangers(object_index);       void

with (argument0) {  
    size = 32;
    insts[0] = instance_position(x + size,y,all); 
    insts[1] = instance_position(x,y - size,all); 
    insts[2] = instance_position(x - size,y,all); 
    insts[3] = instance_position(x,y + size,all);
    
    for (h = 0; h < 4; h++) { // directions
        tile = insts[h];
        if (tile != noone) { 
            type = tile.object_index; 
            if (type == oFloor && type != oHuman) { 
                for (i = 0; i < 3; i++) { // height
                    for (j = 0; j < 3; j++) { // width
                        if (instance_exists(tile)) { 
                            if (!addToArray(tile.threats,id)) tile.threats[0] = id; 
                            
                            /*
                            with (tile) { 
                                if (is_array(threats)) { 
                                    alreadyThreat = false;
                                    for (k = 0; k < array_length_1d; k++) { 
                                        if (threats[k] == other.shadowID) alreadyThreat = true;  
                                    }
                                    if (!alreadyThreat) threats[array_length_1d(threats)-1] = other.shadowID; 
                                }
                                else threats[0] = other.shadowID; 
                            }
                            */    
                        
                            /*
                            xx = tile.x - 32 + (32*j);
                            yy = tile.y - 32 + (32*i);
                            deadHuman = instance_position(xx,yy,oHuman); 
                            if (deadHuman != noone) { 
                                attack = true; 
                                //i = 99; 
                                //j = 99;
                                //h = 99; // Exit loop
                                with (deadHuman) { 
                                    instance_create(x,y,oFloor); 
                                    death = instance_create(x,y,oDeath);
                                    death.sprite_index = sHumanDeath;
                                    instance_destroy();
                                }
                            }
                            */
                        }
                    }
                }    
            }
        }
    }
}

