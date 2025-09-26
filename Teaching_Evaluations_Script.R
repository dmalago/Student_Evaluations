

setwd("~/Documents/Job Applications/George Mason University/Figures")

# install.packages(c("ggplot2", "dplyr", "scales", "rlang"))  # if needed

library(ggplot2)
library(dplyr)
library(scales)
library(rlang)

library(ggplot2)

# Example data frame
df <- data.frame(
  category = c("Variation of 'Best TA'", "Variation of 'One of the Best TAs'", "Approachable", "Enthusiastic"),
  value = c(30, 18, 9, 15)
)
# Reorder categories: largest value on the left
df$category <- factor(df$category, levels = df$category[order(-df$value)])


# Vertical bar graph
ggplot(df, aes(x = category, y = value, fill = category)) +
  geom_col(width = 0.7, color = "white") +
  geom_text(aes(label = value),
            vjust = -0.5, size = 4, color = "black", fontface = "bold") +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Counts by Category across 6 Years of Teaching Assistantship",
       x = NULL, y = "Count") +
  theme_minimal(base_size = 20) +
  theme(
    legend.position = "none",
    text = element_text(color = "black", face = "bold"),    # global text style
    axis.text.x = element_text(color = "black", face = "bold"), # force x-axis ticks
    axis.text.y = element_text(color = "black", face = "bold"), # force y-axis ticks
    plot.title = element_text(hjust = 0.5, face = "bold")   # ensure title is bold
  ) +
  expand_limits(y = max(df$value) * 1.15)
