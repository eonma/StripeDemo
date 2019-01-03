package stripe.api.playground.service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import stripe.api.playground.dao.ChargeDao;

import java.util.HashMap;
import java.util.Map;

/**
 * User: chenma
 * Date: 2019-01-03
 */

public class PaymentService {

    public Charge createCharge(ChargeDao chargeDao) throws StripeException {
        Stripe.apiKey = "sk_test_4eC39HqLyjWDarjtT1zdp7dc";

        Map<String, Object> chargeParam = new HashMap<String, Object>();
        Charge charge = Charge.create(chargeParam);
        return charge;
    }
}
