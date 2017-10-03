context("geocode_api")

test_that("Function is not wrong", {
  expect_error(geocode_api(dhaka, "Error in geocode_api(dhaka) : object 'dhaka' not found"))
  
})

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


