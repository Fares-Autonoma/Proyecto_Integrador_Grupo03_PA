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
         
                    window.document.V.action="<%=request.getContextPath()%>/MantenimientoAlto.jsp";
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
            ps=con.prepareStatement("select * From ticket");
            rs=ps.executeQuery();
            
        %>
        
     <ceter>     
        
        <div class="container">
            
            <center><h1>Compras</h1></center>
            
            <hr>
            
            <a class="btn btn-success btn-lg" href="AgregarCompra.jsp">Nuevo registro</a>
            
            <br/><br/>
            
            <table class="table table-bordered">
                
                <tr>
                    
                    <th class="text-center">idTicket</th>
                    <th class="text-center">idPelícula</th>
                    <th class="text-center">Costo</th>
                    <th class="text-center">idUsuario</th>
                    <th class="text-center">idPedido</th>
                    <th class="text-center">Acción</th>
                    
                </tr>
                
                <%
                    
                    while(rs.next()){
                  
               %>
               
               <tr>
                  
                   <td class="text-center"><%= rs.getInt("idTicket")%></td>
                   <td class="text-center"><%= rs.getInt("idPelicula")%></td>
                   <td class="text-center"><%= rs.getBigDecimal("Costo")%></td>
                   <td class="text-center"><%= rs.getInt("idUsuario")%></td>
                   <td class="text-center"><%= rs.getInt("idPedido")%></td>
                   <td class="text-center">
                       
                       <a href="EditarCompras.jsp?id=<%= rs.getInt("idTicket")%>" class="btn btn-warning btn-sm">Editar</a>
                       
                       <a></a> 
                       
                       <a href="EliminarCompras.jsp?id=<%= rs.getInt("idTicket")%>" class="btn btn-warning btn-sm">Eliminar</a>
                       
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


