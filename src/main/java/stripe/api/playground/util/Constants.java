package stripe.api.playground.util;

/**
 * User: chenma
 * Date: 2018-12-20
 */
public class Constants {

    // API keys
    //public static final String GB_PAYMENT_PK = "pk_test_1xnx7cgl5GI19qFxg3bOcBD5";
    //public static final String GB_PAYMENT_SK = "sk_test_9wTiIIE9XtvLgbrpMVSVJrIS";
    //public static final String GB_CONNECT_PK = "pk_test_zKiUvTSQ3Orgh2ht3lC4LXQp";
    //public static final String GB_CONNECT_SK = "sk_test_qNNaRWg2lJJKUelm0yqmA1su";

    // Properties key
    public static final String PROPERTIES_ACCOUNT_PREFIX = "stripe.account";
    public static final String[] PROPERTIES_ACCOUNTS = {"payment", "connect", "billing"};
    public static final String PROPERTIES_ACCOUNT_PUBLISH_KEY = "publish_key";
    public static final String PROPERTIES_ACCOUNT_SECRET_KEY = "secret_key";


    // Static name
    public static final String PAGE_ELEMENT = "pageElement";


    // DB config
    public static final String DB_URL = "jdbc:mysql://zpj83vpaccjer3ah.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/g02uljxkq1rme8fu";
    public static final String DB_USER = "lg6w9m09v39yh719";
    public static final String DB_PASSWORD = "z5i27lo4s7p0ni1h";

    // view path
    //public static final String CREATE_PAYMENT_INTENT_VIEW = "payments/create-paymentintent";
    public static final String PAYMENT_INTENT_VIEW = "payments/paymentintent";
    public static final String CREATE_CONNECT_ACCOUNT_VIEW = "connect/create-account";
    public static final String LIST_CUSTOMER_VIEW = "customer/list-customer";
    public static final String LIST_PRODUCT_VIEW = "billing/product";
    public static final String LIST_PLAN_VIEW = "billing/plan";
    public static final String CREATE_SUB_VIEW = "billing/subscription";
    public static final String LIST_SUB_VIEW = "billing/list-subscriptions";
    public static final String SHOW_WEBHOOK = "webhook/webhook";
    public static final String ADD_ACCOUNT_VIEW = "add-account";

}
