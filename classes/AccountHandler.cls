public class AccountHandler {

    public static Account insertNewAccount(String newActName) {
        
        try {
            
            Account act = new Account(Name=newActName);
            
            insert act;
            
            ID actId = act.id;
            
            return act;
            
        } catch(DmlException e) {
            
            System.debug('A DML exception has occurred: ' +
				e.getMessage());
            
            return null;
        }
        
    }
}