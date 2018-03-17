# EDS4_Final_Project

Text Classification Using Scikit-Learn

### Dataset

The dataset that I'm using is the actual feedback/ comment from the customers about their dealership experience.

Each feedback/comment will have a few classified categories (up to 40+ categories) that were manually done by coder previously. So, I'm going to build a model to train on the labeled dataset with the pre-defined categories and feed the model with unseen data so that the model is able to classify them into categories.

X: Verbatim / Text in string
y: Category (Class 0 or Class 1)

### How to "pre-process" texts / words?

1. Remove all the numeric values from the texts
2. Convert all the texts to lowercase
3. Normalise the word to base form
4. Count the occurrence of each word
5. To filter out useless data

### Text Classification Models
1. Multinomial Naive Bayes Classifier
2. Logistic Regression
3. Stochastic Gradient Descent
4. Random Forest Classifier

