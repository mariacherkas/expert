<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <link rel="stylesheet" href="{$templateWebPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="../../www/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../../www/templates/admin/js/admin.js"></script>
</head>
<body>

<div id="header" style="background-color: #597355">
    <h1>Administration</h1>
</div>

<main class="d-flex h-100 py-3 my-4">
    <div class="container">
        {include file='adminleftcolumn.tpl'}
        <div class="card">
            <div id="centerColumn" class="card-body">