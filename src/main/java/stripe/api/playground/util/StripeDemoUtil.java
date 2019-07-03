package stripe.api.playground.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.exception.StripeException;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.model.PlaygroundResponse;
import stripe.api.playground.model.RequestError;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class StripeDemoUtil {
    private static AccountPropertyCollections accountPropertyCollections;

    private static void init(){
        if (accountPropertyCollections == null){
            accountPropertyCollections = Properties.getAccountPropertyCollections();
        }
    }

    public static AccountPropertyCollections getAccountPropertyCollections(){
        init();
        return accountPropertyCollections;
    }
    /**
     * convert an object to a map
     * @param obj
     * @return
     */
    public static Map<String, Object> convertObjToMap(Object obj){
        ObjectMapper objMapper = new ObjectMapper();
        Map<String, Object> map = objMapper.convertValue(obj, Map.class);
        //map = removeEmptyValue(map);
        map = cleanMap(map);

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

    public static Map<String, Object> cleanMap(Map<String, Object> map){

        Collection<Object> pageValues = map.values();
        while (pageValues.remove(null)) {}
        while (pageValues.remove("")) {}

        Iterator<String> it = map.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next();
            Object value = map.get(key);
            if (value instanceof Map){
                cleanMap((Map<String, Object>) value);
                if (((Map<String, Object>) value).size() == 0){
                    it.remove();
                }
            }
        }

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


    /**
     * Get account propeties from provided account name
     * @param accountName
     * @return
     */
    public static AccountProperties getAccountPropertiesFromName(String accountName){

        init();

        AccountProperties accountProperties = null;
        List<AccountProperties> accountPropertiesList = accountPropertyCollections.getAccountPropertiesList();
        Iterator<AccountProperties> it = accountPropertiesList.iterator();
        while (it.hasNext()){
            AccountProperties ap = it.next();
            if (ap.getAccountName().equalsIgnoreCase(accountName)){
                accountProperties = ap;
                break;
            }
        }
        return accountProperties;
    }

    /**
     * Get Stripe account API secret key using provided account name
     * @param accountName
     * @return
     */
    public static String getAccountSecretKeyFromName(String accountName){

        String secretKey = null;
        AccountProperties accountProperties = getAccountPropertiesFromName(accountName);
        if (accountProperties != null){
            secretKey = accountProperties.getAccountSecretKey();
        }
        return secretKey;
    }

    /**
     * Get String account API publish key using provided account name
     * @param accountName
     * @return
     */
    public static String getAccountPublishKeyFromName(String accountName){
        String publishKey = null;
        AccountProperties accountProperties = getAccountPropertiesFromName(accountName);
        if (accountProperties != null){
            publishKey = accountProperties.getAccountPublishKey();
        }
        return publishKey;
    }

    public static Map<String, Object> getConditions(Boolean isNew) throws ParseException {

        Map<String, Object> conditions = new HashMap<>();

        if (isNew != null && isNew){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateWithoutTime = sdf.parse(sdf.format(new Date()));
            long today = dateWithoutTime.toInstant().toEpochMilli()/1000;
            Map<String, Object> created = new HashMap<>();
            created.put("gte", today);
            conditions.put("created", created);
        }

        conditions.put("limit", 100);

        return conditions;

    }


    public static Map<String, Object> convertJsonToMap(String jsonStr) throws IOException {
        Map<String,Object> map = new ObjectMapper().readValue(jsonStr, HashMap.class);
        return map;
    }

    public static PlaygroundResponse setException(PlaygroundResponse response, Exception e){
        response.setCode(ResponseCode.ERROR);
        if (e instanceof StripeException){
            response.setApiResponse(new RequestError(((StripeException) e).getRequestId(), ((StripeException) e).getCode(), e.getMessage()).toJSON());
        } else {
            response.setApiResponse(new RequestError("", "Request Error", e.getMessage()).toJSON());
        }
        return response;
    }
}
