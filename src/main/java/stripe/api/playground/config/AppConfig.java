package stripe.api.playground.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.util.Constants;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-07
 */


@Configuration
@PropertySource("classpath:config.properties")
public class AppConfig {

    @Autowired
    Environment environment;


    /**
     * Get account properties.
     * @return
     */
    @Bean
    AccountPropertyCollections getAccountPropertyCollections(){
        AccountPropertyCollections bean = new AccountPropertyCollections();

        List<AccountProperties> accountPropertiesList = new ArrayList<>();
        List<String> accontNames = Arrays.asList(Constants.PROPERTIES_ACCOUNTS);
        Iterator<String> it = accontNames.iterator();
        while (it.hasNext()) {

            String name = it.next();
            String publishKey = environment.getProperty(Constants.PROPERTIES_ACCOUNT_PREFIX + "." + name + "." + Constants.PROPERTIES_ACCOUNT_PUBLISH_KEY);
            String secretKey = environment.getProperty(Constants.PROPERTIES_ACCOUNT_PREFIX + "." + name + "." + Constants.PROPERTIES_ACCOUNT_SECRET_KEY);

            AccountProperties accountProperties = new AccountProperties(name, publishKey, secretKey);
            accountPropertiesList.add(accountProperties);
        }

        bean.setAccountPropertiesList(accountPropertiesList);

        return bean;
    }
}
