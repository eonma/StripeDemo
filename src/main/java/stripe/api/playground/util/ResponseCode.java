package stripe.api.playground.util;

/**
 * User: chenma
 * Date: 2019-04-16
 */

public enum ResponseCode {


    SUCCESS(100),
    SUCCESS_PROCESSING (101),
    SUCCESS_CANCELED (102),
    SUCCESS_TRIALING (103),
    REQUIRE_ACTION(300),
    ERROR(400);

    private final int value;

    ResponseCode(int value) {
        this.value = value;
    }

    public int value() {
        return this.value;
    }

}
