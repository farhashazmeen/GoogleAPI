library("httr", lib.loc="~/R/win-library/3.4")
library("jsonlite", lib.loc="~/R/win-library/3.4")


#' Geocoding with Google API
#'
#' This function returns the location details.
#' 
#' @param u_address desired location which will return results.
#' @param return.call the api coding format json or xml.
#'
#' @return returns print output of full address and latitude , longitude.
#' @export
#' @import 
#' @references \href{https://developers.google.com/maps/documentation/geocoding/intro}{GoogleGeoAPI}
#'
#' @examples geocode_api("dhaka")
#'

geocode_api <- function(u_address, return.call = "json") {

 
  
  a <- length(u_address)
  dm <- matrix(ncol = 4, nrow = a)
  
  for (i in 1:a)
  {
    root <- "https://maps.googleapis.com/maps/api/geocode/"
    url <-paste(root,return.call,"?address=",u_address[i],sep = "","&key=AIzaSyB4MJcwDRe_5UspjEm0lY233-KGKtkERPA")
    resp <- GET(url)
    
    parsed <-
      jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)
    
    if (http_type(resp) != "application/json") {
      stop("API didn't return json", call. = FALSE)
    }
    
    if (http_error(resp)) {
      stop(
        sprintf(
          "Github API request failed [%s]\n%s\n%s",
          status_code(resp),
          parsed$message,
          parsed$documentation_url
        ),
        call. = FALSE
      )
    }
    
    latlong <- as.array(parsed[[1]][[1]][[3]][[1]][[1]])
    fulladd <- as.character(parsed[[1]][[1]][[2]])
    dm[i, ] <- c(u_address[i], latlong[[1]], latlong[[2]], fulladd)
    dk <- as.data.frame(dm)
    names(dk) <- c("Location", "Latitude", "Longitude", "FullAdrress")
    cat("The full address of ", u_address[i], "is", fulladd, ".")
    cat(
      "\nThe latitude of",
      u_address[i],
      "is",
      latlong[[1]],
      "and longitude is ",
      latlong[[2]],
      ".\n\n"
    )
    
    
  }
  return(dk)
}
geocode_api("linkoping")