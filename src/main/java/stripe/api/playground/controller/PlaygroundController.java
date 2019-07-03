package stripe.api.playground.controller;

import com.stripe.Stripe;
import com.stripe.exception.SignatureVerificationException;
import com.stripe.model.Account;
import com.stripe.model.CountrySpec;
import com.stripe.model.*;
import com.stripe.model.oauth.TokenResponse;
import com.stripe.net.OAuth;
import com.stripe.net.Webhook;
import com.stripe.param.PaymentMethodListParams;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.model.*;
import stripe.api.playground.util.ActionCode;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.ResponseCode;
import stripe.api.playground.util.StripeDemoUtil;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * User: chenma
 * Date: 2019-04-16
 *
 * This is the controller class for Stripe API playground
 */

@RequestMapping
@Controller
public class PlaygroundController {

    private static final Logger logger = Logger.getLogger(PlaygroundController.class);
    private WebhookCollection webhookCollection;
    private List<String> webhookList;

    private String webhookContent;
    private String returnCode;
    private String returnStatus;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginlView(Model model){

        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.LOGIN_VIEW;
    }

    @RequestMapping(value = "/login-process", method = RequestMethod.POST)
    public String loginProcessRequest (
            HttpSession session,
            @RequestBody String data){

        // update DB

        PlaygroundResponse response = new PlaygroundResponse();

        return null;

    }

    /**
     * Get account property using the provided Stripe account name.
     * This method will be used mainly from the view
     *
     * Path = /getAccount
     *
     * @param accountName
     * @return accountProperties
     */
    @RequestMapping(value = "/getAccount", method = RequestMethod.GET)
    @ResponseBody
    public AccountProperties getAccountPropertyByName(
            @RequestParam(value="acctName", required=false) String accountName){

        AccountProperties accountProperties = StripeDemoUtil.getAccountPropertiesFromName(accountName);
        return accountProperties;
    }

    /*=======================================================================*/
    /*=============================   PAYMENT   =============================*/
    /*=======================================================================*/
    /**
     * Show PaymentIntent manual confirmation page
     *
     * Path = /payment_intent_manual
     *
     * @param model
     * @return payments/payment_intent_manual.jsp
     */
    @RequestMapping(value = "/payment-intent-manual", method = RequestMethod.GET)
    public String showPIManualView(
            @CookieValue(value = "user", required = false) String userCookie,
            @RequestParam (value="pm_id", required = false) String pm_id,
            @RequestParam (value="cust_id", required = false) String cust_id,
            HttpSession session,
            Model model){

        logger.info("Logged in user: " + userCookie);
        if (StripeDemoUtil.isEmpty(userCookie)){
            return Constants.LOGIN_VIEW;
        }

        session.setAttribute("user", userCookie);
        logger.info(session.getAttributeNames());

        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("pm_id", pm_id);
        model.addAttribute("cust_id", cust_id);
        model.addAttribute("hasPM", false);
        if (StripeDemoUtil.isNotEmpty(pm_id)){
            model.addAttribute("hasPM", true);
        }
        model.addAttribute("viewObj", viewObject);
        return Constants.PAYMENT_INTENT_MANUAL_VIEW;
    }

    /**
     * Show PaymentIntent auto confirmation page
     *
     * Path = /payment_intent_auto
     *
     * @param model
     * @return payments/payment_intent_auto.jsp
     */
    @RequestMapping(value = "/payment-intent-auto", method = RequestMethod.GET)
    public String showPIAutoView(HttpSession session, Model model){

        logger.info(session.getAttribute("user"));
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.PAYMENT_INTENT_AUTO_VIEW;
    }

    /**
     * Show SetupIntent page
     *
     * Path = /setup_intent
     *
     * @param model
     * @return payments/setup_intent.jsp
     */
    @RequestMapping(value = "/setup-intent", method = RequestMethod.GET)
    public String showSIView(HttpSession session, Model model){

        logger.info(session.getAttribute("user"));
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.SETUP_INTENT_VIEW;
    }

    /**
     * Confirm a PaymentIntent
     * @param model
     * @return
     */
    @RequestMapping(value = "/confirm-payment-intent", method = RequestMethod.GET)
    public String confirmPIView(Model model){

        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.CONFIRM_PAYMENT_INTENT_VIEW;
    }

    /**
     * Capture a PaymentIntent
     * @param model
     * @return
     */
    @RequestMapping(value = "/capture-payment-intent", method = RequestMethod.GET)
    public String capturePIView(Model model){

        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.CAPTURE_PAYMENT_INTENT_VIEW;
    }

    /**
     * Create PaymentIntent
     *
     * @param jsonData
     * @return ResponseEntity
     */
    @RequestMapping(value = "/payment-intent", method = RequestMethod.POST)
    public ResponseEntity<String> createPaymentIntentManualRequest (
            @RequestBody String jsonData){

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            // Create a PaymentIntent
            PaymentIntent pi = PaymentIntent.create(paramMap);
            logger.info("PaymentIntent created successfully - id: " + pi.getId() + ", status: " + pi.getStatus());

            // Process PaymentIntent response
            response = setAction(response, pi);
            response.setApiResponse(pi.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }

    }

    /**
     * Confirm a payment intent
     *
     * @param piId
     * @param jsonData
     * @return ResponseEntity
     */
    @RequestMapping(value = "/payment-intent/{piId}/confirm", method = RequestMethod.POST)
    public ResponseEntity<String> confirmPaymentIntentRequest (
            @PathVariable(value="piId") String piId,
            @RequestBody String jsonData) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String, Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            PaymentIntent pi = PaymentIntent.retrieve(piId);
            pi = pi.confirm(paramMap);

            logger.info("PaymentIntent confirmed successfully - id: " + pi.getId() + ", status: " + pi.getStatus());


            response = setAction(response, pi);
            response.setApiResponse(pi.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Confirm a payment intent
     *
     * @param siId
     * @param jsonData
     * @return ResponseEntity
     */
    @RequestMapping(value = "/setup-intent/{siId}/confirm", method = RequestMethod.POST)
    public ResponseEntity<String> confirmSetupIntentRequest (
            @PathVariable(value="siId") String siId,
            @RequestBody String jsonData) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String, Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            SetupIntent si = SetupIntent.retrieve(siId);
            si = si.confirm(paramMap);

            logger.info("SetupIntent confirmed successfully - id: " + si.getId() + ", status: " + si.getStatus());


            response = setAction(response, si);
            response.setApiResponse(si.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Capture a payment intent
     *
     * @param piId
     * @param jsonData
     * @return ResponseEntity
     */
    @RequestMapping(value = "/payment-intent/{piId}/capture", method = RequestMethod.POST)
    public ResponseEntity<String> capturePaymentIntentRequest (
            @PathVariable(value="piId") String piId,
            @RequestBody String jsonData) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String, Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            PaymentIntent pi = PaymentIntent.retrieve(piId);
            pi = pi.capture(paramMap);

            logger.info("PaymentIntent captured successfully - id: " + pi.getId() + ", status: " + pi.getStatus());

            response = setAction(response, pi);
            response.setApiResponse(pi.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }


    /**
     * Retrieve customer's saved payment methods
     * @param customerId
     * @param data
     * @return
     */
    @RequestMapping(value = "/customer/{customerId}/payment-method", method = RequestMethod.POST)
    public ResponseEntity<String> retrievePaymentMethodsForCustomerRequest (
            @PathVariable(value="customerId") String customerId,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(data);

            PaymentMethodListParams params = PaymentMethodListParams.builder()
                    .setCustomer(customerId)
                    .setType(PaymentMethodListParams.Type.CARD)
                    .build();
            PaymentMethodCollection pm = PaymentMethod.list(params);

            logger.info("Retrieved payment methods for customer: " + customerId);
            response.setApiResponse(pm);

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create SetupIntent
     *
     * @param jsonData
     * @return ResponseEntity
     */
    @RequestMapping(value = "/setup-intent", method = RequestMethod.POST)
    public ResponseEntity<String> createSetupIntentManualRequest (
            @RequestBody String jsonData){

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            // Create a PaymentIntent
            SetupIntent setupIntent = SetupIntent.create(paramMap);
            logger.info("SetupIntent created successfully - id: " + setupIntent.getId() + ", status: " + setupIntent.getStatus());

            response = setAction(response, setupIntent);
            response.setApiResponse(setupIntent.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }

    }

    /**
     * Set actions to response
     * @param response
     * @param obj
     * @return response
     */
    private PlaygroundResponse setAction (PlaygroundResponse response, Object obj){
        String status = null;
        String clientSecret = null;
        String nextAction = null;
        String url = null;

        if (obj instanceof PaymentIntent){
            PaymentIntent pi = (PaymentIntent) obj;
            status = pi.getStatus();
            clientSecret = pi.getClientSecret();
            if ("requires_action".equals(status)){
                nextAction = pi.getNextAction().getType();
                if (pi.getNextAction().getRedirectToUrl() != null){
                    url = pi.getNextAction().getRedirectToUrl().getUrl();
                }
            }
        } else if (obj instanceof SetupIntent){
            SetupIntent si = (SetupIntent) obj;
            status = si.getStatus();
            clientSecret = si.getClientSecret();
            if ("requires_action".equals(status)){
                nextAction = si.getNextAction().getType();
                if (si.getNextAction().getRedirectToUrl() != null){
                    url = si.getNextAction().getRedirectToUrl().getUrl();
                }
            }
        }

        switch (status){
            case "requires_payment_method":
                response.setCode(ResponseCode.REQUIRE_ACTION);
                response.setAction(new ResponseAction(ActionCode.REQUIRES_PAYMENT_METHOD, clientSecret));
                break;
            case "requires_confirmation":
                response.setCode(ResponseCode.REQUIRE_ACTION);
                response.setAction(new ResponseAction(ActionCode.REQUIRES_CONFIRMATION, null));
                break;
            case "requires_action":
                response.setCode(ResponseCode.REQUIRE_ACTION);
                switch (nextAction){
                    case "redirect_to_url":
                        response.setAction(new ResponseAction(ActionCode.REDIRECT_TO_URL, url));
                        break;
                    case "use_stripe_sdk":
                        response.setAction(new ResponseAction(ActionCode.USE_STRIPE_SDK, clientSecret));
                        break;
                }
                break;
            case "processing":
                response.setCode(ResponseCode.SUCCESS_PROCESSING);
                response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
                break;
            case "requires_capture":
                response.setCode(ResponseCode.REQUIRE_ACTION);
                response.setAction(new ResponseAction(ActionCode.REQUIRES_CAPTURE, null));
                break;
            case "canceled":
                response.setCode(ResponseCode.SUCCESS_CANCELED);
                response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
                break;
            case "succeeded":
                response.setCode(ResponseCode.SUCCESS);
                response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
                break;
        }
        return response;
    }

    /*=======================================================================*/
    /*=============================   WEBHOOK   =============================*/
    /*=======================================================================*/
    @RequestMapping(value = "/payment-intent-auto/webhook", method = RequestMethod.POST)
    public ResponseEntity<Object> receiveWebhook(
            @RequestBody String payload,
            @RequestHeader(value="Stripe-Signature") String stripeSignature){

        String signature = "whsec_RL9vv788gIJ96WLHfTGbJ47SB7gFOe6c";
        //logger.info(stripeSignature);
        try {
            Event event = Webhook.constructEvent(payload, stripeSignature, signature);
            switch (event.getType()) {
                case "payment_intent.payment_failed":

                    break;
                case "payment_intent.succeeded":
                    break;
            }
        } catch (SignatureVerificationException e) {
            e.printStackTrace();
        }

        webhookContent = payload.replaceAll("\\s", "");
        logger.info("webhook received: " + webhookContent);

        // build a webhook collection.
        if (webhookCollection == null){
            webhookCollection = new WebhookCollection();
        }
        if (webhookList == null){
            webhookList = new ArrayList<String>();
            webhookCollection.setData(webhookList);
        }
        webhookList.add(webhookContent);

        return ResponseEntity.ok().body(null);
    }

    /**
     * Receive webhook from Stripe
     * @param response
     */
    @RequestMapping(value = "/payment-intent-auto/webhook")
    public void handleWebhookmessage(HttpServletResponse response) {

        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("utf-8");

        PrintWriter writer;
        try {
            writer = response.getWriter();
            if (webhookCollection != null){
                writer.println("data: " + webhookCollection.toJSON().replaceAll("\\s", "") + "\n");
                webhookCollection = null;
                webhookList = null;
            } else {
                writer.println("data: null" + "\n");
            }
            writer.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*=======================================================================*/
    /*=============================   BILLING   =============================*/
    /*=======================================================================*/

    /**
     * Show product-plan page
     * @param httpSession
     * @param model
     * @return
     */
    @RequestMapping(value = "/product-plan", method = RequestMethod.GET)
    public String showProductPlanView(HttpSession httpSession, Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);

        return Constants.CREATE_PRODUCT_PLAN_VIEW;
    }

    @RequestMapping(value = "/create-sub", method = RequestMethod.GET)
    public String showSubView(HttpSession httpSession, Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);

        return Constants.CREATE_SUBSCRIPTION_VIEW;
    }

    /**
     * Create a product
     * @param httpSession
     * @param data
     * @return
     */
    @RequestMapping(value = "/create-product", method = RequestMethod.POST)
    public ResponseEntity<String> createProductRequest (
            HttpSession httpSession,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            Product product = Product.create(paramMap);
            response.setApiResponse(product.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Created a product " + product.getId());
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    @RequestMapping(value = "/list-product", method = RequestMethod.POST)
    public ResponseEntity<String> listProductsRequest (
            HttpSession httpSession,
            @RequestBody String accountName) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

            Map<String, Object> conditions = new HashMap<>();
            conditions.put("limit", 100);
            ProductCollection productCollection = Product.list(conditions);
            List<Product> products = productCollection.getData();

            response.setApiResponse(products);
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Retrieved a list of products.");
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }


    /**
     * Create a plan
     * @param httpSession
     * @param data
     * @return
     */
    @RequestMapping(value = "/create-plan", method = RequestMethod.POST)
    public ResponseEntity<String> createPlanRequest (
            HttpSession httpSession,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            Plan plan = Plan.create(paramMap);
            response.setApiResponse(plan.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Created a plan " + plan.getId());
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create a subscription
     * @param httpSession
     * @param data
     * @return
     */
    @RequestMapping(value = "/create-subscription", method = RequestMethod.POST)
    public ResponseEntity<String> createSubRequest (
            HttpSession httpSession,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");
            paramMap.put("expand[]", "latest_invoice.payment_intent");

            Subscription sub = Subscription.create(paramMap);
            response.setApiResponse(sub.toJson());
            String status = sub.getStatus();
            if ("active".equals(status)){
                response.setCode(ResponseCode.SUCCESS);
                response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
            } else if ("trialing".equals(status)){
                response.setCode(ResponseCode.SUCCESS_TRIALING);
                response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
            } else if ("incomplete".equals(status)){
                PaymentIntent pi = sub.getLatestInvoiceObject().getPaymentIntentObject();
                response = setAction(response, pi);
            }

            logger.info("Created a subscription " + sub.getId());
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * List plans
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/list-plans", method = RequestMethod.POST)
    public ResponseEntity<String> listPlansRequest (
            @RequestBody String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

            Map<String, Object> conditions = new HashMap<>();
            conditions.put("limit", 20);
            conditions.put("active", true);
            PlanCollection planCollection = Plan.list(conditions);
            List<Plan> plans = planCollection.getData();

            response.setApiResponse(plans);
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Retrieved a list of plans.");

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }


    /**
     * List tax_rates
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/list-taxrates", method = RequestMethod.POST)
    public ResponseEntity<String> listTaxRatesRequest (
            @RequestBody String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

            Map<String, Object> conditions = new HashMap<>();
            conditions.put("limit", 100);
            TaxRateCollection taxRateCollection = TaxRate.list(conditions);
            List<TaxRate> taxRates = taxRateCollection.getData();

            response.setApiResponse(taxRates);
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Retrieved a list of tax_rates.");

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create a tax rate
     * @param data
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/create-taxrate", method = RequestMethod.POST)
    public ResponseEntity<String> createTaxrateRequest (
            @RequestBody String data,
            @RequestParam (value="accountName") String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            TaxRate taxRate = TaxRate.create(paramMap);

            response.setApiResponse(taxRate.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Successful created a tax_rate: " + taxRate.getId());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * List coupons
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/list-coupons", method = RequestMethod.POST)
    public ResponseEntity<String> listCouponRequest (
            @RequestBody String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

            Map<String, Object> conditions = new HashMap<>();
            conditions.put("limit", 100);
            CouponCollection couponCollection = Coupon.list(conditions);
            List<Coupon> coupons = couponCollection.getData();

            response.setApiResponse(coupons);
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Retrieved a list of coupons.");

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create a coupon
     * @param data
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/create-coupon", method = RequestMethod.POST)
    public ResponseEntity<String> createCouponRequest (
            @RequestBody String data,
            @RequestParam (value="accountName") String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Coupon coupon = Coupon.create(paramMap);

            response.setApiResponse(coupon.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Successfully created a coupon: " + coupon.getId());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /*=======================================================================*/
    /*==============================   CORE   ===============================*/
    /*=======================================================================*/

    /**
     * List customers
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/list-customers", method = RequestMethod.POST)
    public ResponseEntity<String> listCustomersRequest (
            @RequestBody String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

            Map<String, Object> conditions = new HashMap<>();
            conditions.put("limit", 20);
            CustomerCollection customerCollection = Customer.list(conditions);
            List<Customer> customers = customerCollection.getData();
            /*
            List<CustomerWithPM> pyCustomers = new ArrayList<>();
            Iterator<Customer> it = customers.iterator();
            while (it.hasNext()){

                Customer customer = it.next();
                String id = customer.getId();
                CustomerWithPM customerWithPM = new CustomerWithPM();
                customerWithPM.setCustomer(customer);
                if (customer.getSources().getData().isEmpty()){
                    Map<String, Object> paramMap = new HashMap<>();
                    paramMap.put("customer", id);
                    paramMap.put("type", "card");
                    PaymentMethodCollection paymentMethodCollection = PaymentMethod.list(paramMap);
                    if (!paymentMethodCollection.getData().isEmpty()){
                        customerWithPM.setHas_pm(true);
                        //customerWithPM.setDefault_pm(paymentMethodCollection.getData());
                    }
                }
                pyCustomers.add(customerWithPM);
            }
*/
            response.setApiResponse(customers);
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Retrieved a list of customers.");

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create a customer
     * @param data
     * @param accountName
     * @return
     */
    @RequestMapping(value = "/create-customer", method = RequestMethod.POST)
    public ResponseEntity<String> createCustomerRequest (
            @RequestBody String data,
            @RequestParam (value="accountName") String accountName) {

        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);

            // check if it has "pm" map
            PaymentMethod pm = null;
            if (paramMap.containsKey("pm")){
                Map<String,Object> pmMap = (Map<String, Object>) paramMap.get("pm");
                pm = PaymentMethod.create(pmMap);
                paramMap.remove("pm");
                if (pm != null){
                    paramMap.put("payment_method", pm.getId());
                    Map<String,Object> invMap = new HashMap<>();
                    invMap.put("default_payment_method", pm.getId());
                    paramMap.put("invoice_settings", invMap);
                }
            }

            Customer customer = Customer.create(paramMap);
            response.setApiResponse(customer.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Successfully created a customer: " + customer.getId());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }


    /*=======================================================================*/
    /*=============================   CONNECT   =============================*/
    /*=======================================================================*/

    @RequestMapping(value = "/account-return", method = RequestMethod.GET)
    public String showAccountReturnView(
            @RequestParam(value = "code", required=false) String code,
            @RequestParam(value = "status", required=false) String status,
            Model model){

        model.addAttribute("code", code);
        model.addAttribute("status", status);
        returnCode = code;
        returnStatus = status;
        return "connect/account-return";
    }

    @RequestMapping(value = "/account/return")
    public void handleAccountReturn(HttpServletResponse response) {

        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("utf-8");

        PrintWriter writer;
        try {
            writer = response.getWriter();
            if (returnCode != null){
                writer.println("data: " + returnCode + "\n");
                returnCode = null;
            } else if (returnStatus != null){
                writer.println("data: " + returnStatus + "\n");
                returnStatus = null;
            } else {
                //writer.println("data: null" + "\n");
            }
            writer.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Request access token
     * @param jsonData
     * @return
     */
    @RequestMapping(value = "/account/request-token", method = RequestMethod.POST)
    public ResponseEntity<String> requestAccessToken (
            @RequestBody String jsonData) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String, Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            TokenResponse tokenResponse = OAuth.token(paramMap, null);

            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));
            logger.info("OAuth request token succeed - account_id: " + tokenResponse.getStripeUserId());

            response.setApiResponse(tokenResponse.toJson());

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Show connect account view
     * @param model
     * @return
     */
    @RequestMapping(value = "/connect-account", method = RequestMethod.GET)
    public String showAccountView(Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);
        model.addAttribute("country", Constants.STRIPE_COUNTRY_LIST);

        return Constants.CREATE_CONNECT_ACCOUNT_VIEW;
    }


    /**
     * Retrieve account details
     * @param accountId
     * @param data
     * @return response
     */
    @RequestMapping(value = "/account/{accountId}", method = RequestMethod.POST)
    public ResponseEntity<String> retrieveAccountDetailsRequest (
            @PathVariable(value="accountId") String accountId,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(data);
            Account account = Account.retrieve(accountId);

            logger.info("Retrieved account details for " + accountId);
            response.setApiResponse(account);

        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Get Country spec
     * @param countryId
     * @param data
     * @return
     */
    @RequestMapping(value = "/country/{countryId}", method = RequestMethod.POST)
    public ResponseEntity<String> retrieveCountrySpec (
            @PathVariable(value="countryId") String countryId,
            @RequestBody String data) {

        PlaygroundResponse response = new PlaygroundResponse();

        try {
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(data);
            CountrySpec countrySpec = CountrySpec.retrieve(countryId);

            logger.info("Retrieved country spec details for " + countryId);
            response.setApiResponse(countrySpec);

        } catch (Exception e) {
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }
        return ResponseEntity.ok().body(response.toJSON());
    }


    /**
     * Create a custom account
     * @param data
     * @return
     */
    @RequestMapping(value = "/create-account", method = RequestMethod.POST)
    public ResponseEntity<String> createCustomAccountRequest (
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            Account account = Account.create(paramMap);
            response.setApiResponse(account.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Created a custom account " + account.getId());
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }


    /**
     * Update a custom account
     * @param accountId
     * @param data
     * @return
     */
    @RequestMapping(value = "/{accountId}/update", method = RequestMethod.POST)
    public ResponseEntity<String> updateCustomAccountRequest (
            @PathVariable(value="accountId") String accountId,
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");
            paramMap.remove("type");
            paramMap.remove("tos_acceptance");

            Account account = Account.retrieve(accountId).update(paramMap);

            response.setApiResponse(account.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Custom account " + account.getId() + " is updated");
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

    /**
     * Create a custom account
     * @param data
     * @return
     */
    @RequestMapping(value = "/create-accountlink", method = RequestMethod.POST)
    public ResponseEntity<String> createCustomAccountLinkRequest (
            @RequestBody String data) {
        PlaygroundResponse response = new PlaygroundResponse();
        boolean isError = false;

        try {
            // Convert a JSON object to a request Map and init Stripe Key
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(data);
            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            AccountLink accountLink = AccountLink.create(paramMap);
            response.setApiResponse(accountLink.toJson());
            response.setCode(ResponseCode.SUCCESS);
            response.setAction(new ResponseAction(ActionCode.SUCCESS, null));

            logger.info("Created an account link: " + accountLink.getUrl());
        } catch (Exception e) {
            isError = true;
            logger.error(e.getMessage());
            response = StripeDemoUtil.setException(response, e);
        }

        if (isError){
            return ResponseEntity.badRequest().body(response.toJSON());
        } else {
            return ResponseEntity.ok().body(response.toJSON());
        }
    }

}
