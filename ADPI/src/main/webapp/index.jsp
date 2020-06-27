
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <link href="Css/stylepersonal.css" rel="stylesheet" type="text/css"/>
        
        <link href="Css/bootstrap.min_personal.css" rel="stylesheet" type="text/css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Login</title>
        
        <script>
            
            function Entrar(){
                
                var Usuario, Clave;
                Usuario=window.document.L.txtU.value;
                Clave=window.document.L.txtC.value;
                
                if (Usuario == ""){
                    
                    alert("Falta completar el campo de Usuario")
                    window.document.L.txtU.focus();
                    return;
                    
                } else if (Clave == ""){
                    
                    alert("No ah registrado la clave")
                    window.document.L.txtC.focus();
                    return;
                } else {
                    
                    window.document.L.action="<%=request.getContextPath()%>/ControladorUs";
                    window.document.L.method="GET";
                    window.document.L.submit();
                    
                }
                
            }
            
        </script>
        
    </head>
    
    <body background="Fondo.jpg">
        
        
        <div id="banner" class="container header_top"> 
            <center>
             <img src="Imagenes/encabezadov1.jpg" width="100%">
            </center>
        </div>
        
        <div id="containerFooter" class="container footer">
        <div id="footerBottom" class="footer_bottom">
            
            <div id="copy" class="copy">
            
                
                <p> <strong> <big>  Derechos reservados a la institución educativa Leonard Euler </big> </strong> </p>
            
            </div>   
            
            <ul class="social">
                
                <li> <a href="https://www.facebook.com/Leonard-Euler-SJM-Chorrillos-191259414257617/?ref=br_rs"> <i class="fb"> </i> </a> </li>
                
                
                
            </ul>
            
          </div> 
            
        </div>
        
     <center>
         
         <h1></h1>
         
         <form name="L" id="Login">
             
             <h1></h1>
             
             <table border="10" bordercolor="black">
                 
                 
                 <img id="Logo" src="escudo.ico" width="10%"/>
                 
                 <h1></h1>
                 
                 <tr>
                     
                     <td bgcolor="white"> <big> <strong> Usuario </strong> </big> </td>
                     <td> <input type="txt" name="txtU"> </td>
                     
                 </tr>
                 
                 <tr>
                     
                     <td bgcolor="white"> <big> <strong> Clave </strong> </big> </td>
                     <td> <input type="txt" name="txtC"> </td>
                     
                 </tr>
                 
             </table>
             
             <h1></h1>
             
             <table border="5" bordercolor="black">
                 
                 <tr>
                     
                      <p><td> <input type="button" value="Iniciar sesión" onclick="Entrar()"> </td>
                 
                     
                 </tr>
                 
             </table>
             
              <table border="5" bordercolor="black">
                 
                 <tr>
                     
                     <p><td> <input type="button" value="¿Olvidaste tu contraseña?" onclick="Entrar()"> </td>
                 
                     
                 </tr>
                 
             </table>
              
             <%
                   
                   if(request.getAttribute("mensaje")!=null){
                   
                   String msj = (String)request.getAttribute("mensaje");
                   
                   out.print(msj);
                   
               }
                   
               %> 
             
         </form>
        
     </center>
              
    </body>
    
</html>
