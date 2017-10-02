---
title: <center>"Geocoding with Google API" </center>
subtitle: <center>"farch587@student.liu.se, syesh076@student.liu.se"</center>
author: <center>"Farhana Chowdhury Tondra, Syeda Farha Shazmeen" </center>
date: "2017-10-02"
output: rmarkdown::html_vignette
vignette: >
 %\VignetteIndexEntry{Geocoding with Google API}
  %\VignetteEngine{knitr::knitr}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}{inputenc}
  
---

**RCourseLab5** is entitled for the students who have completed lab4.This lab is based on API and Shiny App. The package **Geocode** contains one function **geocode_api** and one shiny package based on that function and a testcase including **vignette** manual.The package is using Google's geocode API for fetching the latitude, longitude and complete address of user's desired location.

As usual to other packages there is a .R script for the API calling inside the **/R** folder, a scripted testcase for testing in **/test/testthat** folder, all .Rd files inside **/man** folder and .Rmd file inside the **/vignettes** folder. 

##API.R
geocode_api() function takes two arguments to call the API but the user is sending only the address argument as "u_address". Another paramter **return.call="json"** that will append with the URL.
Two library functions **httr** and **jsonlite** is loaded. User can send any 
number of locations. 

**dm** A matrix for containing the parsed data.    

**dk** A dataframe for returning the location, latitude , longitude & fulladdress.   

**root** The fixed url of Google's geocode API HTTP request.    

**url** Creating a full URL for calling API using the return.call & address & key parameters.   

**key** Key is to use the Google Maps Geocoding API which we can add in our app.    

**resp** The GET method from *httr* package retrieves the desired information using the url.     

**parsed** parsed is using the method *jsonlite::fromJSON* function to convert JSON data (google's response) in R objects.    




```r
if (httr::http_type(resp) != "application/json") {
      stop("API didn't return json", call. = FALSE)
    }
```

This above mentioned chunk is used  to check the JSON response from geocode API. 


```r
 if (httr::http_error(resp)) {
      stop(
        sprintf(
          "Github API request failed [%s]\n%s\n%s",
          httr::status_code(resp),
          parsed$message,
          parsed$documentation_url
        ),
        call. = FALSE
      )
    }
```

The above mentioned chunk is used to check the response status of geocode API.

Below chunks is self explanatory where the lalong is retriving the latitude and longitude of the location as an array.The fulladd is retriving the complete address of the location. the matrix dm[i,] is taking the values as input of dm matrix.


```r
 latlong <- as.array(parsed[[1]][[1]][[3]][[1]][[1]])
    fulladd <- as.character(parsed[[1]][[1]][[2]])
    dm[i, ] <- c(u_address[i], latlong[[1]], latlong[[2]], fulladd)
```

Finally the output is displayed

```r
  return(dk)
```


##test_geocode.R

Testcase file contains 4 testcases for checking the functionality of the package.

###1. Function is not wrong : 
If user gives the input without double quotation " " , then the function will throw an error.

###2. Function has correct output :
It checks whether the output is correct or not.

###3. Return method works:
This case checks whether the output is a dataframe.

###4. Return method result:
Result contains the location,latitude , longitude and full address of the desired place.


##Shiny package

Shiny package is a wrap up of the original API connecting function but with a visualisation effect.It has ui.R and server.R file.


##Documentation using Roxygen:

Package contains one .R file for package documentation named as Geocode.R. The roxygen skeleton made the documentation of API.R. So inside /man folder there are three files named as Geocode.Rd , one geocode_api.Rd and one Geocode-package.Rd. 


###NAMESPACE:
This file is unmodified.

###DESCRIPTION:
This file is modified as per user details.Due to build and check issues library packages needed to run the package is added as *Suggests*.
x

##Examples:
geocode_api("linkoping")
geocode_api("boston")

##Output:
 
  

```r
  Location   Latitude  Longitude       FullAdrress
  1 linkoping 58.4531271 15.7461581 Linköping, Sweden
```

This package can be installed using below command    

*devtools::install_github("tondralok/GoogleAPI/Geocode")*

##References:
The study material for this lab given below.

https://github.com/tondralok/GoogleAPI/tree/master/Geocode
https://developers.google.com/maps/documentation/geocoding/start


