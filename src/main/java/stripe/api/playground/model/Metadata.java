package stripe.api.playground.model;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-01-11
 */

public class Metadata {

    private String[] name;
    private String[] value;

    public String[] getName() {
        return name;
    }

    public void setName(String[] name) {
        this.name = name;
    }

    public String[] getValue() {
        return value;
    }

    public void setValue(String[] value) {
        this.value = value;
    }
}
