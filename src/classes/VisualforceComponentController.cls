public class VisualforceComponentController {

    public String accountName {set; get;}
    private List<Account> accounts;

    public VisualforceComponentController() {
        System.debug('in visualforcecomponentcontroller');
    }
    
    public List<Account> getAccounts() {

        accounts = [select Name from Account where Name = :accountName];
        
        return accounts;
    }
}