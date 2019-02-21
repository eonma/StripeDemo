package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

import java.util.Map;

/**
 * User: chenma
 * Date: 2019-01-09
 */

public class PaymentIntentReq {

    private String allowed_source_types;
    private String amount;
    private String currency;
    private String application_fee_amount;
    private String capture_method;
    private String customer;
    private String description;
    private String[] metadata;
    private String on_behalf_of;
    private String receipt_email;
    private String return_url;
    private Boolean save_source_to_customer;
    private Shipping shipping;
    private String source;
    private String statement_descriptor;
    private Map<String, Object> transfer_data;
    private String transfer_group;
    private String payment_method_types;
    private Boolean save_payment_method;

    public String getAllowed_source_types() {
        return allowed_source_types;
    }

    public void setAllowed_source_types(String allowed_source_types) {
        this.allowed_source_types = allowed_source_types;
    }

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

    public String getApplication_fee_amount() {
        return application_fee_amount;
    }

    public void setApplication_fee_amount(String application_fee_amount) {
        this.application_fee_amount = application_fee_amount;
    }

    public String getCapture_method() {
        return capture_method;
    }

    public void setCapture_method(String capture_method) {
        this.capture_method = capture_method;
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

    public String[] getMetadata() {
        return metadata;
    }

    public void setMetadata(String[] metadata) {
        this.metadata = metadata;
    }

    public String getOn_behalf_of() {
        return on_behalf_of;
    }

    public void setOn_behalf_of(String on_behalf_of) {
        this.on_behalf_of = on_behalf_of;
    }

    public String getReceipt_email() {
        return receipt_email;
    }

    public void setReceipt_email(String receipt_email) {
        this.receipt_email = receipt_email;
    }

    public String getReturn_url() {
        return return_url;
    }

    public void setReturn_url(String return_url) {
        this.return_url = return_url;
    }

    public Boolean getSave_source_to_customer() {
        return save_source_to_customer;
    }

    public void setSave_source_to_customer(Boolean save_source_to_customer) {
        this.save_source_to_customer = save_source_to_customer;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getStatement_descriptor() {
        return statement_descriptor;
    }

    public void setStatement_descriptor(String statement_descriptor) {
        this.statement_descriptor = statement_descriptor;
    }

    public Map<String, Object> getTransfer_data() {
        return transfer_data;
    }

    public void setTransfer_data(Map<String, Object> transfer_data) {
        this.transfer_data = transfer_data;
    }

    public String getTransfer_group() {
        return transfer_group;
    }

    public void setTransfer_group(String transfer_group) {
        this.transfer_group = transfer_group;
    }

    public String getPayment_method_types() {
        return payment_method_types;
    }

    public void setPayment_method_types(String payment_method_types) {
        this.payment_method_types = payment_method_types;
    }

    public Boolean getSave_payment_method() {
        return save_payment_method;
    }

    public void setSave_payment_method(Boolean save_payment_method) {
        this.save_payment_method = save_payment_method;
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
