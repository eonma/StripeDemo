package stripe.api.playground.model;

import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.util.JSONFormatter;

/**
 * User: chenma
 * Date: 2019-02-20
 */

public class ViewObject {

    private AccountProperties currentAccount;
    private AccountPropertyCollections allAccounts;
    private Boolean hasResponse;
    private Object response;
    private Boolean hasError;
    private StripeDemoError error;

    public ViewObject() {
    }

    public ViewObject(AccountProperties currentAccount, AccountPropertyCollections allAccounts) {
        this.currentAccount = currentAccount;
        this.allAccounts = allAccounts;
    }

    public ViewObject(AccountProperties currentAccount, AccountPropertyCollections allAccounts, Boolean hasResponse, Object response, Boolean hasError, StripeDemoError error) {
        this.currentAccount = currentAccount;
        this.allAccounts = allAccounts;
        this.hasResponse = hasResponse;
        this.response = response;
        this.hasError = hasError;
        this.error = error;
    }

    public AccountProperties getCurrentAccount() {
        return currentAccount;
    }

    public void setCurrentAccount(AccountProperties currentAccount) {
        this.currentAccount = currentAccount;
    }

    public AccountPropertyCollections getAllAccounts() {
        return allAccounts;
    }

    public void setAllAccounts(AccountPropertyCollections allAccounts) {
        this.allAccounts = allAccounts;
    }

    public Boolean getHasResponse() {
        return hasResponse;
    }

    public void setHasResponse(Boolean hasResponse) {
        this.hasResponse = hasResponse;
    }

    public Object getResponse() {
        return response;
    }

    public void setResponse(Object response) {
        this.response = response;
    }

    public Boolean getHasError() {
        return hasError;
    }

    public void setHasError(Boolean hasError) {
        this.hasError = hasError;
    }

    public StripeDemoError getError() {
        return error;
    }

    public void setError(StripeDemoError error) {
        this.error = error;
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
