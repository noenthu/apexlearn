/**
 *	@author: yourname
 *	@date: 2016-12-30 10:50:59 AM 
 *	@description:
 *	    Test methods for AccountDeletion
 *	
 *	Version History :   
 *		
 */
@isTest
private class TestAccountDeletion  {
    /**
     * Setup Data and Test deletion of account with opty under it
     */
    static testMethod void testAccountDeletion () {
        Account acct = new Account(Name='Test Account');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                StageName='Prospecting',
                CloseDate=System.today().addMonths(1),
                AccountId=acct.Id);
        insert opp;

        // Perform Test
        Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();

        // Verify
        // In this case the deletion should have been stopped by the trigger
        // so verify that we got back an error
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities', result.getErrors()[0].getMessage());
    }
}