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
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <title>Index Page</title>
</head>
<body>
    <h1><c:out value="${book.title}"/></h1>
    <p>Description: <c:out value="${book.description}"/></p>
    <p>Language: <c:out value="${book.language}"/></p>
    <p>Number of pages: <c:out value="${book.numberOfPages}"/></p>
    <p>
        <a href="/books/${book.id}/edit">Edit Book</a>
        <form action="/books/${book.id}" method="post">
            <input type="hidden" name="_method" value="delete">
            <input type="submit" value="Delete Book">
        </form>   
    </p>
    <a href="/books">Back to All Books</a>
</body>
</html>