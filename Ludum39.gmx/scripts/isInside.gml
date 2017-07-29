// isInside(x,y);   returns bool
_x = argument0; 
_y = argument1; 
if (mouse_x > _x - 16 && mouse_y > _y - 16 
 && mouse_x < _x + 16 && mouse_y < _y + 16) return true; 
else return false; 
