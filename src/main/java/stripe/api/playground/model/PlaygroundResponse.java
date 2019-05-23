package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;
import stripe.api.playground.util.ResponseCode;

/**
 * User: chenma
 * Date: 2019-01-14
 */

public class PlaygroundResponse {

    private Boolean error;
    private Object body;

    private ResponseCode code;
    private ResponseAction action;
    private Object apiResponse;

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public Object getBody() {
        return body;
    }

    public void setBody(Object body) {
        this.body = body;
    }

    public ResponseCode getCode() {
        return code;
    }

    public void setCode(ResponseCode code) {
        this.code = code;
    }

    public ResponseAction getAction() {
        return action;
    }

    public void setAction(ResponseAction action) {
        this.action = action;
    }

    public Object getApiResponse() {
        return apiResponse;
    }

    public void setApiResponse(Object apiResponse) {
        this.apiResponse = apiResponse;
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
