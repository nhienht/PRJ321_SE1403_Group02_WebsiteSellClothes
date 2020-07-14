<%-- 
    Document   : header
    Created on : Jul 7, 2020, 12:56:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
      
           
        <div class=" row flexAlignCenter rowFlexMargin" style="background-color: #F5A9BC">
                   
                    <div class="search-top-bar hidden-xs hidden-sm col-sm-12">
                        <div class="wpo-wrapper-search">
                            <form action="/search" class="search-product ultimate-search" style="float: right">
                                <input type="hidden" name="type" value="product">
                                <input required="" id="inputSearchAuto-desktop" name="q" maxlength="40" autocomplete="off" class="search-product-input" type="text" size="20" placeholder="Search">
                                <button type="submit" class="btn-search-product">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </form>
                            <div id="ajaxSearchResults-mb" class="smart-search-wrapper ajaxSearchResults">
                                <div class="resultsContent"></div>
                            </div>
                        </div>
                    </div>
                </div>
          
       
    </body>
</html>
