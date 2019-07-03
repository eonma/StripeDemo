package stripe.api.playground.dao;

import java.util.Map;

/**
 * User: chenma
 * Date: 2019-01-03
 */

public class ChargeDao {

    private int amount;
    private String currency;
    private int applicationFee;
    private boolean capture;
    private String customer;
    private String description;
    private Map<String, Object> destination;
    private Map<String, Object> metadata;
    private String onBehalfOf;
    private String receiptEmail;
    private Map<String, Object> shipping;
    private Map<String, Object> address;
    private String source;
    private String statementDescriptor;
    private String transferGroup;

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public int getApplicationFee() {
        return applicationFee;
    }

    public void setApplicationFee(int applicationFee) {
        this.applicationFee = applicationFee;
    }

    public boolean isCapture() {
        return capture;
    }

    public void setCapture(boolean capture) {
        this.capture = capture;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Map<String, Object> getDestination() {
        return destination;
    }

    public void setDestination(Map<String, Object> destination) {
        this.destination = destination;
    }

    public Map<String, Object> getMetadata() {
        return metadata;
    }

    public void setMetadata(Map<String, Object> metadata) {
        this.metadata = metadata;
    }

    public String getOnBehalfOf() {
        return onBehalfOf;
    }

    public void setOnBehalfOf(String onBehalfOf) {
        this.onBehalfOf = onBehalfOf;
    }

    public String getReceiptEmail() {
        return receiptEmail;
    }

    public void setReceiptEmail(String receiptEmail) {
        this.receiptEmail = receiptEmail;
    }

    public Map<String, Object> getShipping() {
        return shipping;
    }

    public void setShipping(Map<String, Object> shipping) {
        this.shipping = shipping;
    }

    public Map<String, Object> getAddress() {
        return address;
    }

    public void setAddress(Map<String, Object> address) {
        this.address = address;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getStatementDescriptor() {
        return statementDescriptor;
    }

    public void setStatementDescriptor(String statementDescriptor) {
        this.statementDescriptor = statementDescriptor;
    }

    public String getTransferGroup() {
        return transferGroup;
    }

    public void setTransferGroup(String transferGroup) {
        this.transferGroup = transferGroup;
    }

}
