<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-06-05
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Title</title>
    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="https://stripe.com/favicon.ico" />">
</head>
<body>

<input type="hidden" id="code" value="${code}"/>
<input type="hidden" id="status" value="${status}"/>
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script>
    $(function(){
        var code = $('#code').val();
        //window.parent.setData(code);
        window.close();
    })

</script>
</body>
</html>
