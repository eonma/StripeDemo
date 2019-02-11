package stripe.api.playground.controller;

import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.model.PageElement;
import stripe.api.playground.model.PaymentIntentReq;
import stripe.api.playground.model.PlaygroundResponse;
import stripe.api.playground.model.RequestError;
import stripe.api.playground.service.PaymentServ;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.Properties;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * User: chenma
 * Date: 2019-01-02
 */

@RequestMapping
@Controller
public class PaymentController {

    private static final Logger logger = Logger.getLogger(PaymentController.class.getName());

/*

    @RequestMapping(value = "/create_charge", method = RequestMethod.GET)
    public String showCreateCharge (Model model){
        model.addAttribute("chargeParam", new ChargeDao());
        model.addAttribute("isConnect", false);
        model.addAttribute("isResponse", false);
        return "payments/charges";
    }

    @RequestMapping(value = "/create_charge", method = RequestMethod.POST)
    public String editTask(@ModelAttribute("chargeParam") ChargeDao chargeDao, BindingResult result, Model model){
        System.out.println(chargeDao.getAmount());
        System.out.println(chargeDao.getSource());


        return "payments/charges";

    }
*/

    /**
     * Show create PaymentIntent page
     * @param model
     * @return
     */
    @RequestMapping(value = "create-paymentintent", method = RequestMethod.GET)
    public String showCreatePaymentIntentView(Model model){

        PageElement pageElement = new PageElement(Constants.GB_PAYMENT_PK, false, false, false);

        List<String> accounts = new ArrayList<>();
        accounts.add("gb-payment");
        accounts.add("gb-billing");
        accounts.add("gb-connect");

        model.addAttribute(Constants.PAGE_ELEMENT, pageElement);
        model.addAttribute("piReq", new PaymentIntentReq());
        model.addAttribute("pi", new PaymentIntent());
        model.addAttribute("accounts", accounts);


        AccountPropertyCollections accountPropertyCollections = Properties.getAccountPropertyCollections();


        //System.out.println(accountProperties.getAccountName() + ": " + accountProperties.getAccountPublishKey() + " : " + accountProperties.getAccountSecretKey());

        return Constants.CREATE_PAYMENT_INTENT_VIEW;
    }

    /**
     * Create PaymentIntent post
     * @param piReq
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/create-paymentintent", method = RequestMethod.POST)
    public String createPaymentIntent (@ModelAttribute("piReq") PaymentIntentReq piReq, BindingResult result, Model model){

        // init page element
        PageElement pageElement = new PageElement(Constants.GB_PAYMENT_PK, true, false, false);

        try {
            PaymentServ paymentServ = new PaymentServ();
            PaymentIntent paymentIntent = paymentServ.createPaymentIntent(piReq);
            model.addAttribute("pi", paymentIntent);

        } catch (StripeException e) {
            e.printStackTrace();
            logger.severe("RequestID: " + e.getRequestId() + ", Error Code: " + e.getCode() + ", Error Message: " + e.getMessage());

            RequestError error = new RequestError(e.getRequestId(), e.getCode(), e.getMessage());
            pageElement.setError(true);
            model.addAttribute("error", error);
        }

        model.addAttribute(Constants.PAGE_ELEMENT, pageElement);

        return Constants.CREATE_PAYMENT_INTENT_VIEW;
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
    public ResponseEntity<String> retrievePaymentIntent (@ModelAttribute("pi") String id, BindingResult result, Model model) {

        PaymentServ paymentServ = new PaymentServ();
        PaymentIntent paymentIntent = null;
        PlaygroundResponse response = new PlaygroundResponse();
        try {
            paymentIntent = paymentServ.retrievePaymentIntent(id);
            response.setBody(paymentIntent);

        } catch (StripeException e) {
            logger.severe("RequestID: " + e.getRequestId() + ", Error Code: " + e.getCode() + ", Error Message: " + e.getMessage());

            response.setError(true);
            response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));

        }
        return ResponseEntity.ok().body(response.toJSON());
    }

}
