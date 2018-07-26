# eMasters connections API

Author : Houssem Hajlaoui (@venatoria)

## Purpose

This REST API creates the interface to execute the DOTA2/Steam connection functions from eMasters.  

## Routes

This API has one endpoint :

-   **POST '/connect'**<br>
    This endpoint will be called only from the Lambda dispatcher.

## Structure

The Node API is structured around these files :

-   **index.js** (main app file). The api routes are defined there
-   **packages.json** (definition of the node dependencies)
-   **action.js** The eMasters functions that handles the DOTA2/Steam connection

## Components/Packages

Our API uses the following Node JS packages :

-   Express
-   bodyParser
-   request
-   steam
-   dota2 
