package com.example.epamproj.command;

import com.example.epamproj.dao.DBException;
import com.example.epamproj.dao.UserDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.SQLException;

public class DeleteCommand implements Command{
    private static Logger log = LogManager.getLogger(DeleteCommand.class.getName());
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws DBException {
        String login = request.getParameter("login");
        log.info("execute(): delete login => " + login);

        try {
            UserDAO.getInstance().deleteByLogin(login);
            log.info("execute(): User \"" + login + "\" was deleted successfully");
        } catch (SQLException e) {
            log.error("execute(): Cannot delete user \"" + login + "\"");
            throw new DBException(e.getMessage(), e.getCause());
        }
        try {
            request.setAttribute("users", UserDAO.getInstance().getAll());
        } catch (SQLException e) {
            log.error("failed to get users from dao");
            throw new DBException(e.getMessage(), e.getCause());
        }

        return "/admin_page.jsp";
    }
}
