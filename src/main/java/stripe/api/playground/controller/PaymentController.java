package stripe.api.playground.controller;

import com.stripe.model.Charge;
import com.stripe.model.ExternalAccount;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stripe.api.playground.dao.ChargeDao;

/**
 * User: chenma
 * Date: 2019-01-02
 */

@RequestMapping
@Controller
public class PaymentController {

    @RequestMapping(value = "/create_charge", method = RequestMethod.GET)
    public String showCreateCharge (Model model){
        model.addAttribute("chargeParam", new ChargeDao());
        return "payments/charges";
    }

    @RequestMapping(value = "/create_charge", method = RequestMethod.POST)
    public String editTask(@ModelAttribute("chargeParam") ChargeDao chargeDao, BindingResult result, Model model){
        System.out.println(chargeDao.getAmount());
        System.out.println(chargeDao.getSource());


        return "payments/charges";

    }

    @RequestMapping(value = "paymentsintent", method = RequestMethod.GET)
    public String showPaymentsIntent (Model model){
        return "payments/paymentsintent";
    }


}
