/// attemptMove(dangers);      returns bool

minDangers = argument0; 

if (oController.movesLeft < 1) return false; 

bestTile = noone; 
bestHuman = noone; 
lowestThreats = 99; 
highestKills = 0;
lowestDist = 99; // battery 
with (oHuman) {
    if ((is_array(threats) && array_length_1d(threats) >= other.minDangers) || !is_array(threats) && other.minDangers == 0) {
        for (i = 0; i < 3; i++) { 
            for (j = 0; j < 3; j++) { 
                xx = x - 32 + (32*j); 
                yy = y - 32 + (32*i); 
                flr = instance_position(xx,yy,all);
                if (flr.object_index = oFloor || flr.id == id) { 
                    flrThreats = array_length_1d(flr.threats); // might throw error ####
                    if (flrThreats < other.lowestThreats) { 
                        other.bestTile = flr; 
                        other.bestHuman = id; 
                        other.lowestThreats = flrThreats;
                    } else if (flrThreats == other.lowestThreats) { 
                        flrScopes = array_length_1d(flr.scopes); // # 
                        if (flr.scopes > other.highestKills) {
                            other.bestTile = flr;  
                            other.bestHuman = id; 
                            other.highestKills = flrScopes; 
                        } else if (flr.scopes == other.highestKills) { 
                            if (flr.battery < other.lowestDist) { 
                            other.bestTile = flr; 
                            other.bestHuman = id; 
                            other.lowestDist = flr.battery;
                            } else if (flr.battery == other.lowestDist) { 
                                winner = choose(0,0,1); 
                                if (winner == 1) { 
                                    other.bestTile = flr;
                                    other.bestHuman = id;
                                } 
                            }
                        }
                    }
                }
            }
        }
    }
} 

if (bestTile == noone || bestTile.id == id) return false; 

// Perform move
bestTile = noone; 
bestHuman = noone; 
moveHuman(bestHuman,bestTile); 

return true; 
