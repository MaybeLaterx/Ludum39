// isInside(x,y);   returns bool
_x = argument0; 
_y = argument1; 
if (mouse_x > _x - 48 && mouse_y > _y - 48 
 && mouse_x < _x + 48 && mouse_y < _y + 48) return true; 
else return false; 
