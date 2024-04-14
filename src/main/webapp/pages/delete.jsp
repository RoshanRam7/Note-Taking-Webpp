<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        li:first-child {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Note Deletion</h1>
        <p>Successfully deleted note:</p>
        <ul>
            <li>ID: ${deletedNoteId}</li>
            <li>Title: ${deletedNoteTitle}</li>
            <li>Content: ${deletedNoteContent}</li>
        </ul>
    </div>
</body>
</html>
