package stripe.api.playground.config.properties;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class AccountProperties {



    private String accountName;
    private String accountPublishKey;
    private String accountSecretKey;
    private String accountClientId;

    public AccountProperties() {
    }

    public AccountProperties(String accountName, String accountPublishKey, String accountSecretKey, String accountClientId) {
        this.accountName = accountName;
        this.accountPublishKey = accountPublishKey;
        this.accountSecretKey = accountSecretKey;
        this.accountClientId = accountClientId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountPublishKey() {
        return accountPublishKey;
    }

    public void setAccountPublishKey(String accountPublishKey) {
        this.accountPublishKey = accountPublishKey;
    }

    public String getAccountSecretKey() {
        return accountSecretKey;
    }

    public void setAccountSecretKey(String accountSecretKey) {
        this.accountSecretKey = accountSecretKey;
    }

    public String getAccountClientId() {
        return accountClientId;
    }

    public void setAccountClientId(String accountClientId) {
        this.accountClientId = accountClientId;
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
