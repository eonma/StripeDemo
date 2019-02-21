package stripe.api.playground.model;

import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-02-06
 */

public class StripeAccount {
    private AccountProperties accountProperties;

    public AccountProperties getAccountProperties() {
        return accountProperties;
    }

    public void setAccountProperties(AccountProperties accountProperties) {
        this.accountProperties = accountProperties;
    }

    /**
     * Returns a JSON string corresponding to object state
     *
     * @return JSON representation
     */
    public String toJSON() {
        return JSONFormatter.toJSON(this);
    }
}
