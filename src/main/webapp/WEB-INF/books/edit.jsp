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
    <%@ page isErrorPage="true" %> <!--THIS ALLOWS US TO RENDER THIS PAGE ON A PUT REQUEST--> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
    <title>Index Page</title>
</head>
<body>
    <h1>Edit Book</h1>
    <form:form action="/books/${book.id}" method="post" modelAttribute="book">
        <input type="hidden" name="_method" value="put">
        <p>
            <form:label path="title">Title</form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
        </p>
        <p>
            <form:label path="description">Description</form:label>
            <form:errors path="description"/>
            <form:textarea path="description"/>
        </p>
        <p>
            <form:label path="language">Language</form:label>
            <form:errors path="language"/>
            <form:input path="language"/>
        </p>
        <p>
            <form:label path="numberOfPages">Pages</form:label>
            <form:errors path="numberOfPages"/>     
            <form:input type="number" path="numberOfPages"/>
        </p>    
        <input type="submit" value="Submit"/>
    </form:form>
</body>
</html>