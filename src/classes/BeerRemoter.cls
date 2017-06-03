global with sharing class BeerRemoter {

    global class PagedResult {
    	public integer pageSize;
    	public integer page;
    	public integer total;
    	public List<Beer__c> products;
	}

    @RemoteAction
    global static PagedResult findAll(String searchKey, Decimal minAlcohol, Decimal maxAlcohol, integer page) {
        
        integer pageSize = 12;
        String key = '%' + searchKey + '%';
        integer offset = (page - 1) *  pageSize;
        
        PagedResult r =  new PagedResult();
        r.pageSize = pageSize;
        r.page = page;
        r.total = [SELECT count() FROM Beer__c 
                      WHERE (Name LIKE :key OR Brewery__r.Name LIKE :key OR Tags__c LIKE :key)
                      AND Alcohol__c >= :minAlcohol
                      AND Alcohol__c <= :maxAlcohol];
        r.products = [SELECT Id, Name, Alcohol__c, Tags__c, Brewery__r.Name, Image__c FROM Beer__c 
                      WHERE (Name LIKE :key OR Brewery__r.Name LIKE :key OR Tags__c LIKE :key)
                      AND Alcohol__c >= :minAlcohol
                      AND Alcohol__c <= :maxAlcohol
                      ORDER BY NAME LIMIT :pageSize OFFSET :offset];
        return r;
    }

}