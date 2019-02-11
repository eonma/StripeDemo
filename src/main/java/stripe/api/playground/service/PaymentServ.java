package stripe.api.playground.service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import stripe.api.playground.model.PaymentIntentReq;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.StripeDemoUtil;

import java.util.*;

/**
 * User: chenma
 * Date: 2019-01-08
 */

public class PaymentServ {

    private static final String CLASSNAME = PaymentServ.class.getName();

    /**
     * Create a PaymentIntent
     * @param piReq
     * @return
     * @throws StripeException
     */
    public PaymentIntent createPaymentIntent(PaymentIntentReq piReq) throws StripeException {

        //TODO: dynamic secret key.
        Stripe.apiKey = Constants.GB_PAYMENT_SK;
        Map<String, Object> requestParams = createPIRequestParams(piReq);
        System.out.println("request parameters: " + requestParams);
        PaymentIntent pi = PaymentIntent.create(requestParams);

        return pi;
    }

    private Map<String, Object> createPIRequestParams(PaymentIntentReq piReq) {
        Map<String, Object> pageParams = StripeDemoUtil.convertObjToMap(piReq);

        Map<String, Object> params = new HashMap<>();

        for (Map.Entry<String, Object> entry : pageParams.entrySet()) {

            // convert allowed_source_types to List
            if ("allowed_source_types".equals(entry.getKey())){
                String value = (String) entry.getValue();
                List<String> valueList = new ArrayList<>();
                valueList.add(value);
                params.put("allowed_source_types", valueList);
            }
            // convert metadata List to Map
            else if ("metadata".equals(entry.getKey())){
                Map<String, String> metadataMap = null;

                ArrayList<String> metadataList = (ArrayList<String>) entry.getValue();
                Iterator<String> iterator = metadataList.iterator();
                while (iterator.hasNext()) {
                    String metadataStr = iterator.next();
                    if (!metadataStr.equals("")){
                        String[] pair = metadataStr.split("=");
                        if (metadataMap == null) {
                            metadataMap = new HashMap<>();
                            metadataMap.put(pair[0], pair[1]);
                        }
                    }
                }
                if (metadataMap != null) {
                    params.put("metadata", metadataMap);
                    System.out.println("Key : metadata is added, value : " + metadataMap.entrySet());
                }
            }
            // process shipping Map and address map
            else if ("shipping".equals(entry.getKey())){
                Map<String, Object> shippingMap = (Map<String, Object>) entry.getValue();
                // remove empty keys from shipping map
                shippingMap = StripeDemoUtil.removeEmptyValue(shippingMap);
                // remove empty keys from address map
                Map<String, Object> addressMap = (Map<String, Object>) shippingMap.get("address");
                addressMap = StripeDemoUtil.removeEmptyValue(addressMap);

                params.put("shipping", shippingMap);
                System.out.println("Key : " + entry.getKey() + " is added, value : " + shippingMap);

            }
            // process transfer_data map
            else if ("transfer_data".equals(entry.getKey())){
                Map<String, Object> tdMap = (Map<String, Object>) entry.getValue();
                if (tdMap.get("destination") != null && !"".equals(tdMap.get("destination"))){
                    params.put("transfer_data", tdMap);
                    System.out.println("Key : " + entry.getKey() + " is added, value : " + tdMap);
                }
            }
            // all other parameters
            else {
                params.put(entry.getKey(), entry.getValue());
                System.out.println("Key : " + entry.getKey() + " is added, value : " + entry.getValue());
            }
        }
        System.out.println("Param map: " + params);
        return params;
    }

    /**
     * Retrieve a PaymentIntent
     * @param id
     * @return
     * @throws StripeException
     */
    public PaymentIntent retrievePaymentIntent(String id) throws StripeException {
        Stripe.apiKey = Constants.GB_PAYMENT_SK;
        PaymentIntent paymentIntent = PaymentIntent.retrieve(id);
        return paymentIntent;
    }


}
