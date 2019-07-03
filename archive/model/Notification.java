package stripe.api.playground.model;

/**
 * User: chenma
 * Date: 2019-02-19
 */

public class Notification {

    private String title;
    private String message;
    private String event;

    public Notification() {
    }

    public Notification(String title, String message, String event) {
        this.title = title;
        this.message = message;
        this.event = event;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }
}
