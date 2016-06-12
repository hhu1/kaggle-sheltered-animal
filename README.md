# kaggle-sheltered-animal

This repository contains the script for the kaggle animal shelter competition:https://www.kaggle.com/c/shelter-animal-outcomes . The description of this dataset is below:

>Every year, approximately 7.6 million companion animals end up in US shelters. Many animals are given up as unwanted by their owners, while others are picked up after getting lost or taken out of cruelty situations. Many of these animals find forever families to take them home, but just as many are not so lucky. 2.7 million dogs and cats are euthanized in the US every year.
>
>Using a dataset of intake information including breed, color, sex, and age from the Austin Animal Center, we're asking Kagglers to predict the outcome for each animal.
>
>We also believe this dataset can help us understand trends in animal outcomes. These insights could help shelters focus their energy on specific animals who need a little extra help finding a new home. We encourage you to publish your insights on Scripts so they are publicly accessible.

There are 4 scripts in the repository:
fix_age.py: converts age into numeric format;
impute.R: impute missing data;
fix_color_breed.py: reduce the number of levels in color and breeds so that it is suitable for regression;
sol.py: run stepwise logistic regression.

To find out the most likely outcomes, I used stepwise logistic regressions on each on the five possible outcomes. The R step function was used to select the best model by their AICs. Resulting probabilities were normalized to sum to 1.
