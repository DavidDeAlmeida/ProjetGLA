<%
	String idPage = null;
	int nbId = 1;
	if (request.getParameter("id") != null)
	{
		idPage = request.getParameter("id");
		if (idPage.equals("Accueil"))
		{
			nbId = 1;
		}
		else if (idPage.equals("ressources"))
		{
			nbId = 2;
		}
		else if (idPage.equals("espaceAdherent"))
		{
			nbId = 3;
		}
		else
		{
			nbId = 4;
		}
	}
	else
	{
		idPage = "Accueil";
	}
	switch(nbId)
	{
		case 1:
			%><jsp:include page='accueil.jsp'/><%
			break;
		case 2:
			%><jsp:include page='ressources.jsp'/><%
			break;
		case 3:
			%><jsp:include page='espaceAdherent.jsp'/><%
			break;
		case 4:
			%><jsp:include page='contact.jsp'/><%
			break;
		default:
			%><jsp:include page='accueil.jsp'/><%
	}
%>