//findNextHuman("x" or "y", xPrev, yPrev);     return int cell ID (x or y) 

_request = "x";
_x = argument1 + 1; // don't want to find the same tile
_y = argument2; 
_grid = oGrid.grid; 
_width = oGrid.width; 
_height = oGrid.height;

for (_i = _y; _i < _height; _i++) { 
    for (_j = _x; _j < _width; _j++) { 
        _key = ds_grid_get(_grid,_j,_i);
        if (_key == "H") {
            //trace("Found next player at (" + string(_j) + "," + string(_i) + ")"); 
            if (_request == "x") {
                trace(_j); 
                return _j; 
            } else { 
                trace(_i);
                return _i;
            }
        }
    }
} 

// If it couldn't be found, loop back from the start again
for (_i = 0; _i < _height; _i++) { 
    for (_j = 0; _j < _width; _j++) { 
        if (_key == "H") {
            if (_request == "x") return _j; 
            else return _i;
        }
    }
} 

// If still no luck, there are no human players left 
trace("No humans found");
return -1; 
