package stripe.api.playground.model;

/**
 * User: chenma
 * Date: 2019-01-30
 */

public class Account {

    private String name;
    private String secretKey;
    private String publishKey;

    public Account() {
    }

    public Account(String secretKey, String publishKey, String name) {
        this.name = name;
        this.secretKey = secretKey;
        this.publishKey = publishKey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getPublishKey() {
        return publishKey;
    }

    public void setPublishKey(String publishKey) {
        this.publishKey = publishKey;
    }
}
