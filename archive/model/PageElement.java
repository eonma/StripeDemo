package stripe.api.playground.model;

/**
 * User: chenma
 * Date: 2019-01-08
 */

public class PageElement {

    private String publishKey;
    private Boolean isResponse;
    private Boolean isConnect;
    private Boolean isError;

    public PageElement() {
    }

    public PageElement(String publishKey, Boolean isResponse, Boolean isConnect, Boolean isError) {
        this.publishKey = publishKey;
        this.isResponse = isResponse;
        this.isConnect = isConnect;
        this.isError = isError;
    }

    public String getPublishKey() {
        return publishKey;
    }

    public void setPublishKey(String publishKey) {
        this.publishKey = publishKey;
    }

    public Boolean getResponse() {
        return isResponse;
    }

    public void setResponse(Boolean response) {
        isResponse = response;
    }

    public Boolean getConnect() {
        return isConnect;
    }

    public void setConnect(Boolean connect) {
        isConnect = connect;
    }

    public Boolean getError() {
        return isError;
    }

    public void setError(Boolean error) {
        isError = error;
    }
}
