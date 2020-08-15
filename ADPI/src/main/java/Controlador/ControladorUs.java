package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.UsuarioBean;
import Datos.DatosUs;
import javax.servlet.http.HttpSession;

public class ControladorUs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session;
        session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opcad = new String(request.getParameter("op").getBytes("ISO-8859-1"), "UTF-8");
        int op = Integer.parseInt(opcad);
       
        try {
            switch (op) {
                case 1: {
                    session = request.getSession();       
                    String mensaje = "";
                   
                    String usuario = new String(request.getParameter("txtU").getBytes("ISO-8859-1"), "UTF-8");
                    String contraseña = new String(request.getParameter("txtC").getBytes("ISO-8859-1"), "UTF-8");
                
                    UsuarioBean objUsuarioBean = new UsuarioBean();
                    objUsuarioBean.setCORREO(usuario);
                    objUsuarioBean.setCONTRASEÑA(contraseña);
                    DatosUs objDatosUs = new DatosUs();
                    int valido = objDatosUs.ValidarUsuario(objUsuarioBean);
                    
                    UsuarioBean objUsuario = objDatosUs.DatosUsuario(objUsuarioBean);

                    if (valido == 0) {
                        session.invalidate();
                        mensaje = "Las credenciales no son correctas.";
                        request.setAttribute("mensaje", mensaje);
                        getServletContext().getRequestDispatcher("/LoginEmpleado.jsp").forward(request, response);
                    
                    } else {
                        
                        session.setAttribute("SESION", objUsuario);
                        getServletContext().getRequestDispatcher("/Mantenimiento.jsp").forward(request, response);
                    }
                    break;
                }
            }
            if (session.getAttribute("SESION") == null ) {
                out.println("1");
            }
        } catch (Exception e) {
            
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
