<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$pageTitle}</title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript" src="../../www/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../../www/js/main.js"></script>

    <link rel="stylesheet" href="{$templateWebPath}/css/main.css" type="text/css">
</head>

<body>

<header id="header">
 <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #597355;"> 
        <div class="container">
            <a class="navbar-brand" href="#">Expert - Internet Shop</a>
            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                           aria-haspopup="true" aria-expanded="false">Products</a>
                        <div class="dropdown-menu">
                            <a href="/?controller=index&count=0"
                               class="dropdown-item">All products</a>
                            {foreach $rsCategories as $item}
                                <a href="/?controller=category&id={$item['id']}"
                                   class="dropdown-item">{$item['name']}</a>
                                {if isset($item['children'])}
                                    {foreach $item['children'] as $itemChild}
                                        <a href="/?controller=category&id={$itemChild['id']}"
                                           class="dropdown-item">{$itemChild['name']}</a>
                                    {/foreach}
                                {/if}
                            {/foreach}
                        </div>
                    </li>
                    {if isset($arUser)}
                        <li class="nav-item">
                            <a class="nav-link" href="/?controller=user">{$arUser['displayName']}</a>
                        </li>
                    {else}
                        <li class="nav-item">
                            <a class="nav-link" href="/?controller=user&action=registration">Registration</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/?controller=user&action=authorization">Authorization</a>
                        </li>
                    {/if}
                    <li class="nav-item">
                        <a class="nav-link" href="/?controller=index&action=aboutus&leng=en">About us</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/?controller=card">Basket
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-cart4" viewBox="0 3 16 16">
                                <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"></path>
                            </svg>
                        </a>
                    </li>
                </ul>
                <form class="d-flex" id="search">
                    <input class="form-control me-sm-2"  type="text" name="search" placeholder="Search">
                    <input class="btn btn-secondary my-2 my-sm-0" type="button" onclick="search1();" value="Search" style="background-color: #F29D52;">
                </form>
            </div>
        </div>
    </nav>
    </div>
</header>

<main class="d-flex h-100 py-3 my-4">
    <div class="container">
        {include file='leftcolumn.tpl'}
        <div class="card">
        <div id="centerColumn" class="card-body">