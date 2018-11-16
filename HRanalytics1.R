#ch1Ex1
# Load the readr package
library(readr)

# Import the recruitment data
recruitment <- read_csv("recruitment_data.csv")

# Look at the first few rows of the dataset
head(recruitment)

#Ex2
# Load the dplyr package
library(dplyr)

# Get an overview of the recruitment data
summary(recruitment)

# See which recruiting sources the company has been using
recruitment %>% 
  count(recruiting_source)

# Find the average sales quota attainment for each recruiting source
avg_sales <- recruitment %>%
  group_by(recruiting_source) %>% 
  summarize(avg_sales_quota_pct = mean(sales_quota_pct)) 
  
# Display the result
avg_sales

# Find the average attrition for the sales team, by recruiting source, sorted from lowest attrition rate to highest
avg_attrition <- recruitment %>%
  group_by(recruiting_source) %>% 
  summarize(attrition_rate = mean(attrition)) %>% 
  arrange(attrition_rate)
  
# Display the result
avg_attrition


