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
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Expert - Internet shop</a>
    <button class="navbar-toggler" type="button" style="background: #F29D52" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown" style="">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                           aria-haspopup="true" aria-expanded="false">Products</a>
                        <div class="dropdown-menu" style="width: 200px;">
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
      <form class="d-flex"  id="search">
        <input class="form-control me-sm-2" type="search" placeholder="Search" name="search" aria-label="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="button" onclick="search1();" value="Search" style="background-color: #F29D52;">Search</button>
      </form>
    </div>
  </div>
</nav>
</header>

<main class="d-flex h-100 my-4" style="">
    <div class="container-fluid" style="">
    <div class="row">
        {include file='leftcolumn.tpl'}
        <div class="col">
        <div class="container">
        <div id="centerColumn" class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3">
