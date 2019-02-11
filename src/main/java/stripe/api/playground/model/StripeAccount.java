package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-02-06
 */

public class StripeAccount {
    private String publish_key;
    private String secret_key;
    private String account_name;

    public String getPublish_key() {
        return publish_key;
    }

    public void setPublish_key(String publish_key) {
        this.publish_key = publish_key;
    }

    public String getSecret_key() {
        return secret_key;
    }

    public void setSecret_key(String secret_key) {
        this.secret_key = secret_key;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
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
