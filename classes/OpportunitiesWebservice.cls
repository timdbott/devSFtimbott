global class OpportunitiesWebservice {
    
    webservice static List<Opportunity> getAllOpps() {
        
		List<Opportunity> opps = [SELECT Id, Name FROM Opportunity];
        
        // to remove dups from a list
        // from https://developer.salesforce.com/forums/?id=906F00000008y3SIAQ
        Set<Opportunity> myset = new Set<Opportunity>();
		List<Opportunity> result = new List<Opportunity>();
		myset.addAll(opps);
		result.addAll(myset);
        
        opps.sort();
        
        return opps;
    }
}