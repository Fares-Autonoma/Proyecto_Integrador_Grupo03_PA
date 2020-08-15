<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Css/EstiloI2.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
        
        <script src="<%=request.getContextPath()%>/Js/javascript.js"></script>
        
    </head>
    
    <body>  
        
    <center>
        <img src="Imagenes/encabezado.jpg" width="75%"/>            
    </center>    
        
        <div id="Cuadro">
            
            <form name="Login">
                <input type="hidden" name="op">
                
                <p id="Titulo">INICIAR SESIÓN</p>
                
                <hr>
                
                <br/><br/>
                
                <label id="subtituloI"> NOMBRE DE USUARIO </label>
                
                <br/><br/>
                
                <input type="txt" class="entrada" name="txtU" id="txtU">
                
                <br/><br/>
                
                <label id="subtituloII"> CONTRASEÑA </label>
                
                <br/><br/>
                
                <input type="password" class="entrada" name="txtC" id="txtC">
                
                <br/><br/>
                
                <input type="button" value="Inicar Sesión" id="boton" onclick="validarAccesoUsuario('<%=request.getContextPath()%>')">
               
                <%
                   
                   if(request.getAttribute("mensaje")!=null){
                   
                   String msj = (String)request.getAttribute("mensaje");
                   
                   out.print(msj);
                   
               }
                   
               %> 
                
            </form>
            
            <br/><br/>
            
            <p id="marca">CINE PLANET</p>
            
        </div>
        
    </body>
    
</html>