# Updated_rarifyFunction.R
# Rarefies counts to 110 following the EDAS-style workflow:
# - Samples with total <= 110 are unchanged
# - Samples with total > 110 are randomly subsampled to 110 individuals
#
# Modernized to avoid deprecated dplyr NSE functions and to support column names with spaces.

rarify <- function(bugdatlong, UID, finalID, count, target_n = 110) {

  # Defensive checks
  req <- c(UID, finalID, count)
  missing <- req[!req %in% names(bugdatlong)]
  if (length(missing) > 0) {
    stop("rarify(): Missing column(s): ", paste(missing, collapse = ", "))
  }

  # Total counts per sample
  totals <- bugdatlong |>
    dplyr::group_by(dplyr::across(dplyr::all_of(UID))) |>
    dplyr::summarise(bugtotal = sum(.data[[count]], na.rm = TRUE), .groups = "drop")

  dat <- dplyr::left_join(bugdatlong, totals, by = UID)

  # Samples already <= target_n: keep as-is
  keep_as_is <- dat |>
    dplyr::filter(.data$bugtotal <= target_n) |>
    dplyr::mutate(
      SampleCount = .data$bugtotal,
      Count = .data[[count]]
    ) |>
    dplyr::select(dplyr::all_of(UID), dplyr::all_of(finalID), SampleCount, Count)

  # Samples > target_n: expand rows by count, sample target_n, then re-count
  to_subsample <- dat |>
    dplyr::filter(.data$bugtotal > target_n) |>
    dplyr::select(dplyr::all_of(UID), dplyr::all_of(finalID), dplyr::all_of(count))

  if (nrow(to_subsample) == 0) {
    return(keep_as_is)
  }

  expanded <- to_subsample |>
    tidyr::uncount(weights = .data[[count]])

  subsampled <- expanded |>
    dplyr::group_by(dplyr::across(dplyr::all_of(UID))) |>
    dplyr::slice_sample(n = target_n) |>
    dplyr::ungroup()

  rarefied <- subsampled |>
    dplyr::count(dplyr::across(dplyr::all_of(c(UID, finalID))), name = "Count") |>
    dplyr::group_by(dplyr::across(dplyr::all_of(UID))) |>
    dplyr::mutate(SampleCount = sum(.data$Count)) |>
    dplyr::ungroup()

  dplyr::bind_rows(keep_as_is, rarefied)
}
