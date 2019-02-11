<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-02-08
  Time: 09:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Webhook loader</title>
    <button onclick="sendRequest()">Send Request</button>
</head>
<body>
<div id="serverData">Here is where the server sent data will appear</div>

<script type="text/javascript">
    function sendRequest(){

        var eSource = new EventSource("/event/update");
        eSource.onmessage = function(event) {
            console.log(event);
            //write the received data to the page
            var sd = document.getElementById("serverData");


            if (event.data != ""){
                var data = JSON.parse(event.data);
                sd.appendChild(document.createElement('br'));
                sd.appendChild(document.createTextNode(data.id));
            }
        };




/*
        //check for browser support
        if(typeof(EventSource)!=="undefined") {
            //create an object, passing it the name and location of the server side script
            var eSource = new EventSource("/event/update/1");
            //eSource.addEventListener("newWebhookHandler", newWebhookHandler, false);
            //detect message receipt
            eSource.onmessage = function(event) {
                console.log(event);
                //write the received data to the page
                document.getElementById("serverData").innerHTML = event.data;
            };
        }
        else {
            document.getElementById("serverData").innerHTML="Whoops! Your browser doesn't receive server-sent events.";
        }*/
    };
    function newWebhookHandler(event) {
        console.log("New webhook is received");
    }

</script>
</body>
</html>
