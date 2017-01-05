public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        String lName = lastName;
        String pCode = postalCode;

        Contact[] contacts = [SELECT Id, Name FROM Contact WHERE LastName = :lName AND MailingPostalCode = :pCode];
        return contacts;
    }
}