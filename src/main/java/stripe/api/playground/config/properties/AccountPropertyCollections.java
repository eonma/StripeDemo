package stripe.api.playground.config.properties;

import stripe.api.playground.util.JSONFormatter;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class AccountPropertyCollections {

    private List<AccountProperties> accountPropertiesList;

    public List<AccountProperties> getAccountPropertiesList() {
        return accountPropertiesList;
    }

    public void setAccountPropertiesList(List<AccountProperties> accountPropertiesList) {
        this.accountPropertiesList = accountPropertiesList;
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
