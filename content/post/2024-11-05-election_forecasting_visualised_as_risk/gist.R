# https://projects.fivethirtyeight.com/2024-election-forecast/
# https://projects.fivethirtyeight.com/2020-election-forecast/
# https://projects.fivethirtyeight.com/2016-election-forecast/

# install.packages("remotes")
remotes::install_github("EDJNet/riskviewer")

## N.B. the visualisation barely holds together, breaks down when changing aspect ratio

library("riskviewer")
library("patchwork")

forecast_df <- tibble::tribble(~year, ~D, ~R, ~N, 
                               2016, 0.714-0.005, 0.286-0.005, 0.01,
                               2020, 0.8916, 0.1039, 0.0045,
                               2024, 504/1000, 494/1000, 2/1000) |> 
  dplyr::arrange(year)

## N.B. Dropping the option of no majority in the college, less than 0.5%

forecast_ratio_list <- forecast_df |> 
  dplyr::mutate(D = D+N/2, 
                R = R+N/2) |> 
  dplyr::select(-N) |> 
  dplyr::rename(Democratic = D, Republican = R) |> 
  tidyr::pivot_longer(cols = Democratic:Republican, names_to = "Risk", values_to = "Ratio") |> 
  dplyr::group_split(year, .keep = FALSE)


names(forecast_ratio_list) <- unique(forecast_df$year)


plots_l <- purrr::map(
  .x = names(forecast_ratio_list),
  .f = \(current_year) {
    rv_create_airplane(risk_ratio = forecast_ratio_list[[current_year]],
                       title = current_year,
                       fill = c("#5768ac", "#fa5a50"),
                       font_family = "Roboto Condensed",
                       font_family_seats = "Roboto Mono",
                       legend_position = "top")
  }
)

plane_combo_gg <- plots_l  |> 
  patchwork::wrap_plots(
    guides = "collect"
  ) +
  plot_annotation(
    title = "Who is going to win the U.S. presidential election according to polls?",
    subtitle = "
Imagine it's election day.  
Imagine you are assigned a random seat when boarding a plane.
The colour you'll get tells you who eventually wins.

These are the planes you would have boarded in the latest three U.S. elections.",
    caption = 'Election forecasts by fivethirtyeight.com\nVisualisation by Giorgio Comai - made with `riskviewer`',
    theme = ggplot2::theme(
      title = ggplot2::element_text(
        size = 22,
        family = "Roboto Black"),
      text = ggplot2::element_text(
        family = "Roboto Condensed")
    )
  ) &
  ggplot2::theme(legend.position = "top") 

ggplot2::ggsave(filename = "plane_combo.png",
                plot = plane_combo_gg,
                width = 12,
                height = 17,
                bg = "white")
