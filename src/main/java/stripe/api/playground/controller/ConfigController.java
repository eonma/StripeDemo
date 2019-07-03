package stripe.api.playground.controller;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import stripe.api.playground.config.properties.AccountProperties;
import stripe.api.playground.model.PlaygroundResponse;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.Properties;

/**
 * User: chenma
 * Date: 2019-02-21
 */
@RequestMapping
@Controller
public class ConfigController {

    private static final Logger logger = Logger.getLogger(ConfigController.class);

    @RequestMapping(value = "/add-account", method = RequestMethod.GET)
    public String showAddAccountView(Model model){

        model.addAttribute("accountProperties", new AccountProperties());

        return Constants.ADD_ACCOUNT_VIEW;
    }

    @RequestMapping(value = "/add-account", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> addAccount (
            @ModelAttribute("accountProperties") AccountProperties accountProperties,
            BindingResult result, Model model){


        if (accountProperties != null){
            Properties.updateAccountPropertyCollections(accountProperties);
        }


        model.addAttribute("accountProperties", accountProperties);
        PlaygroundResponse response = new PlaygroundResponse();


        return ResponseEntity.ok().body(response.toJSON());
    }
}
