public class StringArrayTest {
    public static List<String> generateStringArray(Integer numOfEntries) {
        List<String> listToReturn = new List<String>();
        for(Integer i=0;i<numOfEntries;i++) {
            String s = 'Test ' + i;
            listToReturn.add(s);

        }
        return listToReturn;
    }

}