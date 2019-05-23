package stripe.api.playground.controller;

import com.stripe.exception.StripeException;
import com.stripe.model.*;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.model.*;
import stripe.api.playground.service.BillingServ;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.Properties;
import stripe.api.playground.util.StripeDemoUtil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * User: chenma
 * Date: 2019-01-28
 */

@RequestMapping
@Controller
public class BillingController {

    private static final Logger logger = Logger.getLogger(BillingController.class);


    private void getProductsFromAccount(String accountName, Model model, Boolean isNew) {

        model.addAttribute("isNew", false);
        if (isNew != null && isNew){
            model.addAttribute("isNew", true);
        }

        if (StripeDemoUtil.isNotEmpty(accountName)){
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            if (StripeDemoUtil.isNotEmpty(apiKey)){
                BillingServ billingServ = new BillingServ(apiKey);
                List<Product> products = null;
                try {
                    products = billingServ.getProducts(StripeDemoUtil.getConditions(isNew));
                } catch (StripeException e) {
                    logger.error(e.getMessage());
                    model.addAttribute("error", new StripeDemoError(e.getRequestId(), "Get Product", e.getMessage(), "getProductsFromAccount", e.getCode()));
                } catch (ParseException e) {
                    logger.error(e.getMessage());
                    model.addAttribute("error", new StripeDemoError("", "Get Product", e.getMessage(), "getProductsFromAccount", ""));
                }
                model.addAttribute("products", products);
            }
        } else {
            model.addAttribute("products", new ArrayList<Product>());
        }

        if (StripeDemoUtil.isNotEmpty(accountName)){
            model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountName));
        }
    }

    private void getPlansFromAccount(String accountName, Model model, Boolean isNew) {
        model.addAttribute("isNew", false);
        if (isNew != null && isNew){
            model.addAttribute("isNew", true);
        }
        if (StripeDemoUtil.isNotEmpty(accountName)){
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            if (StripeDemoUtil.isNotEmpty(apiKey)){
                BillingServ billingServ = new BillingServ(apiKey);
                List<Plan> plans = null;
                try {
                    plans = billingServ.getPlans(StripeDemoUtil.getConditions(isNew));
                } catch (StripeException e) {
                    logger.error(e.getMessage());
                    model.addAttribute("error", new StripeDemoError(e.getRequestId(), "Get Plan", e.getMessage(), "getPlansFromAccount", e.getCode()));
                } catch (ParseException e) {
                    logger.error(e.getMessage());
                    model.addAttribute("error", new StripeDemoError("", "Get Plan", e.getMessage(), "getPlansFromAccount", ""));
                }
                model.addAttribute("plans", plans);
            }
        } else {
            model.addAttribute("plans", new ArrayList<Plan>());
        }

        if (StripeDemoUtil.isNotEmpty(accountName)){
            model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountName));
        }

    }

    /**
     * Show all products
     * @param model
     * @return
     */
    @RequestMapping(value = "product", method = RequestMethod.GET)
    public String showProducts(
            @RequestParam(value="isNew", required=false) Boolean isNew,
            @RequestParam(value="acct", required=false) String account,
            Model model){

        model.addAttribute("accounts", StripeDemoUtil.getAccountPropertyCollections().getAccountPropertiesList());
        model.addAttribute("stripeAccount", new StripeAccount());
        model.addAttribute("prd", new Product());

        getProductsFromAccount(account, model, isNew);

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
    public String createProduct (
            @ModelAttribute("prd") Product product,
            @ModelAttribute("isNew") String isNew,
            @ModelAttribute("accountName") String accountName,
            @ModelAttribute("accountForNewProd") String accountForNewProd,
            @ModelAttribute("createNewProduct") String createNewProduct,
            BindingResult result, Model model){


        model.addAttribute("accounts", StripeDemoUtil.getAccountPropertyCollections().getAccountPropertiesList());
        model.addAttribute("stripeAccount", new StripeAccount());

        // switching accounts
        if (StripeDemoUtil.isNotEmpty(accountName)){
            model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountName));

            getProductsFromAccount(accountName, model, Boolean.valueOf(isNew));

            model.addAttribute("prd", new Product());
        }

        // create a new product
        else if ("true".equalsIgnoreCase(createNewProduct)) {
            if (StripeDemoUtil.isNotEmpty(accountForNewProd)){
                model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountForNewProd));
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountForNewProd);
                if (StripeDemoUtil.isNotEmpty(apiKey)){
                    BillingServ billingServ = new BillingServ(apiKey);
                    Map<String, Object> prodReq = new HashMap<>();
                    prodReq.put("name", product.getName());
                    prodReq.put("type", product.getType());

                    try {
                        Product prod = billingServ.createProduct(prodReq);
                        Notification notification = new Notification("", "A new product "+ prod.getId() + " is created successfully", "createProduct");
                        model.addAttribute("notification", notification);
                    } catch (StripeException e) {
                        logger.error(e.getMessage());
                        model.addAttribute("error", new StripeDemoError(e.getRequestId(), "Create Product", e.getMessage(), "createProduct", e.getCode()));
                    }

                    getProductsFromAccount(accountForNewProd, model, false);
                }
            }
            // No account is selected
            else {
                logger.error("Can not create a product, because no account is selected");
                model.addAttribute("error", new StripeDemoError("", "Create Product", "Can not create a product, because no account is selected", "createProduct", ""));
            }
        }

        return Constants.LIST_PRODUCT_VIEW;
    }

    /**
     * Show all plans
     * @param model
     * @return
     */
    @RequestMapping(value = "plan", method = RequestMethod.GET)
    public String ShowPlans(
            @RequestParam(value="isNew", required=false) Boolean isNew,
            @RequestParam(value="acct", required=false) String account,
            Model model){

        model.addAttribute("accounts", StripeDemoUtil.getAccountPropertyCollections().getAccountPropertiesList());
        model.addAttribute("stripeAccount", new StripeAccount());
        model.addAttribute("planReq", new PlanReq());

        getPlansFromAccount(account, model, isNew);

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
    public String createPlan (
            @ModelAttribute("planReq") PlanReq planReq,
            @ModelAttribute("isNew") String isNew,
            @ModelAttribute("accountName") String accountName,
            @ModelAttribute("accountForNewProd") String accountForNewProd,
            @ModelAttribute("createNewPlan") String createNewPlan,
            BindingResult result, Model model){


        model.addAttribute("accounts", StripeDemoUtil.getAccountPropertyCollections().getAccountPropertiesList());
        model.addAttribute("stripeAccount", new StripeAccount());

        // switching accounts
        if (StripeDemoUtil.isNotEmpty(accountName)){

            model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountName));
            //logger.info(accountName);
            getPlansFromAccount(accountName, model, Boolean.valueOf(isNew));
            model.addAttribute("prd", new Product());
        }
        // create a new product
        else if ("true".equalsIgnoreCase(createNewPlan)) {
            if (StripeDemoUtil.isNotEmpty(accountForNewProd)) {

                model.addAttribute("account", StripeDemoUtil.getAccountPropertiesFromName(accountForNewProd));
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountForNewProd);
                if (StripeDemoUtil.isNotEmpty(apiKey)) {
                    BillingServ billingServ = new BillingServ(apiKey);
                    try {
                        Plan plan = billingServ.createPlan(planReq);
                        Notification notification = new Notification("", "A new plan "+ plan.getId() + " is created successfully", "createPlan");
                        model.addAttribute("notification", notification);
                    } catch (StripeException e) {
                        logger.error(e.getMessage());
                        model.addAttribute("error", new StripeDemoError(e.getRequestId(), "Create Plan", e.getMessage(), "createPlan", e.getCode()));
                    }

                    getPlansFromAccount(accountForNewProd, model, Boolean.valueOf(isNew));
                }
            }
            // No account is selected
            else {
                logger.error("Can not create a plan, because no account is selected");
                StripeDemoError error = new StripeDemoError("", "Create Plan", "Can not create a plan, because no account is selected", "createPlan", "");
                model.addAttribute("error", error);
            }
        }


        return Constants.LIST_PLAN_VIEW;
    }


    /**
     * Show subscription view
     * @param model
     * @return
     */
    @RequestMapping(value = "subscription", method = RequestMethod.GET)
    public String ShowSubscriptions(
            @RequestParam(value="acct", required=false) String accountName,
            Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        if (StripeDemoUtil.isNotEmpty(accountName)){
            viewObject.setCurrentAccount(StripeDemoUtil.getAccountPropertiesFromName(accountName));
        }

        model.addAttribute("viewObj", viewObject);
        model.addAttribute("subReq", new SubscriptionReq());

        return Constants.CREATE_SUB_VIEW;
    }


    /**
     * Create a new subscription
     * @param subReq
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/subscription", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> createSubscription (
            @ModelAttribute("subReq") SubscriptionReq subReq,
            @ModelAttribute("accountName") String accountName,
            BindingResult result, Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                StripeDemoUtil.getAccountPropertiesFromName(accountName),
                StripeDemoUtil.getAccountPropertyCollections(),
                true,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);
        model.addAttribute("subReq", subReq);

        PlaygroundResponse response = new PlaygroundResponse();

        try {
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            BillingServ billingServ = new BillingServ(apiKey);
            Subscription subscription = billingServ.createSub(subReq);
            response.setBody(subscription);

        } catch (StripeException e) {
            logger.error(e.getMessage());
            response.setError(true);
            response.setBody(new StripeDemoError(e.getRequestId(), "Create Subscription", e.getMessage(), "Create Subscription", e.getCode()));
        }
        return ResponseEntity.ok().body(response.toJSON());
    }

    /**
     * list all subscriptions
     * @param model
     * @return
     */
    @RequestMapping(value = "list-subscription", method = RequestMethod.GET)
    public String showAllSubscriptionsView(
            @RequestParam(value="isNew", required=false) Boolean isNew,
            @RequestParam(value="acct", required=false) String accountName,
            Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        if (StripeDemoUtil.isNotEmpty(accountName)){
            List<Subscription> subs = getSubsFromAccountName(accountName, isNew);
            model.addAttribute("subs", subs);
            viewObject.setResponse(subs);
            viewObject.setCurrentAccount(StripeDemoUtil.getAccountPropertiesFromName(accountName));
        }

        model.addAttribute("viewObj", viewObject);
        model.addAttribute("stripeAccount", new StripeAccount());
        model.addAttribute("subReq", new SubscriptionReq());

        String accountCollections = StripeDemoUtil.getAccountPropertyCollections().toJSON().replaceAll("\n", "");
        model.addAttribute("accountCollections", accountCollections);

        return Constants.LIST_SUB_VIEW;
    }

    @RequestMapping(value = "/list-subscription", method = RequestMethod.POST)
    public String showAllSubscriptions (
            @RequestParam(value="isNew", required=false) Boolean isNew,
            @ModelAttribute("accountName") String accountName,
            BindingResult result, Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                StripeDemoUtil.getAccountPropertiesFromName(accountName),
                StripeDemoUtil.getAccountPropertyCollections(),
                true,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);
        model.addAttribute("stripeAccount", new StripeAccount());

        List<Subscription> subs = getSubsFromAccountName(accountName, isNew);
        model.addAttribute("subs", subs);
        viewObject.setResponse(subs);


        return Constants.LIST_SUB_VIEW;
    }

/*

    */
/**
     * Update a subscription
     * @param model
     * @return
     *//*

    @RequestMapping(value = "subscription/{subId}", method = RequestMethod.GET)
    public String showUpdateSubView(
            @RequestParam(value="isNew", required=false) Boolean isNew,
            @RequestParam(value="acct", required=false) String accountName,
            @PathVariable(value="subId") String subId,
            Model model){

        if (StripeDemoUtil.isNotEmpty(accountName) && StripeDemoUtil.isNotEmpty(subId)){

            try {
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
                BillingServ billingServ = new BillingServ(apiKey);
                Subscription subscription = billingServ.getSub(subId);
                model.addAttribute("sub", subscription);
            } catch (StripeException e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("subReq", new SubscriptionReq());


        return Constants.UPDATE_SUB_VIEW;
    }
*/

    /**
     * Update a subscription
     * @param model
     * @return
     */
    @RequestMapping(value = "subscription/{subId}", method = RequestMethod.POST)
    public String showUpdateSubView(
            @ModelAttribute(value="acct") String accountName,
            @PathVariable(value="subId") String subId,
            @ModelAttribute("subReq") SubscriptionReq subReq,
            Model model){

        if (StripeDemoUtil.isNotEmpty(accountName) && StripeDemoUtil.isNotEmpty(subId)){
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            BillingServ billingServ = new BillingServ(apiKey);
            try {
                Subscription subscription = billingServ.getSub(subId);
                model.addAttribute("sub", subscription);
            } catch (StripeException e) {
                e.printStackTrace();
            }
        }

        model.addAttribute("subReq", new SubscriptionReq());


        return Constants.UPDATE_SUB_VIEW;
    }

    @RequestMapping(value = "subscription/{subId}/update", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> updateSubscription(
            @ModelAttribute("subReq") SubscriptionReq subReq,
            @ModelAttribute("acct") String accountName,
            @PathVariable(value="subId") String subId,
            BindingResult result, Model model){
        try {
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            BillingServ billingServ = new BillingServ(apiKey);
            Subscription sub = billingServ.updateSub(subReq, subId);
            model.addAttribute("sub", sub);
        } catch (StripeException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<Subscription> getSubsFromAccountName(String accountName, Boolean isNew){
        List<Subscription> subs = null;
        try {
            String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            BillingServ billingServ = new BillingServ(apiKey);
            subs = billingServ.getSubscriptions(StripeDemoUtil.getConditions(isNew));
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (StripeException e) {
            e.printStackTrace();
        }
        return subs;
    }

}
