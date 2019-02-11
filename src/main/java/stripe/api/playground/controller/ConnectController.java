package stripe.api.playground.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stripe.api.playground.util.Constants;

import java.util.logging.Logger;

/**
 * User: chenma
 * Date: 2019-01-14
 */

@RequestMapping
@Controller
public class ConnectController {
    private static final Logger logger = Logger.getLogger(ConnectController.class.getName());

    @RequestMapping(value = "create-account", method = RequestMethod.GET)
    public String showCreateAccountView(Model model){


        return Constants.CREATE_CONNECT_ACCOUNT_VIEW;
    }
}
