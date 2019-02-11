package stripe.api.playground.controller;

import com.stripe.model.Event;
import com.stripe.model.EventCollection;
import com.stripe.net.ApiResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import stripe.api.playground.model.WebhookCollection;
import stripe.api.playground.util.Constants;
import stripe.api.playground.util.StripeDemoUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * User: chenma
 * Date: 2019-02-08
 */

@RequestMapping
@Controller
public class WebhookController {

    private WebhookCollection webhookCollection;
    private List<String> webhookList;

    private String webhookContent;

    @RequestMapping(value = "/webhook", method = RequestMethod.POST)
    public ResponseEntity<Object> webhookHandler(@RequestBody String payload){

        webhookContent = payload.replaceAll("\\s", "");
        System.out.println(webhookContent);


        // build a webhook collection.
        if (webhookCollection == null){
            webhookCollection = new WebhookCollection();
        }

        if (webhookList == null){
            webhookList = new ArrayList<>();
            webhookCollection.setData(webhookList);
        }
        webhookList.add(webhookContent);



        return ResponseEntity.ok().body(null);

    }



    @RequestMapping(value = "/webhook", method = RequestMethod.GET)
    public String showWebhook(){

        return Constants.SHOW_WEBHOOK;
    }

    @RequestMapping(value = "/webhook/update")
    public void handleSse(HttpServletResponse response) {

        response.setHeader("Cache-Control", "no-cache");
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Last-Event-ID", "12345");

        PrintWriter writer;
        try {
            writer = response.getWriter();

            // single webhook output
            //singleWebhookOutput(writer);


            // webhook collection output
            webhookCollectionOutput(writer);


            writer.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void singleWebhookOutput(PrintWriter writer){
        writer.println("data: " + webhookContent + "\n");
        if (StripeDemoUtil.isNotEmpty(webhookContent)){
            webhookContent = "";
        }

    }

    private void webhookCollectionOutput(PrintWriter writer){
        if (webhookCollection != null){
            writer.println("data: " + webhookCollection.toJSON().replaceAll("\\s", "") + "\n");
            webhookCollection = null;
            webhookList = null;
        } else {
            writer.println("data: null" + "\n");
        }



    }
}
