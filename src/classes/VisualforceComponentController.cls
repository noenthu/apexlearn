public class VisualforceComponentController {

    public String accountName {set; get;}
    public Id postingId {set; get;}
    private List<Account> accounts;
    private List<JobPosting__c> jobPostings;
    private Position__c position;
    private User user;

    public VisualforceComponentController() {
        System.debug('in visualforcecomponentcontroller');
    }
    
    public List<Account> getAccounts() {

        accounts = [select Name from Account where Name = :accountName];
        
        return accounts;
    }

    public List<JobPosting__c> getJobpostings() {
        jobPostings = [select Name from JobPosting__c where Id= :postingId];

        return jobPostings;
    }
}