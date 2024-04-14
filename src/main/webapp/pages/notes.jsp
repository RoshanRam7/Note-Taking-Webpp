<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Note Taking App - Notes</title>
    <style>
       /* styles.css */

body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    border-bottom: 1px solid #ccc;
    padding: 10px 0;
}

form {
    margin-bottom: 20px;
}

input[type="text"],
textarea {
    width: calc(100% - 22px); /* Adjusted for input padding */
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button[type="submit"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Note Taking App - Notes</h1>
        
        <!-- List of existing notes with update and delete buttons -->
        <ul>
            <c:forEach items="${notes}" var="note">
                <li>
                    <h3>${note.title}</h3>
                    <p>${note.content}</p>
                    
                    <!-- Update Form -->
                    <form action="/notes/updateFormData" method="post">
                        <input type="hidden" name="noteId" value="${note.id}">
                        <label for="title_${note.id}">Title:</label>
                        <input type="text" id="title_${note.id}" name="title" value="${note.title}" required>
                        <br>
                        <label for="content_${note.id}">Content:</label>
                        <textarea id="content_${note.id}" name="content" required>${note.content}</textarea>
                        <br>
                        <button type="submit">Update</button>
                    </form>
                   
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
