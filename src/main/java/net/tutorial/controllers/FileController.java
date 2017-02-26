package net.tutorial.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tutorial.utilities.ObjectStorageService;

@WebServlet("file")
public class FileController extends HttpServlet {
	RequestDispatcher dispatcher;
	ObjectStorageService os;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("fn");
		String action = req.getParameter("action");

		this.os = new ObjectStorageService();

		if (action.equals("delete")) {
			this.os.deleteFile("Documents", fileName);
			
			List<String> documents = this.os.getDocumentList("Documents");
			req.setAttribute("documents", documents);

			dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/home.jsp");
			dispatcher.forward(req, resp);

		} else {
			ServletOutputStream out = resp.getOutputStream();
			InputStream in = this.os.downloadFile("Documents", fileName);
			resp.setHeader("Content-disposition", "attachment; filename=\"" + fileName + "\"");

			byte[] buffer = new byte[1024];

			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			out.close();
			in.close();
		}
	}
}
