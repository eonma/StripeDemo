package stripe.api.playground.config.properties;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class AccountProperties {



    private String accountName;
    private String accountPublishKey;
    private String accountSecretKey;

    public AccountProperties() {
    }

    public AccountProperties(String accountName, String accountPublishKey, String accountSecretKey) {
        this.accountName = accountName;
        this.accountPublishKey = accountPublishKey;
        this.accountSecretKey = accountSecretKey;
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
}
