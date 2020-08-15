
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
                
    </head>
    
    <body>
      
        
        
     <center>
        
        <div class="container">
            
            <h1>Agregar nuevo usuario</h1>
            
            <hr>
            
            <form action="" method="post" class="form-control" style=" width: 450px; height: 450px">
                
                <br/><br/>
               
               IdPelicula: 
                <select name="SelPel">
                
                   <%
                   
                     String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                     String url = "jdbc:mysql://localhost/pa?user=root&password=";
                     Class.forName("com.mysql.jdbc.Driver");
                     String sql="select * From Pelicula";
                     Connection cn=DriverManager.getConnection(url);
                     PreparedStatement ps=cn.prepareStatement(sql);
                     ResultSet rs=ps.executeQuery();
                     while(rs.next()==true){
                         
                       %>
                       
                       <option><%=rs.getInt(1)%></option>
                       
                       <%

                     }
                   
                   %>
                    
                </select>
                
                <br/> <br/>
                
                Costo:
                <input type="text" name="txtCosto" class="form-control"/>
                
                <br/><br/>
                
                IdUsuario:
                <select name="SelUs">
                
                   <%
                   
                     String driver2 = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                     String url2 = "jdbc:mysql://localhost/pa?user=root&password=";
                     Class.forName("com.mysql.jdbc.Driver");
                     String sql2="select * From Usuario";
                     Connection cn2=DriverManager.getConnection(url);
                     PreparedStatement ps2=cn2.prepareStatement(sql2);
                     ResultSet rs2=ps2.executeQuery();
                     while(rs2.next()==true){
                         
                       %>
                       
                       <option><%=rs2.getInt(1)%></option>
                       
                       <%

                     }
                   
                   %>
               
                 </select>
                   
                   
                <br/><br/><br/>
                
                IdPedido:
                <select name="SelPed">
                
                   <%
                   
                     String driver3 = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                     String url3 = "jdbc:mysql://localhost/pa?user=root&password=";
                     Class.forName("com.mysql.jdbc.Driver");
                     String sql3="select * From Pedidos";
                     Connection cn3=DriverManager.getConnection(url);
                     PreparedStatement ps3=cn3.prepareStatement(sql3);
                     ResultSet rs3=ps3.executeQuery();
                     while(rs3.next()==true){
                         
                       %>
                       
                       <option><%=rs3.getInt(1)%></option>
                       
                       <%

                     }
                   
                   %>
               
                 </select>
                
                <br/><br/><br/>
                
                IdCliente:
                <select name="SelCli">
                
                   <%
                   
                     String driver4 = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                     String url4 = "jdbc:mysql://localhost/pa?user=root&password=";
                     Class.forName("com.mysql.jdbc.Driver");
                     String sql4="select * From Cliente";
                     Connection cn4=DriverManager.getConnection(url);
                     PreparedStatement ps4=cn4.prepareStatement(sql4);
                     ResultSet rs4=ps4.executeQuery();
                     while(rs4.next()==true){
                         
                       %>
                       
                       <option><%=rs4.getInt(1)%></option>
                       
                       <%

                     }
                   
                   %>
               
                 </select>
                
                <br/><br/><br/>
                
                <input type="submit" name="Guardar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="ComprasAlto.jsp">Regresar</a>
                
            </form>
            
        </div>
        
       
        <%
            
            if(request.getParameter("Guardar")!=null){
            
            String Pel=request.getParameter("SelPel");
            String Cost=request.getParameter("txtCosto");
            String Us=request.getParameter("SelUs");
            String Ped=request.getParameter("SelPed");
            String Cli=request.getParameter("SelCli");
                                    
            Connection cnx=null;
            ResultSet rs5=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("insert into ticket(idPelicula, Costo, idUsuario, idPedido, idCliente)Values('"+Pel+"','"+Cost+"','"+Us+"','"+Ped+"','"+Cli+"')");
            request.getRequestDispatcher("ComprasAlto.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al guardar el nuevo usuario");
                
            }
           }  
        %>
        
        
      </center>   
    </body>
    
</html>

