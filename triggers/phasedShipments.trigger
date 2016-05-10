trigger phasedShipments on Opportunity (after insert, after update) {

    if (Trigger.isInsert) {
        for (Opportunity opp : Trigger.new) {
            PhasedShipments obj = new PhasedShipments();
            obj.addShipments(opp.ID);
        }
    } else if (Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            Opportunity oldOpp = Trigger.oldMap.get(opp.ID);
        
            if ( opp.Amount != oldOpp.Amount || 
                opp.bottna17__Est_Begin_Ship_Date__c != oldOpp.bottna17__Est_Begin_Ship_Date__c ||
                opp.bottna17__Est_End_Ship_Date__c != oldOpp.bottna17__Est_End_Ship_Date__c) {
                PhasedShipments obj = new PhasedShipments();
                obj.deleteShipments(opp.ID);
                obj.addShipments(opp.ID);
            }
        }
    }
}