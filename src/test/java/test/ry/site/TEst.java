package test.ry.site;

import java.util.ArrayList;
import java.util.List;

public class TEst {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	 
			  List list1 =new ArrayList();
			  list1.add("1111");
			  list1.add("2222");
			  list1.add("3333");
			  
			  List list2 =new ArrayList();
			  list2.add("3333");
			  list2.add("4444");
			  list2.add("5555");
			  
			  
			  list1.retainAll(list2);
				System.out.println("交集:" + list1);
					 
	}

}
