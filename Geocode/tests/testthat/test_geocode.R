context("geocode_api")

test_that("Function is not wrong", {
  expect_error(geocode_api(dhaka, "Error in geocode_api(dhaka) : object 'dhaka' not found"))
  
})

test_that("Function has correct output", {
  expect_output(geocode_api("dhaka"),
                "The full address of  dhaka is Dhaka, Bangladesh ")
  expect_output(geocode_api("dhaka"),
                "The latitude of dhaka is 23.9 and longitude is  90.5091")
  
})

# test_that("Return method works", {
#   expect_true(is.data.frame(geocode_api("lund")))
#   
# })

test_that("Return method result", {
  expect_output(
    geocode_api("dhaka") %in% data.frame(
      Location = "dhaka",
      Latitude = 23.9000025,
      Longitude = 90.5091047,
      FullAdrress = "Dhaka, Bangladesh"
    )
  )
})
