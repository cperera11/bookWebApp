package edu.wctc.distjava.cpj.bookwebapp.controller;

import edu.wctc.distjava.cpj.bookwebapp.model.Author;
import edu.wctc.distjava.cpj.bookwebapp.model.AuthorDao;
import edu.wctc.distjava.cpj.bookwebapp.model.AuthorService;
import edu.wctc.distjava.cpj.bookwebapp.model.IAuthorDao;
import edu.wctc.distjava.cpj.bookwebapp.model.MySqlDataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AuthorController", urlPatterns = {"/authorController"})
public class AuthorController extends HttpServlet {

    public static final String ACTION = "action";
    public static final String DISPLAY_LIST = "displayList";
    public static final String DELETE = "delete";
    public static final String EDIT = "edit";
    public static final String ADD = "add";
    private static final String UPDATE = "update";
    private static final String SAVE = "Save";
    private String driverClass;
    private String url;
    private String userName;
    private String password;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init() throws ServletException {
        driverClass = getServletContext()
                .getInitParameter("db.driver.class");
        url = getServletContext()
                .getInitParameter("db.url");
        userName = getServletContext()
                .getInitParameter("db.username");
        password = getServletContext()
                .getInitParameter("db.password");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String destination = "/authorList.jsp"; // default

        try {
            String action = request.getParameter(ACTION);
            String authorId = request.getParameter("authorId");
            String authorName = request.getParameter("authorName");
            String dateAdded = request.getParameter("dateAdded");
            String formType = request.getParameter("formType");
            String buttonAction = request.getParameter("buttonAction");

            AuthorService authorService = new AuthorService(
                    new AuthorDao(driverClass, url, userName, password, new MySqlDataAccess()));

            if (action.equalsIgnoreCase(DISPLAY_LIST)) {
                refreshAuthorList(authorService, request);

            } else if (action.equalsIgnoreCase(DELETE)) {
                authorService.removeAuthorById(authorId);
                refreshAuthorList(authorService, request);

            } else if (action.equalsIgnoreCase(EDIT)) {

                Author authorRec = authorService.findAuthor(authorId);
                request.setAttribute("authorRec", authorRec);
                destination = "/editAuthor.jsp";

            } else if (action.equalsIgnoreCase(ADD)) {
                String date = authorService.getCurrentDate();
                request.setAttribute("date_added", date);
                destination = "/addAuthor.jsp";

            } else if (action.equalsIgnoreCase(UPDATE)) {
                if (buttonAction.equalsIgnoreCase(SAVE)) {
                    if (formType.equalsIgnoreCase("recEdit")) {

                        authorService.updateAuthorById(Arrays.asList(authorName, dateAdded), authorId);

                    } else if (formType.equalsIgnoreCase("recAdd")) {

                        authorService.addAuthor(Arrays.asList((authorName), dateAdded));
                    }
                }
                refreshAuthorList(authorService, request);
                destination = "/authorList.jsp";

            }
        } catch (Exception e) {
            destination = "authorList.jsp";
            request.setAttribute("errMessage", e.getMessage());
        }

        RequestDispatcher view
                = request.getRequestDispatcher(destination);

        view.forward(request, response);

    }

    private void refreshAuthorList(AuthorService authorService, HttpServletRequest request)
            throws ClassNotFoundException, SQLException {
        List<Author> authorList;
        authorList = authorService.getAuthorList();
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
