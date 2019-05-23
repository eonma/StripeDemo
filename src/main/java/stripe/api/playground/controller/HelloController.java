package stripe.api.playground.controller;


import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@RequestMapping
@Controller
public class HelloController {

    private String webhook = "";

    private ExecutorService executor = Executors.newCachedThreadPool();
    private ExecutorService nonBlockingService = Executors.newCachedThreadPool();
    private ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();

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

    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public String showMatchesView(Model model){

        return "matches";
    }

    @RequestMapping(value = "/ecp", method = RequestMethod.GET)
    public String showECPView(Model model){

        return "ecp";
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.GET)
    public String showConfirmView(Model model){

        return "ecp_confirm";
    }

    @RequestMapping(value = "/calculateShipping", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> calculateShipping(@ModelAttribute Object data){

        System.out.println(data);

        return ResponseEntity.status(HttpStatus.OK).body(null);
    }

    @RequestMapping(value = "/green_flag", method = RequestMethod.GET)
    public String showGFView(Model model){

        return "green_flag";
    }

    @RequestMapping(value = "/plum_guide", method = RequestMethod.GET)
    public String showPGView(Model model){

        return "mockups/plum_guide";
    }

    @RequestMapping(value = "/event", method = RequestMethod.GET)
    public String showEvent(Model model){
        model.addAttribute("message", "message");
        return "webhook";
    }

    @RequestMapping(value = "/paypal", method = RequestMethod.GET)
    public String showPPISU(Model model){
        model.addAttribute("message", "message");
        return "pp_isu";
    }


    /*@RequestMapping(value = "/event/update")
    public void handleSse(HttpServletResponse response) {

        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Last-Event-ID", "12345");

        System.out.println("pushing a server event.");

        PrintWriter writer;
        try {
            writer = response.getWriter();
            writer.println("data: " + webhook + "\n");
            writer.flush();

            if (!webhook.equals("")){
                webhook = "";
            }

            Thread.sleep(10000);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }*/

    @RequestMapping(value = "/event/webhook", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> webhook(@RequestBody JSONObject postPayload){
        webhook = postPayload.toString();

        return ResponseEntity.status(HttpStatus.OK).body(null);
    }

}
