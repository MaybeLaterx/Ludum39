// isBatteryAdjacent(x,y);  returns bool

_x = argument0; 
_y = argument1; 

for (i = 0; i < 3; i++) { 
    for (j = 0; j < 3; j++) { 
        _xx = _x - 32 + (32*j);
        _yy = _y - 32 + (32*i);
        battery = instance_position(_xx,_yy,oBattery); 
        if (battery != noone) { 
            return true;
        }
    }
}

return false;
