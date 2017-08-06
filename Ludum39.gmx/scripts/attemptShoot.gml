/// attemptShoot(inDanger);      returns bool

urgent = argument0; 

if (oController.powersLeft < 1) return false; 

humanID = noone;
bestHits = 0; 
bestDir = 0; 
with (oHuman) { 
    if ((is_array(threats) && other.urgent) || (!is_array(threats) && !other.urgent)) {

        for (i = 0; i < 4; i++) { 
            thisHits = 0;  
            for (j = 1; j < 6; j++) { 
                xx = x + lengthdir_x(j*32,i*90);
                yy = y + lengthdir_y(j*32,i*90);
                if (position_meeting(xx,yy,oShadow1) || position_meeting(xx,yy,oShadow2)) thisHits++; 
            }   
            
            if (thisHits >= other.bestHits) { 
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
