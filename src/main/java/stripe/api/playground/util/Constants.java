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
    public static final String PROPERTIES_ACCOUNT_PREFIX = "stripe-account";
    //public static final String STRIPE_API_VERSION = "2019-02-19";


    // Static name
    public static final String PAGE_ELEMENT = "pageElement";


    // DB config
    public static final String DB_URL = "jdbc:mysql://zpj83vpaccjer3ah.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/g02uljxkq1rme8fu";
    public static final String DB_USER = "lg6w9m09v39yh719";
    public static final String DB_PASSWORD = "z5i27lo4s7p0ni1h";

    // view path
    public static final String PAYMENT_INTENT_MANUAL_VIEW = "payments/payment_intent_manual";
    public static final String PAYMENT_INTENT_AUTO_VIEW = "payments/payment_intent_auto";
    public static final String CONFIRM_PAYMENT_INTENT_VIEW = "payments/confirm_payment_intent";
    public static final String CAPTURE_PAYMENT_INTENT_VIEW = "payments/capture_payment_intent";
    public static final String SETUP_INTENT_VIEW = "payments/setup_intent";
    public static final String CREATE_CONNECT_ACCOUNT_VIEW = "connect/create_account";
    public static final String CREATE_PRODUCT_PLAN_VIEW = "billing/product_plan";
    public static final String CREATE_SUBSCRIPTION_VIEW = "billing/create_sub";
    public static final String SHOW_WEBHOOK = "webhook/webhook";
    public static final String LOGIN_VIEW = "login";
    public static final String ADD_ACCOUNT_VIEW = "add-account";


    /*public static final String PAYMENT_INTENT_VIEW = "payments/paymentintent";
    public static final String CREATE_REFUND_VIEW = "payments/refund";
    public static final String CREATE_REFUND_APP_FEE_VIEW = "payments/refund-fee";
    public static final String LIST_CUSTOMER_VIEW = "customer/list-customer";
    public static final String LIST_PRODUCT_VIEW = "billing/product";
    public static final String LIST_PLAN_VIEW = "billing/plan";
    public static final String CREATE_SUB_VIEW = "billing/subscription";
    public static final String LIST_SUB_VIEW = "billing/list-subscriptions";
    public static final String UPDATE_SUB_VIEW = "billing/update-subscription";*/

    public static final String[] STRIPE_COUNTRY_LIST = {"GB", "AT", "AU", "BE", "CA", "CH", "DE", "DK", "ES", "FI", "FR", "HK", "IE", "IT", "JP", "LU", "NL", "NO", "NZ", "PT", "SE", "SG", "US"};

}
