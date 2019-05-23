package stripe.api.playground.controller;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.model.PlaygroundResponse;
import stripe.api.playground.model.RequestError;
import stripe.api.playground.model.ResponseAction;
import stripe.api.playground.model.ViewObject;
import stripe.api.playground.util.ActionCode;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.ResponseCode;
import stripe.api.playground.util.StripeDemoUtil;

import java.util.Map;

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

    /**
     * Get account property using the provided Stripe account name.
     * This method will be used mainly from the view
     *
     * Path = /getAccount
     *
     * @param accountName
     * @param model
     * @return accountProperties
     */
    @RequestMapping(value = "/getAccount", method = RequestMethod.GET)
    @ResponseBody
    public AccountProperties getAccountPropertyByName(
            @RequestParam(value="acctName", required=false) String accountName,
            Model model){

        AccountProperties accountProperties = StripeDemoUtil.getAccountPropertiesFromName(accountName);
        return accountProperties;
    }

    /**
     * Show PaymentIntent manual confirmation page
     *
     * Path = /payment_intent_manual
     *
     * @param model
     * @return payments/payment_intent_manual.jsp
     */
    @RequestMapping(value = "/payment_intent_manual", method = RequestMethod.GET)
    public String showPIManualView(Model model){

        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );
        model.addAttribute("viewObj", viewObject);
        return Constants.PAYMENT_INTENT_MANUAL_VIEW;
    }


    /**
     * Create PaymentIntent - manual confirmation
     *
     * Path = /payment_intent_manual
     *
     * @param jsonData
     * @param result
     * @param model
     * @return ResponseEntity
     */
    @RequestMapping(value = "/payment_intent_manual", method = RequestMethod.POST)
    public ResponseEntity<String> createPaymentIntentManualRequest (
            @RequestBody String jsonData,
            BindingResult result, Model model){

        PlaygroundResponse response = new PlaygroundResponse();

        try {
            Map<String,Object> paramMap = StripeDemoUtil.convertJsonToMap(jsonData);

            Stripe.apiKey = StripeDemoUtil.getAccountSecretKeyFromName(paramMap.get("accountName").toString());
            paramMap.remove("accountName");

            PaymentIntent pi = PaymentIntent.create(paramMap);
            response.setApiResponse(pi);

            // Process PaymentIntent response
            String piStatus = pi.getStatus();
            switch (piStatus){
                case "requires_payment_method":
                    response.setCode(ResponseCode.REQUIRE_ACTION);
                    response.setAction(new ResponseAction(ActionCode.REQUIRES_PAYMENT_METHOD, null));
                    break;
                case "requires_confirmation":
                    response.setCode(ResponseCode.REQUIRE_ACTION);
                    response.setAction(new ResponseAction(ActionCode.REQUIRES_CONFIRMATION, null));
                    break;
                case "requires_action":
                    response.setCode(ResponseCode.REQUIRE_ACTION);
                    String action = pi.getNextAction().getType();
                    switch (action){
                        case "redirect_to_url":
                            response.setAction(new ResponseAction(ActionCode.REDIRECT_TO_URL, pi.getNextAction().getRedirectToUrl().getUrl()));
                            break;
                        case "use_stripe_sdk":
                            response.setAction(new ResponseAction(ActionCode.USE_STRIPE_SDK, pi.getClientSecret()));
                            break;
                    }
                    break;
                case "processing":
                    response.setCode(ResponseCode.SUCCESS_PROCESSING);
                    break;
                case "requires_capture":
                    response.setCode(ResponseCode.REQUIRE_ACTION);
                    response.setAction(new ResponseAction(ActionCode.REQUIRES_CAPTURE, null));
                    break;
                case "canceled":
                    response.setCode(ResponseCode.SUCCESS_CANCELED);
                    break;
                case "succeeded":
                    response.setCode(ResponseCode.SUCCESS);
                    break;
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            response.setCode(ResponseCode.ERROR);
            if (e instanceof StripeException){
                response.setApiResponse(new RequestError(((StripeException) e).getRequestId(), ((StripeException) e).getCode(), e.getMessage()));
            } else {
                response.setApiResponse(new RequestError("", "", e.getMessage()));
            }
        }

        return ResponseEntity.ok().body(response.toJSON());

    }

}
