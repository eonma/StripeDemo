package stripe.api.playground.model;

import stripe.api.playground.util.JSONFormatter;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-28
 */

public class CountrySpecCollection {

    private List<CountrySpec> countrySpecList;

    public CountrySpecCollection() {
    }

    public CountrySpecCollection(List<CountrySpec> countrySpecList) {
        this.countrySpecList = countrySpecList;
    }

    public List<CountrySpec> getCountrySpecList() {
        return countrySpecList;
    }

    public void setCountrySpecList(List<CountrySpec> countrySpecList) {
        this.countrySpecList = countrySpecList;
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
