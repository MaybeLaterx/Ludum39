// isBatteryAdjacent(x,y);  returns bool

_x = argument0; 
_y = argument1; 

for (_i = 0; _i < 3; _i++) { 
    for (_j = 0; _j < 3; _j++) { 
        _xx = _x - 32 + (32*_j);
        _yy = _y - 32 + (32*_i);
        battery = instance_position(_xx,_yy,oBattery); 
        if (battery != noone) { 
            return true;
        }
    }
}

return false;
