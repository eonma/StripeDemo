package stripe.api.playground.service;

import org.springframework.context.annotation.PropertySource;
import stripe.api.playground.model.StripeAccount;

/**
 * User: chenma
 * Date: 2019-02-06
 */

@PropertySource("classpath:/WEB-INF/properties/config.properties")
public class AccountServ {

    public StripeAccount getAccount(){

        StripeAccount stripeAccount = new StripeAccount();

        // TODO retrieve Stripe Account details.


        return stripeAccount;
    }

    /**
     * Retrieve Stripe Account details from a property file
     * @return
     */
    private StripeAccount retrieveAccountFromFile(){
        StripeAccount stripeAccount = new StripeAccount();

        return stripeAccount;
    }


    /**
     * Retrieve Stripe Account details from database
     * @return
     */
    private StripeAccount retrieveAccountFromDB(){
        StripeAccount stripeAccount = new StripeAccount();

        return stripeAccount;
    }
}
