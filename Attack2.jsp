<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacker</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	color: #FF0000;
}
.style2 {
	font-size: 18px;
	color: #FF0000;
}
.style3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1">WebCloud Web Based Cloud Storage for  <br />
        Secure Data Sharing across Platforms</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home </span></a></li>
          <li><a href="DO_Login.jsp"><span>DATA OWNER</span></a></li>
          <li><a href="DU_Login.jsp">END USER </a><a href="about.html"></a></li>
          <li><a href="C_Login.jsp"><span>CLOUD SERVICE PROVIDERS</span></a></li>
          <li><a href=""></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Attacker</span></h2>
          <p>&nbsp;</p>
           <%
	
	int i;
 	String s2, s3, s4, s5, s6, s7, s12="", s13="", s14="", s15="", s16="";
	try {
	
			String ename=(String)application.getAttribute("uname");
			String file = request.getParameter("t1");
			String on = request.getParameter("t12");
				String cn = request.getParameter("cl");
			String cont = request.getParameter("text");//ch
			String keys = "ef50a0ef2c3e3a5f";
			String h1 = "";
			String filename = "filename.txt";

            String oname="Added Malacious Data";

			i = 1;

			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(cont
					.getBytes()));
			//D:/Workspace Jayam/SelCSp/WebContent
			PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));

			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);

			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}

			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			Cipher encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();

			Key pubKey = kp.getPublic();

			byte[] pub = pubKey.getEncoded();
			//				System.out.println("PUBLIC KEY" + pub);

			String pk = String.valueOf(pub);
			String type = "Malicious Data Attack";
			String strQuery3 = "Select * FROM cloudserver where fname='"
				+ file + "'";

		Statement sta = connection.createStatement();

		ResultSet rsa = sta.executeQuery(strQuery3);
		if (rsa.next()) {
			i = rsa.getInt(1);//id
			s12 = rsa.getString(3);//fname
			s13 = rsa.getString(2);//on
			s14 = rsa.getString(5);//mac
			s15 = rsa.getString(6);//sk
			s16 = rsa.getString(7);//rank
			
			}
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			
				
				String strQuery2 = "update  cloudserver set ct='"+cont+"', trapdoor='" + h1 + "',sk='" + pk
						+ "' where fname='" + file + "' ";
				connection.createStatement().executeUpdate(strQuery2);
			

			String strQuery25 = "insert into attacker(user,fname,sk,dt,attacktype) values('"
					+ on
					+ "','"
					+ file
					+ "','"
					+ pk
					+ "','" + dt + "','"
					+ type
					+ "')";
			connection.createStatement().executeUpdate(strQuery25);
%>






<p>
<h1 >Attacked Success Fully!!!</h1>
</p>
<br />

<%
	connection.close();


	} catch (Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        </div>
        </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="index.html">Home</a></li>
          <li><a href="C_Login.jsp"><span>CLOUD SERVICE PROVIDERS</span></a></li>
          <li><a href="DU_Login.jsp">END DATA OWNER </a><a href="about.html"></a></li>
          <li><a href="DO_Login.jsp"><span>USERS</span></a></li>
          </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="clr style2">WebCloud Web Based Cloud Storage for Secure Data Sharing across Platforms</div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
