package stripe.api.playground.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping
@Controller
public class HelloController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String printHello(Model model){
        model.addAttribute("message", "message");
        return "hello";
    }

    @RequestMapping(value = "/element", method = RequestMethod.GET)
    public String showElement(Model model){
        model.addAttribute("message", "message");
        return "elements";
    }
}
