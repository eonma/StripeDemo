package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-03-22
 */

public class RefundReq {

    private String id;
    private String charge;
    private String amount;
    private String reason;
    private Boolean refund_application_fee;
    private Boolean reverse_transfer;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Boolean getRefund_application_fee() {
        return refund_application_fee;
    }

    public void setRefund_application_fee(Boolean refund_application_fee) {
        this.refund_application_fee = refund_application_fee;
    }

    public Boolean getReverse_transfer() {
        return reverse_transfer;
    }

    public void setReverse_transfer(Boolean reverse_transfer) {
        this.reverse_transfer = reverse_transfer;
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
