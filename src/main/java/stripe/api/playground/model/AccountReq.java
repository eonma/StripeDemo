package stripe.api.playground.model;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * User: chenma
 * Date: 2019-02-11
 */

@Data
@Setter
@Getter
@RequiredArgsConstructor(staticName = "of")
public class AccountReq {

    public String type;
    public String country;
    public String email;
    public String business_name;
    public String business_url;
    public Boolean debit_negative_balances;
    public String default_currency;
    public Address address;


    public class ExternalAccount{
        private String object;
        private String country;
        private String currency;
        private String account_holder_name;
        private String account_holder_type;
        private String account_number;
        private String routing_number;

    }
}
