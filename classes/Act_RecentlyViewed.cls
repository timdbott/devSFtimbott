public class Act_RecentlyViewed {

    private String type = 'ListView ';
    
    public List<Account> getRecentlyViewed() {
        
        List<Account> results = Database.query(
            'SELECT Id, Name, LastViewedDate, Type ' +
            'FROM Account ' +
            //'WHERE Type !=' + type + 
            'WHERE LastViewedDate !=null ' +
            'ORDER BY LastViewedDate DESC ' +
            'LIMIT 10'
        );
        return results;
    }
}