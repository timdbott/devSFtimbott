public class PhasedShipments {

// 1. delete any existing shipments from PhasedShipments___c table
    
    public boolean deleteShipments(String OppId) {
        Boolean success = false;
        PhasedShipments__c[] ships = [SELECT Id, Opportunity__c
										FROM PhasedShipments__c
                                      	WHERE Opportunity__c = :OppId];
    
        //PhasedShipments__c ship = ships[0];
        //String oppId = ship.Opportunity__c;
    
        if (ships.size() > 0) {
           
            try {
                delete ships;
                success = true;
            } catch(System.DmlException e){
                success = false;
            }
        }
		return success;
    }

// 2. add new shipment records

    public boolean addShipments(String OppId) { 
        boolean success = false;
        // get the ship dates from the opp
        Opportunity[] ships = [SELECT Id, Amount, Est_Begin_Ship_Date__c, Est_End_Ship_Date__c
										FROM Opportunity
                                      	WHERE Id = :OppId];
    
        // calculate the # of months between the two
        if (ships.size() > 0) {
            Date beginShip = ships[0].Est_Begin_Ship_Date__c;
            Date endShip = ships[0].Est_End_Ship_Date__c;
            Integer shipments = beginShip.monthsBetween(endShip) + 1;
            
            // calculate the phased $ amount for each shipment
            Decimal phasedAmount = ships[0].Amount / shipments;
            
            // create new phasedShip records
        
            do {
                system.debug(beginShip.addMonths(shipments - 1));
                
                PhasedShipments__c[] newShipment = new PhasedShipments__c[0];
                try {
                  newShipment.add(new PhasedShipments__c(name = String.valueof(beginShip.addMonths(shipments - 1)),
                  Opportunity__c = ships[0].Id,
                  Ship_Date__c = beginShip.addMonths(shipments - 1),
                  Est_Disc_Sales__c = phasedAmount));
             
                  insert newShipment;
                  success = true;
                } catch (System.DmlException e) {
                    System.debug('ERROR: unable to create shipment: ' + e);
                    success = false;
                }
            
                
                shipments --;
            } while(shipments > 0);
        }
        return success;
    }
}