package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-01-11
 */

public class RequestError {

    private String requestId;
    private String code;
    private String message;

    public RequestError() {
    }

    public RequestError(String requestId, String code, String message) {
        this.requestId = requestId;
        this.code = code;
        this.message = message;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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
