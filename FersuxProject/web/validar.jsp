<%@page import="model.bd.Usuario"%>
<%
    Usuario u = (Usuario) request.getSession().getAttribute("usuario");

    if (u == null) {
        request.getSession().setAttribute("error", new Error("E-Mail o Contrase�a Invalidos"));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>