library(zen4R)
 
zenodo <- ZenodoManager$new(
  token = Sys.getenv("ZENODO_TOKEN"), 
  logger = "INFO" # use "DEBUG" to see detailed API operation logs, use NULL if you don't want logs at all
)

#myrec <- zenodo$createEmptyRecord()
myrec <- zenodo$getDepositionById("13307920")

myrec$setTitle("toyzen")

myrec$setResourceType("software")
myrec$setPublicationDate(Sys.Date())

myrec <- zenodo$depositRecord(myrec)

zenodo$uploadFile("toy_data.csv", record = myrec)

zenodo$publishRecord(myrec$id)


# To create new version

toy_data_new <- data.frame(a = 20:40, b = 50:70)
write.csv(toy_data_new, "toy_data2.csv")
myrec2 <- zenodo$getDepositionById("13307920")
myrec2 <- zenodo$depositRecordVersion(myrec2, delete_latest_files = TRUE, files = "toy_data2.csv", publish = TRUE)


toy_data_new2 <- data.frame(a = 90:110, b = 50:70)
write.csv(toy_data_new2, "toy_data3.csv")
myrec3 <- zenodo$getDepositionById("13307920")
myrec3 <- zenodo$depositRecordVersion(myrec3, delete_latest_files = TRUE, files = "toy_data3.csv", publish = TRUE)


# Scrap
myrec2$setPublicationDate(Sys.Date())
myrec2$setResourceType("software")
