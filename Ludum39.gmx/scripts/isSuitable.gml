// isSuitable(x,y);     returns bool

_x = argument0; 
_y = argument1; 
_size = 32; 

_insts[0] = instance_position(_x + _size,_y,all); 
_insts[1] = instance_position(_x,_y - _size,all); 
_insts[2] = instance_position(_x - _size,_y,all); 
_insts[3] = instance_position(_x,_y + _size,all); 

for (_i = 0; _i < 4; _i++) { 
    if (_insts[_i].object_index == oWall 
    || _insts[_i].object_index == oShadow2 
    || _insts[_i].object_index == oShadow3) { 
        return true;
    }
}

return false;
