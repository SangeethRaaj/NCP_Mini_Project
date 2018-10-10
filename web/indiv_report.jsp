<%-- 
    Document   : indiv_report.jsp
    Created on : Oct 3, 2018, 10:49:56 AM
    Author     : Sangeeth
--%>


<%@page import="loginn.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 80%;
}
#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}
#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>

<table id="customers">
 <tr>
  <th>Date</th>
  <th>Title</th>
  <th>P/A</th>
 </tr>
 <tr>
  <td>04/06/2018 </td>
  <td>Biometrics</td>
  <td>Present</td>
 </tr>
 <tr>
  <td>05/06/2018 </td>
  <td>Biometrics</td>
  <td>Present</td>
 </tr>
 <tr>
  <td>06/06/2018 </td>
  <td>Biometrics</td>
  <td>Absent</td>
 </tr>
 
</table>
</body>
</html>