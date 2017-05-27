package com.ry.site.modules.sys.utils;

import java.util.Comparator;

import com.ry.site.modules.sys.entity.Menus;

public class ComparatorMenusUtil implements Comparator<Menus> {  
    //倒序排列即从大到小，若需要从小到大修改返回值1 和 -1   
    public int compare(Menus o1, Menus o2) {  
        int sort1 = o1.getParent().getSort(); 
        int sort2 = o2.getParent().getSort(); 
        if (sort2 > sort1) {  
            return -1;  
        } else if (sort2 < sort1) {  
            return 1;  
        } else {  
            return 0;  
        }  
    }  
}