package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class Hospital {
	private Connection connect() {

		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ayurwedha?serverTimezone=UTC", "root", "");

			// For testing
			System.out.print("Successfully connected");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String insertHospital(String Hospital_id, String Hospital_name, String Hospital_location, String Register_no,
			String Email, String Phone) {

		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}

			// create a prepared statement
			String query = "INSERT INTO hospitalmanagement(Hospital_id, Hospital_name, Hospital_location, Register_no, Email, Phone) VALUES (?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, Hospital_id);
			preparedStmt.setString(2, Hospital_name);
			preparedStmt.setString(3, Hospital_location);
			preparedStmt.setString(4, Register_no);
			preparedStmt.setString(5, Email);
			preparedStmt.setString(6, Phone);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newHospital = readHospital();

			output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}";

			System.err.println(e.getMessage());

		}

		return output;

	}

	public String readHospital() {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for reading.";
			}

			// Prepare the html table to be displayed
			output = "<table class=\"table\"><thead><tr><th scope=\"col\">Hospital Name</th><th scope=\"col\">Location</th>"
					+ "<th scope=\"col\">Register No</th><th scope=\"col\">Email</th><th scope=\"col\">Phone</th><th scope=\"col\">Update</th><th scope=\"col\">Remove</th></tr></thead>";

			String query = "SELECT * FROM hospitalmanagement";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {
				String Hospital_id = rs.getString("Hospital_id");
				String Hospital_name = rs.getString("Hospital_name");
				String Hospital_location = rs.getString("Hospital_location");
				String Register_no = rs.getString("Register_no");
				String Email = rs.getString("Email");
				String Phone = rs.getString("Phone");

				// Add into the html table
				output += " <tr><td>" + Hospital_name + "</td>";
				output += "<td>" + Hospital_location + "</td>";
				output += "<td>" + Register_no + "</td>";
				output += "<td>" + Email + "</td>";
				output += "<td>" + Phone + "</td>";

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td> "
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-hospitalid='"
						+ Hospital_id + "'>" + "</td></tr></tbody></table>";
			}

			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateHospital(String Hospital_id, String Hospital_name, String Hospital_location, String Register_no,
			String Email, String Phone) {

		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for updating.";
			}

			// create a prepared statement
			String query = "UPDATE hospitalmanagement SET Hospital_name=?, Hospital_location=?, Register_no=?, Email=?, Phone=? WHERE Hospital_id=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, Hospital_name);
			preparedStmt.setString(2, Hospital_location);
			preparedStmt.setString(3, Register_no);
			preparedStmt.setString(4, Email);
			preparedStmt.setString(5, Phone);
			preparedStmt.setString(6, Hospital_id);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newHospital = readHospital();

			output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";

		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}";

			System.err.println(e.getMessage());
		}

		return output;

	}

	public String deleteHospital(String Hospital_id) {

		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "DELETE FROM hospitalmanagement WHERE Hospital_id=?";

			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, Hospital_id);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newHospital = readHospital();

			output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";

		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";
			System.err.println(e.getMessage());

		}

		return output;

	}
}
