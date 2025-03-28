<%@ page import="uk.ac.ucl.model.Note" %>
<%@ page import="uk.ac.ucl.model.IndexEntryPath" %>
<%@ page import="uk.ac.ucl.model.TextFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<% Note note = (Note) request.getAttribute("noteObj"); %>

<head>
    <meta charset="UTF-8">
    <title>Note: <%=note.getTitle()%></title>
    <jsp:include page="meta.jsp"/>
</head>

<body>
    <jsp:include page="header.jsp"/>

    <h1>
        Note: <span style="font-weight: normal"><%=note.getTitle()%></span>
    </h1>

    <%
        IndexEntryPath currentPath = (IndexEntryPath) request.getAttribute("currentPath");
        String editHref = "/noteEditView.html?path=" + currentPath.getURLEncoding();
        String backHref = "/indexView.html?path=" + currentPath.getParentPath().getURLEncoding();
        String deleteHref = "/deleteNote.html?path=" + currentPath.getURLEncoding();
    %>

    <a class="button ui-button" href=<%=backHref%>>
        Back
    </a>
    <a class="button ui-button" href=<%=editHref%>>
        Edit
    </a>
    <a class="button ui-button" href=<%=deleteHref%>>
        Delete
    </a>

    <div class="noteContents"><%=TextFormatter.markdownToHTML(note.getContents())%></div>
</body>
</html>