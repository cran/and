# Generated by staticimports; do not edit by hand.
# ======================================================================
# Imported from pkg:staticimports
# ======================================================================

is_windows <- function() .Platform$OS.type == "windows"
# Generated by staticimports; do not edit by hand.
# ======================================================================
# Imported from pkg:stringstatic
# ======================================================================

#' Remove matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_remove_all()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param pattern Pattern to look for.
#'
#'   The default interpretation is a regular expression,
#'   as described in [base::regex].
#'   Control options with [regex()].
#'
#'   Match a fixed string (i.e. by comparing only bytes), using [fixed()].
#'   This is fast, but approximate.
#'
#' @return A character vector.
#' @noRd
str_remove_all <- function(string, pattern) {
	if (length(string) == 0 || length(pattern) == 0) return(character(0))
	is_fixed <- inherits(pattern, "stringr_fixed")
	Vectorize(gsub, c("pattern", "x"), USE.NAMES = FALSE)(
		pattern, replacement = "", x = string, perl = !is_fixed, fixed = is_fixed
	)
}

#' Replace matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_replace_all()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param pattern Pattern to look for.
#'
#'   The default interpretation is a regular expression,
#'   as described in [base::regex].
#'   Control options with [regex()].
#'
#'   Match a fixed string (i.e. by comparing only bytes), using [fixed()].
#'   This is fast, but approximate.
#'
#' @param replacement A character vector of replacements.
#'   Should be either length one, or the same length as `string` or `pattern`.
#'   References of the form `\1`, `\2`, etc. will be replaced with the contents
#'   of the respective matched group (created by `()`).
#'
#'   To perform multiple replacements in each element of `string`,
#'   pass a named vector `(c(pattern1 = replacement1))` to `str_replace_all()`.
#'
#'   To replace the complete string with `NA`,
#'   use `replacement = NA_character_`.
#'
#'   Using a function for `replacement` is not yet supported.
#'
#' @return A character vector.
#' @noRd
str_replace_all <- function(string, pattern, replacement) {
	is_fixed <- inherits(pattern, "stringr_fixed")

	if (!is.null(names(pattern))) {
		for (i in seq_along(pattern)) {
			string <- gsub(
				pattern = names(pattern)[[i]],
				replacement = pattern[[i]],
				x = string,
				perl = !is_fixed,
				fixed = is_fixed
			)
		}
		return(string)
	}

	if (length(string) == 0 || length(pattern) == 0 || length(replacement) == 0) {
		return(character(0))
	}

	Vectorize(gsub, c("pattern", "replacement", "x"), USE.NAMES = FALSE)(
		pattern, replacement, x = string, perl = !is_fixed, fixed = is_fixed
	)
}
