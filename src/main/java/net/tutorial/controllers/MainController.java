package net.tutorial.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import net.tutorial.utilities.ObjectStorageService;

@WebServlet({ "home", "" })
@MultipartConfig
public class MainController extends HttpServlet {

	RequestDispatcher dispatcher;
	ObjectStorageService os;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.os = new ObjectStorageService();

		List<String> documents = this.os.getDocumentList("Documents");
		req.setAttribute("documents", documents);

		dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/home.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		final Part filePart = req.getPart("file");

		this.os = new ObjectStorageService();

		this.os.uploadFile("Documents", filePart);

		List<String> documents = this.os.getDocumentList("Documents");
		req.setAttribute("documents", documents);

		dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/home.jsp");
		dispatcher.forward(req, resp);
	}

}
