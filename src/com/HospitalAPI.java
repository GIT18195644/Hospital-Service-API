package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HospitalAPI")
public class HospitalAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Hospital hospital = new Hospital();

	public HospitalAPI() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String output = hospital.insertHospital(request.getParameter("Hospital_id"),
				request.getParameter("Hospital_name"), request.getParameter("Hospital_location"),
				request.getParameter("Register_no"), request.getParameter("Email"), request.getParameter("Phone"));
		response.getWriter().write(output);
	}

	@SuppressWarnings("rawtypes")
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = hospital.updateHospital(paras.get("hidItemIDUpdate").toString(),
				paras.get("Hospital_name").toString(), paras.get("Hospital_location").toString(),
				paras.get("Register_no").toString(), paras.get("Email").toString(), paras.get("Phone").toString());
		response.getWriter().write(output);
	}

	@SuppressWarnings("rawtypes")
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = hospital.deleteHospital(paras.get("Hospital_id").toString());
		response.getWriter().write(output);
	}

	@SuppressWarnings("rawtypes")
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
			System.err.println(e);
		}
		return map;
	}

}
