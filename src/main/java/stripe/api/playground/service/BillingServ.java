package stripe.api.playground.service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.*;
import org.apache.log4j.Logger;
import stripe.api.playground.model.PlanReq;
import stripe.api.playground.model.SubscriptionReq;
import stripe.api.playground.util.StripeDemoUtil;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * User: chenma
 * Date: 2019-01-28
 */

public class BillingServ {

    private static final Logger logger = Logger.getLogger(BillingServ.class);

    private String apiKey;


    public BillingServ() {
    }

    public BillingServ(String apiKey) {
        this.apiKey = apiKey;
        Stripe.apiKey = apiKey;
    }

    /**
     * Get a list of products
     * @param conditions
     * @return
     * @throws StripeException
     */
    public List<Product> getProducts(Map<String, Object> conditions) throws StripeException {
        if (conditions == null) {
            conditions = new HashMap<>();
        }
        ProductCollection productCollection = Product.list(conditions);
        List<Product> products = productCollection.getData();

        Iterator<Product> it = products.iterator();
        while (it.hasNext()) {
            Product product = it.next();
            Long created = product.getCreated();
            product.setCreated(created * 1000);
        }

        return products;
    }

    /**
     * Create a product
     * @param reqParams
     * @return
     * @throws StripeException
     */
    public Product createProduct(Map<String, Object> reqParams) throws StripeException {
        return Product.create(reqParams);
    }

    /**
     * Get a list of plans
     * @param conditions
     * @return
     * @throws StripeException
     */
    public List<Plan> getPlans(Map<String, Object> conditions) throws StripeException {

        if (conditions == null) {
            conditions = new HashMap<>();
        }

        PlanCollection planCollection = Plan.list(conditions);
        List<Plan> plans = planCollection.getData();

        Iterator<Plan> it = plans.iterator();
        while (it.hasNext()){
            Plan plan = it.next();
            Long created = plan.getCreated();
            plan.setCreated(created * 1000);
        }

        return plans;

    }

    /**
     * Create a plan
     * @param planReq
     * @return
     * @throws StripeException
     */
    public Plan createPlan (PlanReq planReq) throws StripeException {

        Map<String, Object> reqParams = getPlanReq(planReq);
        Plan plan = Plan.create(reqParams);

        return plan;
    }

    public Subscription createSub(SubscriptionReq subReq) throws StripeException {

        Map<String, Object> reqParams = getSubReq(subReq);
        Subscription subscription = Subscription.create(reqParams);

        return subscription;
    }

    private Map<String, Object> getPlanReq(PlanReq planReq){

        Map<String, Object> planParams = StripeDemoUtil.convertObjToMap(planReq);

        String billingScheme = (String) planParams.get("billing_scheme");
        if ("per_unit".equals(billingScheme)){
            planParams.remove("tiers");
            planParams.remove("tiers_mode");
        } else {
            planParams.remove("amount");
        }

        Map<String, Object> transformUsage = (Map<String, Object>) planParams.get("transform_usage");
        if (StripeDemoUtil.isEmpty((String) transformUsage.get("divide_by"))){
            planParams.remove("transform_usage");
        }

        return planParams;
    }


    private Map<String, Object> getSubReq (SubscriptionReq subReq){
        Map<String, Object> subParams = StripeDemoUtil.convertObjToMap(subReq);

        List<Map<String, Object>> itemsList = (List<Map<String, Object>>) subParams.get("items");
        Iterator<Map<String, Object>> it = itemsList.iterator();
        while (it.hasNext()) {
            Map<String, Object> itemMap = it.next();
            if ("".equals(itemMap.get("plan")) || itemMap.get("plan") == null){
                it.remove();
            }
        }

        return subParams;
    }


}
