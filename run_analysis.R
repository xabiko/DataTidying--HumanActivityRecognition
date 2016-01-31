run_analysis <- function(){
        
        # Loading libraries (UCI HAR Dataset)
        
        library(dplyr)
        
        # Reading tables
        
        subject_train   <- read.table("train/subject_train.txt",col.names = "SUBJECT")
        y_train         <- read.table("train/y_train.txt",col.names = "ACTIVITY")
        X_train         <- read.table("train/X_train.txt")
        subject_test    <- read.table("test/subject_test.txt",col.names = "SUBJECT")
        y_test          <- read.table("test/y_test.txt",col.names = "ACTIVITY")
        X_test          <- read.table("test/X_test.txt")
        features        <- read.table("features.txt")
        activity_labels <- read.table("activity_labels.txt")
        
        # STEP 1: Binding raw data and naming it "COMPLETE"
        
        TRAIN                   <- cbind( subject_train, y_train, X_train )
        TEST                    <- cbind( subject_test , y_test , X_test )
        COMPLETE                <- rbind( TRAIN , TEST )
        
        # Building vector with filtered variables
        
        means                   <- grep( "[Mm]ean" , features$V2)
        stds                    <- grep( "std" , features$V2)
        positionFeatures        <- sort(c(means,stds))
        filteredFeatures        <- sub( "" , "V" , positionFeatures)
        filteredFeatures        <- c("SUBJECT","ACTIVITY",filteredFeatures)
        
        # STEP 2: Selecting filtered variables from COMPLETE table
        
        COMPLETE        <- select_(COMPLETE,.dots = filteredFeatures)
        
        # STEP 3: Labeling ACTIVITY variable values       
        
        COMPLETE$ACTIVITY <- factor(COMPLETE$ACTIVITY, levels = 1:6, labels = activity_labels$V2)
        
        # STEP 4: Re-naming variables
        
        namesFeatures           <- as.character(features[positionFeatures,2])
        namesFeatures           <- sub("^t","time", namesFeatures)
        namesFeatures           <- sub("^f","freq", namesFeatures)
        namesFeatures           <- gsub("-",".", namesFeatures)
        namesFeatures           <- sub("\\()","",namesFeatures)
        namesFeatures           <- c("SUBJECT","ACTIVITY",namesFeatures)
        
        colnames(COMPLETE)      <- namesFeatures
        
        # Final arrange for COMPLETE table
        
        COMPLETE        <- arrange(COMPLETE,SUBJECT,ACTIVITY)
        
        # STEP 5: creating COMPLETE.mean table
        
        COMPLETE.mean           <- aggregate(COMPLETE[,3:88], by=list(COMPLETE$SUBJECT,COMPLETE$ACTIVITY), mean)
        colnames(COMPLETE.mean) <- namesFeatures
        COMPLETE.mean           <- arrange(COMPLETE.mean,SUBJECT)
        
        # Showing results
        
        View(COMPLETE)
        View(COMPLETE.mean)
        
        write.table(COMPLETE.mean, file = "tableStep5", row.names = FALSE)
        
        #return(COMPLETE)
        return(COMPLETE.mean)
        
}