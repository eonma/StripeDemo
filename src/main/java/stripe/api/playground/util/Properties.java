package stripe.api.playground.util;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import stripe.api.playground.config.AppConfig;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;

import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-07
 */

public class Properties {

    private static AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
    private static AccountPropertyCollections accountPropertyCollections;


    public static AccountPropertyCollections getAccountPropertyCollections(){

        if (accountPropertyCollections == null){
            accountPropertyCollections = context.getBean(AccountPropertyCollections.class);
        }
        return accountPropertyCollections;
    }

    public static AccountPropertyCollections updateAccountPropertyCollections(AccountProperties accountProperties){

        List<AccountProperties> accountPropertyList = getAccountPropertyCollections().getAccountPropertiesList();
        accountPropertyList.add(accountProperties);
        accountPropertyCollections.setAccountPropertiesList(accountPropertyList);

        return accountPropertyCollections;
    }


}
