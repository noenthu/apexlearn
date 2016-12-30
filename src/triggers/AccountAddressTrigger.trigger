trigger AccountAddressTrigger on Account (before insert, before update) {
    //List<Account> accountList = new List<Account>();
    for(Account a : Trigger.New) {
        System.debug('the new account name is ' + a.Name);
        if (a.Match_Billing_Address__c == true) {
            System.debug('The account did indeed have a true value');
            if (a.BillingPostalCode != null) {
                System.debug('the account did indeed have a billing code');
                a.ShippingPostalCode = a.BillingPostalCode;
            }
        }
    }
}