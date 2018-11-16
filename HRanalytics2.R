# Load the packages
library(readr)
library(dplyr)

# Import the data
survey <- read_csv("survey_data.csv")

# Get an overview of the data
summary(survey)

# Examine the counts of the department variable
survey %>% count(department)

#EX2
# Output the average engagement score for each department, sorted
survey %>%
  group_by(department) %>%
  summarize(avg_engagement = mean(engagement)) %>%
  arrange(avg_engagement)

#Ex3
# Create the disengaged variable and assign the result to survey
survey_disengaged <- survey %>% 
  mutate(disengaged = ifelse(engagement <= 2, 1, 0)) 

survey_disengaged

# Summarize the three variables by department
survey_summary <- survey_disengaged %>% 
  group_by(department) %>% 
  summarize(pct_disengaged = mean(disengaged),
            avg_salary = mean(salary),
            avg_vacation_days = mean(vacation_days_taken))

survey_summary

#Ex4

