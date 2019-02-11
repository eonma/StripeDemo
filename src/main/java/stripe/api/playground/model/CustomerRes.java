package stripe.api.playground.model;

import com.stripe.model.Source;
import com.stripe.model.Subscription;
import stripe.api.playground.util.JSONFormatter;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-01-15
 */

public class CustomerRes {

    private String id;
    private String description;
    private List<String> sources;
    private List<String> sourceTypes;
    private List<String> subscriptions;
    private String created;
    private String defaultSource;

    public CustomerRes() {
    }

    public CustomerRes(String id, String description, List<String> sources, List<String> sourceTypes, List<String> subscriptions, String created, String defaultSource) {
        this.id = id;
        this.description = description;
        this.sources = sources;
        this.sourceTypes = sourceTypes;
        this.subscriptions = subscriptions;
        this.created = created;
        this.defaultSource = defaultSource;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getSources() {
        return sources;
    }

    public void setSources(List<String> sources) {
        this.sources = sources;
    }

    public List<String> getSourceTypes() {
        return sourceTypes;
    }

    public void setSourceTypes(List<String> sourceTypes) {
        this.sourceTypes = sourceTypes;
    }

    public List<String> getSubscriptions() {
        return subscriptions;
    }

    public void setSubscriptions(List<String> subscriptions) {
        this.subscriptions = subscriptions;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getDefaultSource() {
        return defaultSource;
    }

    public void setDefaultSource(String defaultSource) {
        this.defaultSource = defaultSource;
    }

    public String toJSON() {
        return JSONFormatter.toJSON(this);
    }
}
