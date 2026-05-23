# theme_watch.R
# Shared dark theme + colour palettes for The 1000 Watch Project.
# Sourced by every .qmd so the whole site stays visually consistent.

library(ggplot2)

# --- Core colours (kept in sync with styles.css) ---
watch_bg     <- "#0e1117"   # page background
watch_text   <- "#c9d1d9"   # body text / axis labels
watch_title  <- "#f0f6fc"   # near-white for titles
watch_muted  <- "#8b949e"   # subtitles, secondary
watch_grid   <- "#262c36"   # subtle grid lines
watch_accent <- "#FFD166"   # signature yellow

# Categorical palette: vivid but balanced, all readable on a dark background.
# Order: yellow, sky, mint, coral, violet, orange.
watch_cat <- c("#FFD166", "#4CC9F0", "#06D6A0", "#EF476F", "#9B5DE5", "#F8961E")

# --- Shared theme (transparent so the dark page shows through) ---
theme_watch <- function(base_size = 13) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.background   = element_rect(fill = "transparent", colour = NA),
      panel.background  = element_rect(fill = "transparent", colour = NA),
      legend.background = element_rect(fill = "transparent", colour = NA),
      legend.key        = element_rect(fill = "transparent", colour = NA),
      text          = element_text(colour = watch_text),
      plot.title    = element_text(colour = watch_title, face = "bold",
                                   size = base_size + 3),
      plot.subtitle = element_text(colour = watch_muted, margin = margin(b = 12)),
      axis.text     = element_text(colour = watch_muted),
      axis.title    = element_text(colour = watch_text),
      legend.text   = element_text(colour = watch_text),
      legend.title  = element_text(colour = watch_text),
      panel.grid.major = element_line(colour = watch_grid, linewidth = 0.4),
      panel.grid.minor = element_blank()
    )
}

scale_fill_watch   <- function(...) scale_fill_manual(values = watch_cat, ...)
scale_colour_watch <- function(...) scale_colour_manual(values = watch_cat, ...)
