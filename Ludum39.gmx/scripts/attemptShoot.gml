/// attemptShoot(inDanger);      returns bool

urgent = argument0; 

if (oController.powersLeft < 1) return false; 


humanID = noone;
bestHits = 0; 
bestDir = 0; 
threatFound = false; 
with (oHuman) { 
    if (charge > 0 && ((is_array(threats) && other.urgent) || (!is_array(threats) && !other.urgent))) {

        for (i = 0; i < 4; i++) { 
            thisHits = 0;  
            directThreat = false; 
            for (j = 1; j < 6; j++) { 
                xx = x + lengthdir_x(j*32,i*90);
                yy = y + lengthdir_y(j*32,i*90);
                if (position_meeting(xx,yy,oShadow3) || position_meeting(xx,yy,oWall) || position_meeting(xx,yy,oHuman)) break; 
                else if (position_meeting(xx,yy,oShadows)) {
                    thisHits++; 
                    // assess if direct threat
                    if (other.urgent) { 
                        thisShadow = instance_position(xx,yy,oShadows);
                        for (k = 0; k < array_length_1d(threats); k++) { 
                            if (thisShadow == threats[k]) directThreat = true; 
                        }
                    }
                }
            }   
            
            if (other.threatFound == directThreat) {      
                if (thisHits >= other.bestHits) { 
                    other.bestHits = thisHits; 
                    other.bestDir = i*90; 
                    other.humanID = id; 
                }
            } else if (!other.threatFound && directThreat) { 
                other.threatFound = true; 
                other.bestHits = thisHits; 
                other.bestDir = i*90; 
                other.humanID = id; 
            }
        }
    }
}

if (bestHits == 0) return false; 

shootBeam(humanID,bestDir); 
return true; 
