package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-01
 */

public class SubscriptionReq {

    private String customer;
    private String application_fee_percent;
    private String billing;
    private String billing_cycle_anchor;
    private Boolean cancel_at_period_end;
    private String coupon;
    private String days_until_due;
    private List<Item> items;
    private Boolean prorate;
    private String tax_percent;
    private String trial_period_days;
    private Boolean trial_from_plan;

    public SubscriptionReq() {
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getApplication_fee_percent() {
        return application_fee_percent;
    }

    public void setApplication_fee_percent(String application_fee_percent) {
        this.application_fee_percent = application_fee_percent;
    }

    public String getBilling() {
        return billing;
    }

    public void setBilling(String billing) {
        this.billing = billing;
    }

    public String getBilling_cycle_anchor() {
        return billing_cycle_anchor;
    }

    public void setBilling_cycle_anchor(String billing_cycle_anchor) {
        this.billing_cycle_anchor = billing_cycle_anchor;
    }

    public Boolean getCancel_at_period_end() {
        return cancel_at_period_end;
    }

    public void setCancel_at_period_end(Boolean cancel_at_period_end) {
        this.cancel_at_period_end = cancel_at_period_end;
    }

    public String getCoupon() {
        return coupon;
    }

    public void setCoupon(String coupon) {
        this.coupon = coupon;
    }

    public String getDays_until_due() {
        return days_until_due;
    }

    public void setDays_until_due(String days_until_due) {
        this.days_until_due = days_until_due;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Boolean getProrate() {
        return prorate;
    }

    public void setProrate(Boolean prorate) {
        this.prorate = prorate;
    }

    public String getTax_percent() {
        return tax_percent;
    }

    public void setTax_percent(String tax_percent) {
        this.tax_percent = tax_percent;
    }

    public String getTrial_period_days() {
        return trial_period_days;
    }

    public void setTrial_period_days(String trial_period_days) {
        this.trial_period_days = trial_period_days;
    }

    public Boolean getTrial_from_plan() {
        return trial_from_plan;
    }

    public void setTrial_from_plan(Boolean trial_from_plan) {
        this.trial_from_plan = trial_from_plan;
    }

    public static class Item {
        String plan;
        String quantity;

        public Item() {
        }

        public Item(String plan, String quantity) {
            this.plan = plan;
            this.quantity = quantity;
        }

        public String getPlan() {
            return plan;
        }

        public void setPlan(String plan) {
            this.plan = plan;
        }

        public String getQuantity() {
            return quantity;
        }

        public void setQuantity(String quantity) {
            this.quantity = quantity;
        }
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
