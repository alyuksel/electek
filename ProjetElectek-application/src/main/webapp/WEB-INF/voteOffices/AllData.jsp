<%-- 
    Document   : FoundVoteOfficeFromAdresse
    Created on : 16 mars 2018, 00:41:37
    Author     : drajasin
--%>

<%@page import="upec.groupe1.entities.VoteOffices"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #map {
             height: 400px;
             width: 100%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.29.6/js/jquery.tablesorter.js"></script>
       
        <title>Tout les bureaux de votes</title>
    </head>
    <body>
        <%@include  file="../TopMenu.jsp"%>
        <div class="container">
        <h1>Bureaux de votes de Paris !</h1>
        <%
                ArrayList<VoteOffices> posts = (ArrayList<VoteOffices>) request.getAttribute("ListeVoteOffices");
                String erreur = (String) request.getAttribute("message");
                if(erreur!=null){
                    %><p>Mauvais Filtrage : <%=erreur%></p><%
                }
                
        %>
            <div>
                <form id="form" method="post" action="/ProjetElectek-application/voteoffices">
                <table id="myTable" class="tablesorter"> 
                    <p><button type="submit" form="form" value="Submit" style="visibility: hidden;">Submit</button></p>
                    <tr>
                        <td><input name="number" type="text" /></td>
                        <td><input name="caption" type="text" /></td>
                        <td><input name="adress" type="text" /></td>
                        <td></td>
                    </tr>
                    <thead>
                        <tr>
                            <th>Numéro</th>
                            <th>Libélé</th>
                            <th>Adresse</th>
                            <th>Code Postale</th>
                        </tr>
                    </thead>
                    <%  
                        for (VoteOffices vO : posts) {
                    %>
                    <tr>
                        <td><%=vO.getNumber()%></td>
                        <td><%=vO.getCaption()%></td>
                        <td><a href="<%=request.getContextPath()%>/voteoffices/detail?number=<%=vO.getNumber()%>" ><%=vO.getAdress()%></a></td>
                        <td><%=vO.getPostalCode()%></td>  
                    </tr>
                    <%}%>
                </table>      
                </form>
            </div>
        </div>
    </body>
</html>
<script>

    $(document).ready(function ()
    {
        $("#myTable").tablesorter();
    }
    );

    $(document).ready(function ()
    {
        $("#myTable").tablesorter({sortList: [[0, 0], [1, 0]]});
    }
    );
    $(document).ready(function(){
    $('#numberFilter').click(function(){
        $.ajax({
            type: 'POST',
            url: "/ProjetElectek-application/voteoffices",
            async: false,
             data: { 
                 'foo': 'bar', 
                 'ca$libri': 'no$libri'
             },
            success: function(result){
            $("div").html(result);
        }});
    });
});
    
</script>
