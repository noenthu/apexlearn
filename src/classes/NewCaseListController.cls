public class NewCaseListController {
    private String caseStatus = 'New';
    public List<Case> getNewCases() {
        
        // Using 2 different options for dynamic SOQL creation
        // Option 1 below will cause a compile time error if variable name changes
        // Option 2 will cause a runtime error which can be worse
        String caseQuery = 'SELECT Id, CaseNumber ' +
            'FROM CASE ' +
            'WHERE Status = \''
            + String.escapeSingleQuotes(caseStatus) + '\'';

        List<Case> results = Database.query(caseQuery);

        /** List<Case> results = Database.query(
                'SELECT Id, CaseNumber ' +
                'FROM CASE ' +
                'WHERE Status = :caseStatus'
                );*/

        return results;
    }
}