package stripe.api.playground.model;

import stripe.api.playground.util.ActionCode;

/**
 * User: chenma
 * Date: 2019-04-18
 */

public class ResponseAction {

    private ActionCode code;
    private Object body;

    public ResponseAction() {
    }

    public ResponseAction(ActionCode code, Object body) {
        this.code = code;
        this.body = body;
    }

    public ActionCode getCode() {
        return code;
    }

    public void setCode(ActionCode code) {
        this.code = code;
    }

    public Object getBody() {
        return body;
    }

    public void setBody(Object body) {
        this.body = body;
    }
}
