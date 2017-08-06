// UpdateScopes(target object index);       void 

with (argument0) { 
    for (j = 0; j < 4; j++) { 
        for (i = 1; i < 6; i++) {
            lx = x + lengthdir_x(i*32,j*90);
            ly = y + lengthdir_y(i*32,j*90);
            
            if (position_meeting(lx,ly,oWall) || position_meeting(lx,ly,oShadow3)) break;
            
            hmn = instance_position(lx,ly,oHuman); 
            if (hmn != noone) {
                if (!addToArray(hmn.scopes,id)) hmn.scopes[0] = id; 
                break;
            }
            
            flr = instance_position(lx,ly,oFloor);
            if (flr != noone) if (!addToArray(flr.scopes,id)) flr.scopes[0] = id; 
        }   
    }
}
