<%-- 
    Document   : DataByArr
    Created on : 16 mars 2018, 08:15:32
    Author     : drajasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="upec.groupe1.entities.VoteOffices"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.29.6/js/jquery.tablesorter.js"></script>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>VoteOffice from AttachedZone</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="/ProjetElectek-application/index.html">Accueil</a>
            <a class="navbar-brand" href="/ProjetElectek-application/Candidates">Classement</a>
            <a class="navbar-brand" href="/ProjetElectek-application/SortResults">Resultats</a>
            <a class="navbar-brand" href="/ProjetElectek-application/MyResults">Mes Résultats</a>
            <a class="navbar-brand" href="/ProjetElectek-application/results/presidentielle">Resultats</a>
            <a class="navbar-brand" href="/ProjetElectek-application/voteoffices">Bureaux</a>
            <%
               if(session.getAttribute("user")!=null){
                   out.println("<a class=\"navbar-brand\" href=\"/ProjetElectek-application/Logout\">Logout</a>");
               }
            %>
        </nav>
        <h1>Hello World!</h1>
        <table id="myTable" class="tablesorter"> 
            <thead>
                <tr>
                <th>Arrondissment</th>
                <th>IdVoteOffice</th>
                <th>Numéro</th>
                <th>Libélé</th>
                <th>Adresse</th>
                <th>Code Postale</th>
                </tr>
            </thead>
            <tbody>
            <%
            Map<String,List<VoteOffices>> posts = (Map<String,List<VoteOffices>>) request.getAttribute("MapVoteOffices"); 
           
            for(String key : posts.keySet()){
                for(VoteOffices vo: posts.get(key)){
                %>
                <tr>
                    <td><%=key%></td>
                    <td><%=vo.getIdVoteOffices()%></td>
                    <td><%=vo.getNumber()%></td>
                    <td><%=vo.getCaption()%></td>
                    <td><%=vo.getAdress()%></td>
                    <td><%=vo.getPostalCode()%></td>  
                    
                </tr>
                <%      
                }
                %>
                
             <%           
             }
            %>  
            </tr>
            </tbody>
        </table>      
           
    </body>
</html>

<script>
    
    $(document).ready(function() 
    { 
        $("#myTable").tablesorter(); 
    } 
    ); 
    
    $(document).ready(function() 
    { 
        $("#myTable").tablesorter( {sortList: [[0,0], [1,0]]} ); 
    } 
    ); 
</script>