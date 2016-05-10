@isTest
private class PhasedShipmentsTest {

    @isTest static void testDeleteShipments() {
        string OppId = '006o0000006GuaJ';
        PhasedShipments obj = new PhasedShipments();
        
        // create new opp for test
        Opportunity newOpp = new Opportunity(Name = 'testDeleteShips',
                                             AccountId = '001o000000NKMgY',
                                             Amount = 1000,
                                             StageName = 'Prospecting',
                                             CloseDate = System.today(),
                                             bottna17__Est_Begin_Ship_Date__c = System.today().addDays(30),
                                             bottna17__Est_End_Ship_Date__c = System.today().addDays(60)
        );
        
        insert newOpp;
        
        // does it handle deleting ships for new opp?
        boolean success = obj.deleteShipments(newOpp.ID);
        System.assert(true,success);
    }
    
    @isTest static void testDeleteShipments_forNoShipments() {
        string OppId = '006o0000008ybJn';
        PhasedShipments obj = new PhasedShipments();
        boolean success = obj.deleteShipments(OppId);
        System.assert(true,success);
    }
    
    @isTest static void testAddShipments() {
        string OppId = '006o0000006GuaJ';
        PhasedShipments obj = new PhasedShipments();
        boolean success = obj.addShipments(OppId);
        System.assert(true,success);
    }
}