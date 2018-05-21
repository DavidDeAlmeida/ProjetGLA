<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/projetgla", "root", "root");
PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT * from info_gene order by date_publi desc");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	String idI=rs.getString("ID_INFOGENE");
	String date=rs.getString("DATE_PUBLI");
	String titre=rs.getString("TITRE");
	String texte=rs.getString("TEXTE");
	String idG=rs.getString("ID_GEST");
	out.println("idI : "+idI+" date : "+date+" titre : "+titre+" texte : "+texte+" idG : "+idG+"<hr>");
}
%>