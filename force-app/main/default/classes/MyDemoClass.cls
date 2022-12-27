public class MyDemoClass 
{
    public static Integer num  = 0;
    public static String str='';
    
    public  static Integer getvalue()
    {
        num=num+10;
         system.debug('Static Method');
            return(num);

    }
    public void show()
    {
        system.debug('Instance Method');
    }
    
    

}