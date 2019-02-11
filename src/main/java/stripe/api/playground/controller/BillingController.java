package stripe.api.playground.controller;

import com.stripe.exception.StripeException;
import com.stripe.model.Plan;
import com.stripe.model.Product;
import com.stripe.model.Subscription;
import com.stripe.model.SubscriptionCollection;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import stripe.api.playground.model.PlanReq;
import stripe.api.playground.model.PlaygroundResponse;
import stripe.api.playground.model.RequestError;
import stripe.api.playground.model.SubscriptionReq;
import stripe.api.playground.service.BillingServ;
import stripe.api.playground.util.Constants;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * User: chenma
 * Date: 2019-01-28
 */

@RequestMapping
@Controller
public class BillingController {

    private static final Logger logger = Logger.getLogger(BillingController.class.getName());

    /**
     * Show all products
     * @param model
     * @return
     */
    @RequestMapping(value = "product", method = RequestMethod.GET)
    public String ShowProducts(@RequestParam(value="isNew", required=false) Boolean isNew, Model model){

        /*
        List<Account> accounts = new ArrayList<>();
        accounts.add(new stripe.api.playground.model.Account(Constants.GB_PAYMENT_SK, Constants.GB_PAYMENT_PK));
        accounts.add(new stripe.api.playground.model.Account(Constants.GB_CONNECT_SK, Constants.GB_CONNECT_PK));
        model.addAttribute("accounts", accounts);
        */

        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);
        model.addAttribute("isNew", false);

        try {
            Map<String, Object> conditions = new HashMap<>();
            if (isNew != null && isNew){
                model.addAttribute("isNew", true);
            }
            conditions = getConditions(isNew);
            List<Product> products = billingServ.getProducts(conditions);
            model.addAttribute("products", products);

        } catch (StripeException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        model.addAttribute("prd", new Product());

        return Constants.LIST_PRODUCT_VIEW;
    }


    /**
     * Create a new product
     * @param product
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/product", method = RequestMethod.POST)
    public String createProduct (@ModelAttribute("prd") Product product, @ModelAttribute("isNew") String isNew, BindingResult result, Model model){

        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);
        Map<String, Object> prodReq = new HashMap<>();
        Map<String, Object> conditions = new HashMap<>();

        prodReq.put("name", product.getName());
        prodReq.put("type", product.getType());

        try {
            billingServ.createProduct(prodReq);
            conditions = getConditions(true);
            List<Product> products = billingServ.getProducts(conditions);
            model.addAttribute("products", products);

        } catch (StripeException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return Constants.LIST_PRODUCT_VIEW;
    }

    /**
     * Show all plans
     * @param model
     * @return
     */
    @RequestMapping(value = "plan", method = RequestMethod.GET)
    public String ShowPlans(@RequestParam(value="isNew", required=false) Boolean isNew, Model model){

        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);
        model.addAttribute("isNew", false);

        try {
            Map<String, Object> conditions = new HashMap<>();
            if (isNew != null && isNew){
                model.addAttribute("isNew", true);
            }
            conditions = getConditions(isNew);
            List<Plan> plans = billingServ.getPlans(conditions);
            model.addAttribute("plans", plans);

        } catch (StripeException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        model.addAttribute("planReq", new PlanReq());

        return Constants.LIST_PLAN_VIEW;
    }

    /**
     * Create a new plan
     * @param planReq
     * @param isNew
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/plan", method = RequestMethod.POST)
    public String createPlan (@ModelAttribute("planReq") PlanReq planReq, @ModelAttribute("isNew") String isNew, BindingResult result, Model model){
        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);

        Map<String, Object> conditions = new HashMap<>();


        try {
            billingServ.createPlan(planReq);

        } catch (StripeException e) {
            logger.severe("RequestID: " + e.getRequestId() + ", Error Code: " + e.getCode() + ", Error Message: " + e.getMessage());

            RequestError error = new RequestError(e.getRequestId(), e.getCode(), e.getMessage());
            model.addAttribute("error", error);
        }

        // List all plans
        try {
            conditions = getConditions(Boolean.parseBoolean(isNew));

            List<Plan> plans = billingServ.getPlans(conditions);
            model.addAttribute("plans", plans);
        } catch (StripeException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return Constants.LIST_PLAN_VIEW;
    }

    /**
     * list all subscriptions
     * @param model
     * @return
     */
    @RequestMapping(value = "list-subscription", method = RequestMethod.GET)
    public String ShowAllSubscriptions(@RequestParam(value="isNew", required=false) Boolean isNew, Model model){
        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);

        Map<String, Object> conditions = new HashMap<>();
        try {
            conditions = getConditions(isNew);
            SubscriptionCollection subCollection = Subscription.list(conditions);
            List<Subscription> subs = subCollection.getData();
            model.addAttribute("subs", subs);
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (StripeException e) {
            e.printStackTrace();
        }

        model.addAttribute("publishKey", Constants.GB_PAYMENT_PK);
        model.addAttribute("subReq", new SubscriptionReq());

        return Constants.LIST_SUB_VIEW;
    }

    /**
     * Show all subscriptions
     * @param model
     * @return
     */
    @RequestMapping(value = "subscription", method = RequestMethod.GET)
    public String ShowSubscriptions(Model model){

        model.addAttribute("publishKey", Constants.GB_PAYMENT_PK);
        model.addAttribute("subReq", new SubscriptionReq());

        return Constants.CREATE_SUB_VIEW;
    }


    /**
     * Create a new product
     * @param subReq
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/subscription", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> createSubscription (@ModelAttribute("subReq") SubscriptionReq subReq, BindingResult result, Model model){

        BillingServ billingServ = new BillingServ(Constants.GB_PAYMENT_SK);
        Subscription subscription = new Subscription();
        PlaygroundResponse response = new PlaygroundResponse();
        try {
            subscription = billingServ.createSub(subReq);
            //model.addAttribute("sub", subscription);
            response.setBody(subscription);

        } catch (StripeException e) {
            //e.printStackTrace();
            logger.severe("RequestID: " + e.getRequestId() + ", Error Code: " + e.getCode() + ", Error Message: " + e.getMessage());
            response.setError(true);
            response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));
        }
        model.addAttribute("subReq", subReq);
        model.addAttribute("publishKey", Constants.GB_PAYMENT_PK);

        return ResponseEntity.ok().body(response.toJSON());
    }

    private Map<String, Object> getConditions(Boolean isNew) throws ParseException {

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
}
