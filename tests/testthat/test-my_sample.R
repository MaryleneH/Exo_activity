test_that("my sample dataset has the good number of lines", {

  dataset_test <- data.frame(Name = c("Jack","Jay","Mark","Sam"),
                             Month = c("Jan","Jan","May","July"),
                             Age = c(12,10,15,13))

  expect_equal(nrow(my_sample(dataset_test,3)), 3)
})
