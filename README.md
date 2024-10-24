# G-C-DATA-Proj
# Repository Overview

This repository contains an R script and associated files used to clean and analyze a dataset collected from accelerometers on Samsung Galaxy S smartphones. The project demonstrates the ability to collect, clean, and organize data into a tidy format for further analysis.

# Files in this Repository

    1. run_analysis.R
        This R script performs several data cleaning and transformation tasks:
            Merges the training and test datasets into one unified dataset.
            Extracts measurements for mean and standard deviation for each observation.
            Applies descriptive activity names to replace activity codes in the dataset.
            Labels the dataset with descriptive variable names to make it more readable.
            Creates a tidy dataset that calculates the average of each variable for each activity and subject, saved as tidySet.txt.

    2. CodeBook.md
        This file describes the data, the variables used in the analysis, and the transformations performed to clean and tidy the dataset. It serves as a reference for understanding the structure and contents of the data.

    3. tidySet.txt
        This file contains the final output of the analysis, a tidy dataset that includes the average of each variable for each activity and subject.

# How to Run the Script

Follow these instructions to run the run_analysis.R script and generate the tidy dataset:

    1. Download the Data:
        Obtain the dataset from the provided link and extract the contents of the zip file to your working directory.

    2. Run the Script:
        Open R or RStudio, and run the run_analysis.R script. This script will read in the data, process it, and output the tidy dataset as tidySet.txt in your working directory.

# About the Data

The data used in this project were collected from the accelerometers of the Samsung Galaxy S smartphone as part of a study on Human Activity Recognition Using Smartphones. This dataset provides measurements of various activities like walking, standing, sitting, etc., based on data from sensors embedded in the smartphones.

For further details about the variables and the cleaning process, please refer to the CodeBook.md file in this repository.
