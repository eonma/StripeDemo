package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-01-31
 */

public class PlanReq {

    private String currency;
    private String interval;
    private String product;
    private String aggregate_usage;
    private String amount;
    private String billing_scheme;
    private String interval_count;
    private String nickname;
    private List<Tier> tiers;
    private String tiers_mode;
    private TransformUsage transform_usage;
    private String trial_period_days;
    private String usage_type;

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getInterval() {
        return interval;
    }

    public void setInterval(String interval) {
        this.interval = interval;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getAggregate_usage() {
        return aggregate_usage;
    }

    public void setAggregate_usage(String aggregate_usage) {
        this.aggregate_usage = aggregate_usage;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getBilling_scheme() {
        return billing_scheme;
    }

    public void setBilling_scheme(String billing_scheme) {
        this.billing_scheme = billing_scheme;
    }

    public String getInterval_count() {
        return interval_count;
    }

    public void setInterval_count(String interval_count) {
        this.interval_count = interval_count;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public List<Tier> getTiers() {
        return tiers;
    }

    public void setTiers(List<Tier> tiers) {
        this.tiers = tiers;
    }

    public String getTiers_mode() {
        return tiers_mode;
    }

    public void setTiers_mode(String tiers_mode) {
        this.tiers_mode = tiers_mode;
    }

    public TransformUsage getTransform_usage() {
        return transform_usage;
    }

    public void setTransform_usage(TransformUsage transform_usage) {
        this.transform_usage = transform_usage;
    }

    public String getTrial_period_days() {
        return trial_period_days;
    }

    public void setTrial_period_days(String trial_period_days) {
        this.trial_period_days = trial_period_days;
    }

    public String getUsage_type() {
        return usage_type;
    }

    public void setUsage_type(String usage_type) {
        this.usage_type = usage_type;
    }

    public static class Tier{
        String up_to;
        String unit_amount;

        public String getUp_to() {
            return up_to;
        }

        public void setUp_to(String up_to) {
            this.up_to = up_to;
        }

        public String getUnit_amount() {
            return unit_amount;
        }

        public void setUnit_amount(String unit_amount) {
            this.unit_amount = unit_amount;
        }
    }

    public static class TransformUsage{
        String divide_by;
        String round;

        public String getDivide_by() {
            return divide_by;
        }

        public void setDivide_by(String divide_by) {
            this.divide_by = divide_by;
        }

        public String getRound() {
            return round;
        }

        public void setRound(String round) {
            this.round = round;
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
