<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Note Taking App - Home</title>
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
        <h1>Note Taking App - Home Page</h1>
        
        <!-- Display the current note ID -->
        <p>Current Note ID: ${nextNoteId}</p>
        
        <!-- Form for creating a new note -->
        <form action="/notes" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <br>
            <label for="content">Content:</label>
            <textarea id="content" name="content" required></textarea>
            <br>
            <button type="submit">Create</button>
        </form>
        

        

<form action="/notes/update" method="get">
    <label for="noteId">Enter Note ID to Update:</label>
    <input type="text" id="noteId" name="noteId" required>
    <button type="submit">Update Note</button>
</form>

<form action="/notes/delete" method="post">
    <label for="noteId">Enter Note ID to delete:</label>
    <input type="text" id="noteId" name="noteId" required>
    <button type="submit">Delete</button>
</form>

    </div>
</body>
</html>
