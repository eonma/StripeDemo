package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

import java.util.Map;

/**
 * User: chenma
 * Date: 2019-02-28
 */

public class CountrySpec {

    private String default_currency;
    private Map<String, String> currencyCountries;

    public CountrySpec() {
    }

    public String getDefault_currency() {
        return default_currency;
    }

    public void setDefault_currency(String default_currency) {
        this.default_currency = default_currency;
    }

    public Map<String, String> getCurrencyCountries() {
        return currencyCountries;
    }

    public void setCurrencyCountries(Map<String, String> currencyCountries) {
        this.currencyCountries = currencyCountries;
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
