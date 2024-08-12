library(zen4R)
 
zenodo <- ZenodoManager$new(
  token = Sys.getenv("ZENODO_TOKEN"), 
  logger = "INFO" # use "DEBUG" to see detailed API operation logs, use NULL if you don't want logs at all
)

toy_data_new <- data.frame(a = sample(10000, 20), b = sample(10000, 20))
write.csv(toy_data_new, "toy_data_actions.csv")
myrec2 <- zenodo$getDepositionById("13307920")
myrec2 <- zenodo$depositRecordVersion(myrec2, delete_latest_files = TRUE, files = "toy_data_actions.csv", publish = TRUE)

