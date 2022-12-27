public class StringArrayTest {
    public static List<String> generateStringArray(Integer input)
    {
        List<String> lstr=new List<String>();
        for(Integer i=0;i<input;i++)
        {
            lstr.add('Test '+i);
            System.debug(lstr[i]);
        }
        return lstr;
    }

}