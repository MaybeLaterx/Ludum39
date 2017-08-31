/// attemptMacroMove(moveDist [2,3,4...]);    returns bool

minDangers = 0; 
moveDist = argument0; 

if (oController.movesLeft < 1) return false; 

bestTile = noone;
bestHuman = noone; 
bestDiff = 0;  
with (oHuman) {
    trace("Fitting macro move specifications (distance: " + string(other.moveDist) + ")");
    ownRating = array_length_1d(threats)*10 - array_length_1d(scopes)*(charge>0) + battery/10; 
    for (i = 0; i < (other.moveDist*2) + 1; i++) { 
        for (j = 0; j < (other.moveDist*2) + 1; j++) { 
            if (j == 0 || j == other.moveDist*2 || i == 0 || i = other.moveDist*2) { // border tile
                xx = x - (32*other.moveDist) + (32*j); 
                yy = y - (32*other.moveDist) + (32*i); 
                flr = instance_position(xx,yy,oFloor);
                if (instance_exists(flr)) { 
                    flrRating = array_length_1d(flr.threats)*10 - array_length_1d(flr.scopes)*(charge>0) + flr.battery/10;
                    newDiff = ownRating - flrRating;
                    if (newDiff > other.bestDiff) {
                        // Make sure it's an accessible tile 
                        hasAdjTile = false; 
                        
                        // get human adjacents
                        borderID = 0;
                        hBorders = 0; 
                        for (k = 0; k < 3; k++) {
                            for (l = 0; l < 3; l++) {
                                xxx = x - 32 + 32*l; 
                                yyy = y - 32 + 32*k; 
                                hFlr = instance_position(xxx,yyy,all); 
                                if (hFlr.object_index == oFloor) { 
                                    hBorders[borderID] = hFlr;  
                                    borderID++;      
                                }
                            }  
                        }
                        
                        // get tile adjacents
                        borderID = 0;
                        tBorders = 0; 
                        for (k = 0; k < 3; k++) {
                            for (l = 0; l < 3; l++) {
                                xxx = flr.x - 32 + 32*l; 
                                yyy = flr.y - 32 + 32*k; 
                                hFlr = instance_position(xxx,yyy,all); 
                                if (hFlr.object_index == oFloor) { 
                                    tBorders[borderID] = hFlr;  
                                    borderID++;      
                                }
                            }  
                        }
                        
                        // compare arrays for match
                        for (k = 0; k < array_length_1d(hBorders); k++) { 
                            for (l = 0; l < array_length_1d(tBorders); l++) { 
                                if (hasAdjTile) continue; 
                                if (hBorders[k] == tBorders[l]) hasAdjTile = true; 
                            }
                        }
                        
                        if (hasAdjTile) {  
                            other.bestTile = flr;  
                            other.bestHuman = id; 
                            other.bestDiff = newDiff; 
                        }
                    }
                }
            } 
        }
    }
}

if (bestTile == noone) return false; 

// get human adjacents
borderID = 0;
hBorders = 0; 
for (k = 0; k < 3; k++) {
    for (l = 0; l < 3; l++) {
        xxx = bestHuman.x - 32 + 32*l; 
        yyy = bestHuman.y - 32 + 32*k; 
        hFlr = instance_position(xxx,yyy,all); 
        if (hFlr.object_index == oFloor) { 
            hBorders[borderID] = hFlr;  
            borderID++;      
        }
    }  
}

// get tile adjacents
borderID = 0;
tBorders = 0; 
for (k = 0; k < 3; k++) {
    for (l = 0; l < 3; l++) {
        xxx = bestTile.x - 32 + 32*l; 
        yyy = bestTile.y - 32 + 32*k; 
        hFlr = instance_position(xxx,yyy,all); 
        if (hFlr.object_index == oFloor) { 
            tBorders[borderID] = hFlr;  
            borderID++;      
        }
    }  
}

// compare arrays
adjs = 0; 
adjID = 0; 
for (k = 0; k < array_length_1d(hBorders); k++) { 
    for (l = 0; l < array_length_1d(tBorders); l++) { 
        if (hBorders[k] == tBorders[l]) {
            adjs[adjID] = hBorders[k];
            adjID++;  
        }
    }
}

// get best adjacent
bestAdj = adjs[0]; 
bestAdjDiff = 0; 
for (i = 0; i < array_length_1d(adjs); i++) { 
    flrRating = array_length_1d(adjs[i].threats)*10 - array_length_1d(adjs[i].scopes)*(bestHuman.charge>0) + adjs[i].battery/10;
    newDiff = bestHuman.ownRating - flrRating;
    if (newDiff > bestAdjDiff) {
        bestAdj = adjs[i]; 
        bestAdjDiff = newDiff; 
    }
}

// Perform move
moveHuman(bestHuman,bestAdj); 

return true; 
