package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-04-08
 */

public class TransferReq {

    private String amount;
    private String currency;
    private String destination;
    private String description;
    private String source_transaction;
    private String source_type;
    private String transfer_group;

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSource_transaction() {
        return source_transaction;
    }

    public void setSource_transaction(String source_transaction) {
        this.source_transaction = source_transaction;
    }

    public String getSource_type() {
        return source_type;
    }

    public void setSource_type(String source_type) {
        this.source_type = source_type;
    }

    public String getTransfer_group() {
        return transfer_group;
    }

    public void setTransfer_group(String transfer_group) {
        this.transfer_group = transfer_group;
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
