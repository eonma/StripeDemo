package stripe.api.playground.controller;

import com.stripe.exception.StripeException;
import com.stripe.model.Account;
import com.stripe.model.Person;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import stripe.api.playground.model.*;
import stripe.api.playground.service.ConnectServ;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.StripeDemoUtil;

/**
 * User: chenma
 * Date: 2019-01-14
 */

@RequestMapping
@Controller
public class ConnectController {
    private static final Logger logger = Logger.getLogger(ConnectController.class);

    @RequestMapping(value = "account", method = RequestMethod.GET)
    public String showAccountView(Model model){

        // init viewobj
        ViewObject viewObject = new ViewObject(
                null,
                StripeDemoUtil.getAccountPropertyCollections(),
                false,
                null,
                false,
                null
        );

        model.addAttribute("viewObj", viewObject);

        model.addAttribute("acctReq", new AccountReq());
        model.addAttribute("personReq", new PersonReq());
        model.addAttribute("country", Constants.STRIPE_COUNTRY_LIST);

        return Constants.CREATE_CONNECT_ACCOUNT_VIEW;
    }


    @RequestMapping(value = "/custom-account", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> createCustomAccount(
            @ModelAttribute("acctReq") AccountReq accountReq,
            @ModelAttribute("accountName") String accountName,
            BindingResult result, Model model){

        PlaygroundResponse response = new PlaygroundResponse();

        if (StripeDemoUtil.isNotEmpty(accountName)){

            try {
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
                ConnectServ connectServ = new ConnectServ(apiKey);
                Account account = connectServ.createCustomAccount(accountReq);
                logger.info(account.getId() + " has been created.");

                response.setBody(account);


            } catch (StripeException e) {
                logger.error(e.getMessage());
                response.setError(true);
                response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));
            }

        } else {

        }


        return ResponseEntity.ok().body(response.toJSON());
    }

    @RequestMapping(value = "/update-account", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> updateCustomAccount(
            @ModelAttribute("acctReq") AccountReq accountReq,
            @ModelAttribute("accountName") String accountName,
            @ModelAttribute("accountId") String accountId,
            BindingResult result, Model model){
        PlaygroundResponse response = new PlaygroundResponse();

        if (StripeDemoUtil.isNotEmpty(accountName)){
            try {
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
                ConnectServ connectServ = new ConnectServ(apiKey);
                Account account = connectServ.updateCustomAccount(accountReq, accountId);
                logger.info(account.getId() + " has been updated.");

                response.setBody(account);
            } catch (StripeException e) {
                logger.error(e.getMessage());
                response.setError(true);
                response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));
            }
        }
        return ResponseEntity.ok().body(response.toJSON());
    };


    @RequestMapping(value = "getCountrySpec", method = RequestMethod.POST)
    @ResponseBody
    public CountrySpecCollection getCountrySpec(
            @ModelAttribute(value="country") String country,
            @ModelAttribute(value="accountName") String accountName,
            Model model){

        CountrySpecCollection countrySpecCollection = new CountrySpecCollection();

        String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);

        return countrySpecCollection;
    }


    @RequestMapping(value = "/add-person", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> addPerson(
            @ModelAttribute("personReq") PersonReq personReq,
            @ModelAttribute("accountName") String accountName,
            @ModelAttribute("accountId") String accountId,
            BindingResult result, Model model){
        PlaygroundResponse response = new PlaygroundResponse();

        if (StripeDemoUtil.isNotEmpty(accountName)){
            try {
                String apiKey = StripeDemoUtil.getAccountSecretKeyFromName(accountName);
                ConnectServ connectServ = new ConnectServ(apiKey);
                Person person = connectServ.createPerson(personReq, accountId);
                logger.info(person.getId() + " has been created.");

                response.setBody(person);
            } catch (StripeException e) {
                logger.error(e.getMessage());
                response.setError(true);
                response.setBody(new RequestError(e.getRequestId(), e.getCode(), e.getMessage()));
            }
        }
        return ResponseEntity.ok().body(response.toJSON());
    }




    @RequestMapping(value = "/transfer", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> createTransfer(
            @ModelAttribute("transferReq") TransferReq transferReq,
            @ModelAttribute("accountName") String accountName,
            BindingResult result, Model model){

        PlaygroundResponse response = new PlaygroundResponse();


        return ResponseEntity.ok().body(response.toJSON());
    }

}
