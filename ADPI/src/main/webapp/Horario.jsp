<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        
        <script>
            
            function Volver(){
         
                    window.document.V.action="<%=request.getContextPath()%>/Principal.jsp";
                    window.document.V.method="GET";
                    window.document.V.submit();
                    
            }
            
        </script>
        
    </head>
    
    <body>
        
        <%
            
            Connection con;
            String url="jdbc:mysql://localhost/pa";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            
            PreparedStatement ps;
            ResultSet rs;
            ps=con.prepareStatement("select * From horario");
            rs=ps.executeQuery();
            
        %>
        
     <ceter>     
        
        <div class="container">
            
            <center><h1>Horarios</h1></center>
            
            <hr>
            
            <table class="table table-bordered">
                
                <tr>
                    
                    <th class="text-center">Pelicula</th>
                    <th class="text-center">Fecha</th>
                    <th class="text-center">Hora</th>
                                                                                
                </tr>
                
                <%
                    
                    while(rs.next()){
                  
               %>
               
               <tr>
                  
                   <td class="text-center"><%= rs.getString("Pelicula")%></td>
                   <td class="text-center"><%= rs.getString("Fecha")%></td>
                   <td class="text-center"><%= rs.getString("Hora")%></td>
                                                                           
               </tr>
               
               <%}%>
               
            </table>
            
        </div>
      
     </ceter>   
    
    <form name="V">
    
    <center><input type="button" value="Volver" id="boton" onclick="Volver()"></center>
    
    </form>
    
    </body>
    
</html>


