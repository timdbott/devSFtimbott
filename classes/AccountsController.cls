public class AccountsController {
	@auraEnabled
    public static List<Account> getAccounts() {
        return [select id, name, industry, type, numberofemployees, tickersymbol, phone, billingstreet, billingcity, billingstate, billingpostalcode from account order by createdDate ASC];
    }
}