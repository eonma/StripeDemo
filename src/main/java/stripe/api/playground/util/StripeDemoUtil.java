package stripe.api.playground.util;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Collection;
import java.util.Map;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class StripeDemoUtil {

    /**
     * convert an object to a map
     * @param obj
     * @return
     */
    public static Map<String, Object> convertObjToMap(Object obj){
        ObjectMapper objMapper = new ObjectMapper();
        Map<String, Object> map = objMapper.convertValue(obj, Map.class);
        map = removeEmptyValue(map);

        return map;
    }

    /**
     * remove null and empty values from a map
     * @param map
     * @return
     */
    public static Map<String, Object> removeEmptyValue(Map<String, Object> map){
        Collection<Object> pageValues = map.values();
        while (pageValues.remove(null)) {}
        while (pageValues.remove("")) {}

        return map;
    }

    /**
     * check if string is empty
     * @param str
     * @return
     */
    public static Boolean isEmpty (String str){
        Boolean isEmpty = false;

        if (str == null || "".equals(str)){
            isEmpty = true;
        }

        return isEmpty;
    }

    public static Boolean isNotEmpty (String str){
        Boolean isNotEmpty = true;

        if (str == null || "".equals(str)){
            isNotEmpty = false;
        }

        return isNotEmpty;
    }
}
