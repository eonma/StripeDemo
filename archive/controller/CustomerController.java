package stripe.api.playground.controller;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stripe.api.playground.model.CustomerRes;
import stripe.api.playground.util.Constants;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

/**
 * User: chenma
 * Date: 2019-01-15
 */

@RequestMapping
@Controller
public class CustomerController {

    private static final Logger logger = Logger.getLogger(CustomerController.class.getName());

    @RequestMapping(value = "list-customer", method = RequestMethod.GET)
    public String showListCustomerView(Model model){

        /*CustomerCollection customerCollection = null;
        List<CustomerRes> customerResList = new ArrayList<>();

        //Stripe.apiKey = Constants.GB_PAYMENT_SK;
        try {
            customerCollection = CustomerWithPM.list(new HashMap<>());
        } catch (StripeException e) {
            e.printStackTrace();
        }

        List<CustomerWithPM> customers = customerCollection.getData();


        Iterator<CustomerWithPM> it = customers.iterator();
        while (it.hasNext()){
            CustomerWithPM customer = it.next();
            List<String> sources = new ArrayList<>();
            List<String> sourceTypes = new ArrayList<>();
            List<String> subscriptions = new ArrayList<>();

            List<ExternalAccount> externalAccounts = customer.getSources().getData();
            Iterator<ExternalAccount> itAccount = externalAccounts.iterator();
            while (itAccount.hasNext()){

                ExternalAccount ea = itAccount.next();
                if (ea instanceof Card){
                    Card card = (Card) ea;
                    sources.add(card.getId());
                    sourceTypes.add(card.getBrand() + " - " + card.getLast4());
                } else if (ea instanceof Source) {
                    Source source = (Source) ea;
                    sources.add(ea.getId());
                    sourceTypes.add(source.getTypeData().get("brand") + " - " + source.getTypeData().get("last4"));
                }
            }

            List<Subscription> subList = customer.getSubscriptions().getData();
            Iterator<Subscription> itSub = subList.iterator();
            while (itSub.hasNext()){
                Subscription subscription = itSub.next();
                subscriptions.add(subscription.getId() + " - " + subscription.getPlan().getId());
            }

            Long createTime = customer.getCreated();
            String created = new SimpleDateFormat("dd-MMM-yyyy").format(new Date(createTime));

            String defaultSource = customer.getDefaultSource();

            CustomerRes customerRes = new CustomerRes(customer.getId(), customer.getDescription(), sources, sourceTypes ,subscriptions, created, defaultSource);

            customerResList.add(customerRes);
        }

        model.addAttribute("customers", customerResList);
        System.out.println(customerResList);*/


        return Constants.LIST_CUSTOMER_VIEW ;
    }

    @RequestMapping(value = "/list-customer", method = RequestMethod.POST)
    public String createPaymentIntent (@ModelAttribute("customer") Customer customer, BindingResult result, Model model){



        return Constants.LIST_CUSTOMER_VIEW;
    }
}
