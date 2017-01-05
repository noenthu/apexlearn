public with sharing class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchParam) {
        String searchString = searchParam;
        List<List<sObject>> searchList = [FIND :searchString IN NAME FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName, LastName)];
        return searchList;
    }
}