package stripe.api.playground.controller;


import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return "WEB-INF/views/hello.jsp";
    }

    @RequestMapping(value = "/element", method = RequestMethod.GET)
    public String showElement(Model model){
        model.addAttribute("message", "message");
        return "WEB-INF/views/elements.jsp";
    }

    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public String showMatchesView(Model model){

        return "WEB-INF/views/matches.jsp";
    }

    @RequestMapping(value = "/ecp", method = RequestMethod.GET)
    public String showECPView(Model model){

        return "WEB-INF/views/ecp.jsp";
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.GET)
    public String showConfirmView(Model model){

        return "WEB-INF/views/ecp_confirm.jsp";
    }

    @RequestMapping(value = "/calculateShipping", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> calculateShipping(@ModelAttribute Object data){

        System.out.println(data);

        return ResponseEntity.status(HttpStatus.OK).body(null);
    }

    @RequestMapping(value = "/green_flag", method = RequestMethod.GET)
    public String showGFView(Model model){

        return "WEB-INF/views/green_flag.jsp";
    }

    @RequestMapping(value = "/plum_guide", method = RequestMethod.GET)
    public String showPGView(Model model){

        return "WEB-INF/views/mockups/plum_guide.jsp";
    }

    @RequestMapping(value = "/moonpig", method = RequestMethod.GET)
    public String showMPView(Model model){

        return "WEB-INF/views/mockups/moonpig.jsp";
    }

    @RequestMapping(value = "/event", method = RequestMethod.GET)
    public String showEvent(Model model){
        model.addAttribute("message", "message");
        return "WEB-INF/views/webhook.jsp";
    }

    @RequestMapping(value = "/paypal", method = RequestMethod.GET)
    public String showPPISU(Model model){
        model.addAttribute("message", "message");
        return "WEB-INF/views/pp_isu.jsp";
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
