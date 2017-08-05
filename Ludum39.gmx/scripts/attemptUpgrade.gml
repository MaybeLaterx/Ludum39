// attemptUpgrade();        returns bool    

attempts = 0; 
while (oController.powersLeft > 0 && attempts < 50) { 
    if (instance_exists(oShadow1)) { 
        shadow1 = getRandomInst(oShadow1); 
        oController.powersLeft--;         
        with (shadow1) { 
            instance_create(x,y,oShadow2); 
            instance_destroy(); 
        }
        return true;
    }
}

return false; 
