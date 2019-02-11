package stripe.api.playground.controller;


import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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


    @RequestMapping(value = "/event", method = RequestMethod.GET)
    public String showEvent(Model model){
        model.addAttribute("message", "message");
        return "webhook";
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


    @RequestMapping(value = "/event/update/1", method = RequestMethod.GET)
    public ResponseEntity<ResponseBodyEmitter> handleRbe() {
        ResponseBodyEmitter emitter = new ResponseBodyEmitter();


        executor.execute(() -> {
            try {
                emitter.send(
                        "/rbe" + " @ " + new Date(), MediaType.TEXT_PLAIN);
                emitter.complete();
            } catch (Exception ex) {
                emitter.completeWithError(ex);
            }
        });
        return new ResponseEntity(emitter, HttpStatus.OK);
    }

    @RequestMapping(value = "/event/update/2", method = RequestMethod.GET)
    public SseEmitter handleSse() {
        SseEmitter emitter = new SseEmitter();
        nonBlockingService.execute(() -> {
            try {
                emitter.send("/sse" + " @ " + new Date());
                // we could send more events
                emitter.complete();
            } catch (Exception ex) {
                emitter.completeWithError(ex);
            }
        });
        return emitter;
    }

    @RequestMapping(value = "/event/update/3", method = RequestMethod.GET)
    public ResponseEntity<StreamingResponseBody> handleRbeTwo() {
        StreamingResponseBody stream = out -> {
            String msg = "/srb" + " @ " + new Date();
            out.write(msg.getBytes());
        };
        return new ResponseEntity(stream, HttpStatus.OK);
    }
}
