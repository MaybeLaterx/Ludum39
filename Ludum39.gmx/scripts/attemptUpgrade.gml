// attemptUpgrade();        returns bool    

attempts = 0; 
while (oController.powersLeft > 0 && attempts < 50) { 
    if (instance_exists(oShadow1)) { 
        shadow1 = getRandomInst(oShadow1); 
        oController.powersLeft--;         
        with (shadow1) { 
            sh2 = instance_create(x,y,oShadow2); 
            sh2.canAttack = canAttack; 
            instance_destroy(); 
        }
        return true;
    }
}

return false; 
