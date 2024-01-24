# Loading packages --------------------------------------------------------

library(tidyverse)
library(NHANES)

glimpse(NHANES)
str(NHANES)

# Select specific columns -------------------------------------------------

select(NHANES, Age, Weight, BMI)
select(NHANES, -HeadCirc)

select(NHANES, starts_with("BP"))
select(NHANES, ends_with("Day"))
select(NHANES, contains("Age"))

# Renaming all columns ----------------------------------------------------

NHANES_small <- rename_with(NHANES, snakecase::to_snake_case)

# Renaming specific column ------------------------------------------------

NHANES_small <- rename(NHANES_small, sex = gender)
NHANES_small
View(NHANES_small)



# Chaining the functions with the pipe ------------------------------------

colnames(NHANES_small)
NHANES_small %>%
  colnames()

NHANES_phys <- NHANES_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)

NHANES_small %>%
  select(bp_sys_ave, education)

NHANES_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave)

NHANES_small %>%
  select(bmi, contains("age"))

NHANES_small %>%
  select(starts_with("BP")) %>%
  rename(bp_systolic = bp_sys_ave)
