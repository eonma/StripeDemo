package stripe.api.playground.service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Account;
import com.stripe.model.Person;
import org.apache.log4j.Logger;
import stripe.api.playground.model.AccountReq;
import stripe.api.playground.model.PersonReq;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.StripeDemoUtil;

import java.util.Iterator;
import java.util.Map;

/**
 * User: chenma
 * Date: 2019-02-28
 */

public class ConnectServ {

    private static final Logger logger = Logger.getLogger(ConnectServ.class);
    private String apiKey;

    public ConnectServ(String apiKey) {
        this.apiKey = apiKey;
        Stripe.apiKey = apiKey;
        //Stripe.apiVersion = Constants.STRIPE_API_VERSION;
    }




    public Account createCustomAccount(AccountReq accountReq) throws StripeException {
        //Account account = new Account();

        Map<String, Object> reqParams = StripeDemoUtil.convertObjToMap(accountReq);

        //reqParams = removeEmpty(reqParams);

        Account account = Account.create(reqParams);

        String requestId = account.getLastResponse().requestId();
        logger.debug("Request ID: " + requestId);
        return account;
    }

    public Account updateCustomAccount(AccountReq accountReq, String accountId) throws StripeException {
        Map<String, Object> reqParams = StripeDemoUtil.convertObjToMap(accountReq);

        Account account = Account.retrieve(accountId, null);
        if (account != null){
            account = account.update(reqParams);
        }
        return account;
    }

    public Person createPerson(PersonReq personReq, String accountId) throws StripeException {
        Map<String, Object> reqParams = StripeDemoUtil.convertObjToMap(personReq);

        Account account = Account.retrieve(accountId, null);
        Person person = null;
        if (account != null){
            person = account.persons().create(reqParams);
        }
        return person;

    }


}
