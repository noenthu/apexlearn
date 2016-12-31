/**
 *	@author: Vivek Chowdhary
 *	@date: 2016-12-30 04:30:47 PM 
 *	@description:
 *	    Test methods for RestrictContactByNameTrigger
 *	
 *	Version History :   
 *		
 */
@isTest
private class TestRestrictContactByName  {
    /**
     * create data and test if contact can be stored with lastname INVALIDNAME
     */
    static testMethod void testRestrictContactByName () {
        Account acct = new Account(Name='Test Account');
        insert acct;
        Contact cont1 = new Contact(FirstName='TestContact1',
                LastName='TestContact1',
                AccountId=acct.Id);
        insert cont1;

        Contact cont2 = new Contact(FirstName='Test Contact',
                AccountId=acct.Id,
                LastName='INVALIDNAME');

        cont1.LastName = 'INVALIDNAME';

        Test.startTest();
        Database.SaveResult result = Database.update(cont1, false);
        Database.SaveResult result2 = Database.insert(cont2, false);
        Test.stopTest();

        // Verify contact insert should have been stopped
        System.assert(!result2.isSuccess());
        System.assertEquals('The Last Name "'+cont2.LastName+'" is not allowed for DML', result2.getErrors()[0].getMessage());


        // Verify contact insert should have been stopped
        System.assert(!result.isSuccess());
        System.assertEquals('The Last Name "'+cont1.LastName+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }
}