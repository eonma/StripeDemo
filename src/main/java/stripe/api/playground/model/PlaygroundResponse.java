package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-01-14
 */

public class PlaygroundResponse {

    private Boolean error;
    private Object body;

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

    /**
     * Returns a JSON string corresponding to object state
     *
     * @return JSON representation
     */
    public String toJSON() {
        return JSONFormatter.toJSON(this);
    }
}
