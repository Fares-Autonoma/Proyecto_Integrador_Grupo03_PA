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
         
                    window.document.V.action="<%=request.getContextPath()%>/Mantenimiento.jsp";
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
            
            <center><h1>Compras</h1></center>
            
            <hr>
            
            <table class="table table-bordered">
                
                <tr>
                    
                    <th class="text-center">idHorario</th>
                    <th class="text-center">Hora</th>
                    <th class="text-center">Día</th>
                    <th class="text-center">Mes</th>
                    <th class="text-center">Año</th>
                    <th class="text-center">Película</th>
                    <th class="text-center">Acción</th>
                    
                </tr>
                
                <%
                    
                    while(rs.next()){
                  
               %>
               
               <tr>
                  
                   <td class="text-center"><%= rs.getInt("idHorario")%></td>
                   <td class="text-center"><%= rs.getInt("Hora")%></td>
                   <td class="text-center"><%= rs.getString("Dia")%></td>
                   <td class="text-center"><%= rs.getInt("Mes")%></td>
                   <td class="text-center"><%= rs.getInt("Año")%></td>
                   <td class="text-center"><%= rs.getString("Pelicula")%></td>
                   
                  
                   <td class="text-center">
                       
                       <a class="btn btn-warning btn-sm">Editar</a>
                       
                       <a></a> 
                       
                       <a class="btn btn-warning btn-sm">Eliminar</a>
                       
                   </td>
                   
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


