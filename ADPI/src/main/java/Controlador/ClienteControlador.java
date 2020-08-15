package Controlador;

import Bean.ClienteBean;
import Datos.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DAN
 */
public class ClienteControlador extends HttpServlet {

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
                   
                    String usuario = new String(request.getParameter("txtusu").getBytes("ISO-8859-1"), "UTF-8");
                    String contraseña = new String(request.getParameter("txtcont").getBytes("ISO-8859-1"), "UTF-8");
                
                    ClienteBean objClienteBean = new ClienteBean();
                    objClienteBean.setUSUARIO(usuario);
                    objClienteBean.setCONTRASEÑA(contraseña);
                    ClienteDAO objClienteDAO = new ClienteDAO();
                    int valido = objClienteDAO.ValidarCliente(objClienteBean);
                    
                    ClienteBean objCliente = objClienteDAO.DatosCliente(objClienteBean);

                    if (valido == 0) {
                        session.invalidate();
                        mensaje = "Las credenciales no son correctas.";
                        request.setAttribute("mensaje", mensaje);
                        getServletContext().getRequestDispatcher("/LoginCliente.jsp").forward(request, response);
                    
                    } else {
                        
                        session.setAttribute("SESION", objCliente);
                        getServletContext().getRequestDispatcher("/Principal.jsp").forward(request, response);
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
