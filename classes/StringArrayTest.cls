public class StringArrayTest {
    
    public static String[] generateStringArray(Integer n) {
        
        string[] ary = new String[] {};
        
        for(Integer i=0;i<n;i++) {
			
            ary.add('Test ' + i);
        }

		return ary;
    }
}