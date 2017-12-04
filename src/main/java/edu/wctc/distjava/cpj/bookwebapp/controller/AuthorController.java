package edu.wctc.distjava.cpj.bookwebapp.controller;

import edu.wctc.distjava.cpj.bookwebapp.model.Author;
import edu.wctc.distjava.cpj.bookwebapp.model.AuthorService;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AuthorController", urlPatterns = {"/authorController"})
public class AuthorController extends HttpServlet {

    public static final String ACTION = "action";
    public static final String LIST_ACTION = "displayList";
    public static final String DELETE_ACTION = "Delete";
    public static final String SAVE = "Save";
    public static final String EDIT_ACTION = "Edit";
    public static final String SAVEORCANCEL_ACTION = "SaveOrCancel";
    public static final String ADD_ACTION = "Add";
    public static final String AUTHOR_NAME = "aName";
    public static final String DATE_ADDED = "aDateAdded";
    public static final String REC_UPDATE = "recUpdate";
    public static final String REC_ADD = "recAdd";
    public static final String ID = "Id";
    private static final long serialVersionUID = 1L;

    @EJB
    private AuthorService authorService;

     @Override
    public void init() throws ServletException {

    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String destination = "/authorList.jsp"; // default

        try {
            String action = request.getParameter(ACTION);
            String aName = request.getParameter(AUTHOR_NAME);
            String aDateAdded = request.getParameter(DATE_ADDED);
            String id = request.getParameter(ID);
            String buttonAction = request.getParameter("button_action");
            String formType = request.getParameter("formType");
            
             Author author;
           if (action.equalsIgnoreCase(LIST_ACTION)) {
                refreshAuthorList(authorService, request);
            } else if (action.equalsIgnoreCase(DELETE_ACTION)) {
               
                    authorService.removeAuthorById(id);
                    refreshAuthorList(authorService, request);
               
                                  
            }  else if (action.equalsIgnoreCase(EDIT_ACTION)) {
               
                author = authorService.find(new Integer(id));
                request.setAttribute("author", author);
                destination = "/editAuthor.jsp";

            } else if (action.equalsIgnoreCase(ADD_ACTION)) {
                request.setAttribute("date", authorService.currentDate());
                destination = "/addAuthor.jsp";

            }  else if (action.equalsIgnoreCase(SAVEORCANCEL_ACTION)) {
                if (buttonAction.equalsIgnoreCase(SAVE)) {
                    if (formType.equalsIgnoreCase(REC_UPDATE)) {
                        authorService.updateAuthorById(Arrays.asList(aName, aDateAdded), id);
                    } else {
                        
                        authorService.addAuthor(Arrays.asList(aName, aDateAdded));
                  }

                }
                refreshAuthorList(authorService, request);
                
            }
        } catch (Exception e) {
            destination = "/error.jsp";
            request.setAttribute("errMessage", e.getMessage());
        }

        RequestDispatcher view
                = request.getRequestDispatcher(destination);

        view.forward(request, response);

    }

    private void refreshAuthorList(AuthorService authorService, HttpServletRequest request)
            throws ClassNotFoundException, SQLException, Exception {
        List<Author> authorList;
       
            authorList = authorService.getList();
    
        request.setAttribute("authorList", authorList);
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
