package stripe.api.playground.controller;

import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.model.*;
import stripe.api.playground.service.PaymentServ;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.StripeDemoUtil;

/**
 * User: chenma
 * Date: 2019-01-02
 */

@RequestMapping
@Controller
public class PaymentController {

    private static final Logger logger = Logger.getLogger(PaymentController.class);

    @RequestMapping(value = "getAccount", method = RequestMethod.GET)
    @ResponseBody
    public AccountProperties getPublishKey(
            @RequestParam(value="acctName", required=false) String accountName,
            Model model){

        AccountProperties accountProperties = StripeDemoUtil.getAccountPropertiesFromName(accountName);
        return accountProperties;
    }


    /**
     * Show PaymentIntent page
     * @param model
     * @return
     */
    @RequestMapping(value = "paymentintent", method = RequestMethod.GET)
    public String showPaymentIntentView(Model model){

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
        model.addAttribute("piReq", new PaymentIntentReq());

        return Constants.PAYMENT_INTENT_VIEW;
    }

    /**
     * Create a PaymentIntent
     * @param piReq
     * @param accountName
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/paymentintent", method = RequestMethod.POST)
    public String createPaymentIntentRequest (
            @ModelAttribute("piReq") PaymentIntentReq piReq,
            @ModelAttribute("accountName") String accountName,
            BindingResult result, Model model){

        // initialise viewObj
        ViewObject viewObject = new ViewObject(
                StripeDemoUtil.getAccountPropertiesFromName(accountName),
                StripeDemoUtil.getAccountPropertyCollections(),
                true,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);

        // create PI request API call
        if (StripeDemoUtil.isNotEmpty(accountName)){
            try {
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
                PaymentServ paymentServ = new PaymentServ(apiKey);
                PaymentIntent paymentIntent = paymentServ.createPaymentIntent(piReq);
                viewObject.setResponse(paymentIntent);
            } catch (StripeException e) {
                logger.error(e.getMessage());
                viewObject.setHasError(true);
                viewObject.setError(new StripeDemoError(e.getRequestId(), "Create PaymentIntent", e.getMessage(), "Create PaymentIntent", e.getCode()));
            }
        } else {
            // return error when accountName is empty
            logger.error("Can not create PaymentIntent because the account is not selected");
            viewObject.setHasError(true);
            viewObject.setError(new StripeDemoError(null, "Create PaymentIntent", "Can not create PaymentIntent because the account is not selected", "createPI", null));
        }

        return Constants.PAYMENT_INTENT_VIEW;
    }

    /**
     * Retrieve a PaymentIntent
     * @param id
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/retrieve-paymentintent", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> retrievePaymentIntent (
            @ModelAttribute("pi") String id,
            BindingResult result, Model model) {

        PaymentServ paymentServ = new PaymentServ();
        PaymentIntent paymentIntent = null;
        PlaygroundResponse response = new PlaygroundResponse();
        try {
            paymentIntent = paymentServ.retrievePaymentIntent(id);
            response.setBody(paymentIntent);

        } catch (StripeException e) {
            logger.error(e.getMessage());
            response.setError(true);
            response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));
        }
        return ResponseEntity.ok().body(response.toJSON());
    }

}
