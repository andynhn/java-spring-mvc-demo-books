<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/time.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!-- <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> -->
    <title>Index Page</title>
</head>
<body>
    <h1>All Books</h1>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Language</th>
                <th>Number of Pages</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${books}" var="book">
            <tr>
                <td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
                <td><c:out value="${book.description}"/></td>
                <td><c:out value="${book.language}"/></td>
                <td><c:out value="${book.numberOfPages}"/></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/books/new">New Book</a>
</body>
</html>