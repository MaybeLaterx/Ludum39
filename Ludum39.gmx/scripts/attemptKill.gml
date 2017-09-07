// attemptKill();       returns bool
with (oShadows) {  
    rnd = random(1); // fail chance
    if (rnd < 0.95 && oController.powersLeft > 0 && canAttack) {
        size = 32;
        insts[0] = instance_position(x + size,y,all); 
        insts[1] = instance_position(x,y - size,all); 
        insts[2] = instance_position(x - size,y,all); 
        insts[3] = instance_position(x,y + size,all);
        
        for (h = 0; h < 4; h++) { // directions
            tile = insts[h];
            attack = false; 
            if (tile != noone) { 
                type = tile.object_index; 
                if (type != oWall && type != oShadow3) { 
                    for (i = 0; i < 3; i++) { // height
                        for (j = 0; j < 3; j++) { // width
                            if (instance_exists(tile)) { 
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
                            }
                        }
                    }    
                }
            }
            
            if (attack) { 
                if (!global.mutedSfx) audio_play_sound(sndHumanDeath,0,false); 
                oController.powersLeft--; 
                instance_create(x,y,oFloor); 
                death = instance_create(x,y,oDeath);
                if (sprite_index == sShadow1) death.sprite_index = sShadow1Death;
                else death.sprite_index = sShadow2Death;
                instance_destroy();
                return true;
            }
        }
    }
}

return false; 
