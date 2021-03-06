<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>

<h3> Welcome ${sessionScope.userAccount.userName}</h3>
<div class="container">
    <div class="row">
    <form class="form-horizontal" action="logout" method="post">
                <div class="form-group">
                            <div class="col-md-12 text-right">
                                <button type="submit" class="btn btn-primary btn-lg">Logout</button>
                            </div>
                        </div>
                        </form>
        <div class="col-md-12">
            <div class="well well-sm">
            <h3>You have ${fn:length(pList)} Patients</h3>
             
                <form class="form-horizontal">
                    <fieldset>
                        <legend class="text-center header">Patient Details</legend>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                               <table border="1" width="700">
         <tr>
         <th align="center">Patinet Name</th><th align="center">Respiratory Rate</th><th align="center">Heart Rate</th>
         <th align="center">Systolic Blood Pressure</th><th align="center">Temperature</th><th align="center">Diagnosis</th>
        <th align="center">Prescription</th>
         </tr>
         <c:forEach items="${pList}" var="patient" varStatus="count">
         <tr><td rowspan="${fn:length(patient.encounterList)+1}">${patient.firstName}</td>
         <td><c:forEach items="${patient.encounterList}" var="encounter" varStatus="count">
         <tr>
         <td>${encounter.vitalSign.resprate}</td>
         <td>${encounter.vitalSign.heartrate}</td>
         <td>${encounter.vitalSign.sysbp}</td>
         <td>${encounter.vitalSign.temp}</td>
         <td><a href="diagnose?encounterID=${encounter.encounterID}">Diagnose</a></td>
         <td><a href="medication?encounterID=${encounter.encounterID}">Medication</a></td>
         </tr>
         </c:forEach>
         
         
         </td>
           
             
         </tr>	
        </c:forEach> 
         
         <tr><td colspan = "8" align="center"></td></tr>    
        
</table>
                            </div>
                        </div>
                       
                    </fieldset>
                </form>
                
                <form class="form-horizontal">
                    <fieldset>
                        <legend class="text-center header">Work Requests</legend>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="col-md-8">
                               <table border="1" width="700">
         <tr>
         <th align="center">WorkRequest ID </th> <th align="center">To </th><th align="center">Message</th><th align="center">Request Date</th>
         <th align="center">Test Type</th><th align="center">Test Status</th>
        
         </tr>
         <c:forEach items="${workRequestList}" var="workRequest" varStatus="count">
         <tr><td>${workRequest.wID}</td><td>${workRequest.receiver}</td><td>${workRequest.message}</td><td>${workRequest.requestDate}</td>
             <td>${workRequest.testType}</td> <td>${workRequest.status}</td>
             
           
             
         </tr>	
        </c:forEach> 
         
        <tr><td colspan = "8" align="center"></td></tr>    
        
</table>
                            </div>
                        </div>
                       
                    </fieldset>
                </form>
                
            </div>
        </div>
    </div>
</div>

<style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
</style>

<!-- Contact Form - END -->

</div>

</body>
</html>