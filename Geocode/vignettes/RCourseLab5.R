## ---- eval=FALSE---------------------------------------------------------
#  if (httr::http_type(resp) != "application/json") {
#        stop("API didn't return json", call. = FALSE)
#      }
#  

## ----eval=FALSE----------------------------------------------------------
#   if (httr::http_error(resp)) {
#        stop(
#          sprintf(
#            "Github API request failed [%s]\n%s\n%s",
#            httr::status_code(resp),
#            parsed$message,
#            parsed$documentation_url
#          ),
#          call. = FALSE
#        )
#      }

## ----eval= FALSE---------------------------------------------------------
#   latlong <- as.array(parsed[[1]][[1]][[3]][[1]][[1]])
#      fulladd <- as.character(parsed[[1]][[1]][[2]])
#      dm[i, ] <- c(u_address[i], latlong[[1]], latlong[[2]], fulladd)

## ----eval= FALSE---------------------------------------------------------
#    return(dk)

## ---- eval=FALSE---------------------------------------------------------
#    Location   Latitude  Longitude       FullAdrress
#    1 linkoping 58.4531271 15.7461581 Linköping, Sweden

