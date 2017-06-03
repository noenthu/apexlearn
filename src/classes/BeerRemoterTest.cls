@isTest
private class BeerRemoterTest {
    static testMethod void myTest() {
        Object result = BeerRemoter.findAll('', 0, 30, 1);
        System.assert(result != null);
     }
}