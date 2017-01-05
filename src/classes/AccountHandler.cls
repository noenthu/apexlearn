public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        String aName = accountName;
        Account acct = new Account(Name=aName);
        try{
            insert acct;
        } catch(DmlException e) {
            System.debug('DML Exception');
            acct = null;
        }
        return acct;
    }
}