/**
 *	@author: yourname
 *	@date: 2016-12-29 05:40:06 PM 
 *	@description:
 *	    Test methods for VerifyDate
 *	
 *	Version History :   
 *		
 */
@isTest
private class TestVerifyDate  {
	/**
	 * check if date within 30 days
	 */
    @isTest
	static void dateWithin30 () {
        Date dateToCompare = Date.today();
        Date dateCompareWithin30 = dateToCompare.addDays(29);
        Date dateCompareGreater30 = dateToCompare.addDays(31);
        Date dateCompareLessDate1 = dateToCompare.addDays(-2);
        Integer daysInMonth = Date.daysInMonth(dateToCompare.year(), dateToCompare.month());
        Date lastDay = Date.newInstance(dateToCompare.year(), dateToCompare.month(), daysInMonth);

        // Compare if date 2 less than date 1
        System.assertEquals(VerifyDate.CheckDates(dateToCompare,dateCompareLessDate1), lastDay);
        // Compare if date 2 is within 30 days of day 1
        System.assertEquals(VerifyDate.CheckDates(dateToCompare,dateCompareWithin30), dateCompareWithin30);
        // Compare if date 2 is > 31 days from date1
        System.assertEquals(VerifyDate.CheckDates(dateToCompare,dateCompareGreater30),lastDay);

	}
}