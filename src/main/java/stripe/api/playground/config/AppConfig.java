package stripe.api.playground.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.EnumerablePropertySource;
import org.springframework.core.env.Environment;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.config.properties.AccountPropertyCollections;
import stripe.api.playground.util.Constants;

import java.util.*;

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

        Map<String, String> properties = new HashMap<String, String>();
        if (environment instanceof ConfigurableEnvironment) {
            for (org.springframework.core.env.PropertySource<?> propertySource : ((ConfigurableEnvironment) environment).getPropertySources()) {
                if (propertySource instanceof EnumerablePropertySource) {
                    for (String key : ((EnumerablePropertySource) propertySource).getPropertyNames()) {
                        if (key.startsWith(Constants.PROPERTIES_ACCOUNT_PREFIX)) {
                            properties.put(key, (String) propertySource.getProperty(key));
                        }
                    }
                }
            }
        }

        for (Map.Entry<String, String> entry : properties.entrySet()){
            String[] keys = entry.getKey().split("\\.");

            if (keys != null && keys.length == 2){
                //accountProperties.setAccountName(key[1]);
                String[] values = entry.getValue().split(",");
                if (values != null && values.length == 3){
                    AccountProperties accountProperties = new AccountProperties(keys[1], values[0], values[1], values[2]);
                    accountPropertiesList.add(accountProperties);
                }
            }

        }

/*

        List<String> accontNames = Arrays.asList(Constants.PROPERTIES_ACCOUNTS);
        Iterator<String> it = accontNames.iterator();
        while (it.hasNext()) {

            String name = it.next();
            String publishKey = environment.getProperty(Constants.PROPERTIES_ACCOUNT_PREFIX + "." + name + "." + Constants.PROPERTIES_ACCOUNT_PUBLISH_KEY);
            String secretKey = environment.getProperty(Constants.PROPERTIES_ACCOUNT_PREFIX + "." + name + "." + Constants.PROPERTIES_ACCOUNT_SECRET_KEY);

            AccountProperties accountProperties = new AccountProperties(name, publishKey, secretKey);
            accountPropertiesList.add(accountProperties);
        }
*/

        bean.setAccountPropertiesList(accountPropertiesList);

        return bean;
    }
}
