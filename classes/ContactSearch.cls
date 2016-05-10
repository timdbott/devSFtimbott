public class ContactSearch {

    public static Contact[] searchForContacts(String lastName, String zipCode){
        
        Contact[] cts = [SELECT Id, FirstName, LastName FROM Contact WHERE (LastName=:lastName AND MailingPostalCode=:zipCode)];
        
        return cts;
    }
}