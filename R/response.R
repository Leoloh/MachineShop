#' Extract Response Variable
#' 
#' Extract the response variable from an object.
#' 
#' @rdname response-methods
#' 
#' @param object object containing a response.
#' @param ... arguments passed to other methods.
#' 
#' @examples
#' ## Survival response example
#' library(survival)
#' library(MASS)
#' 
#' fo <- Surv(time, status != 2) ~ sex + age + year + thickness + ulcer
#' response(fo, data = Melanoma)
#' 
response <- function(object, ...) {
  UseMethod("response")
}


#' @rdname response-methods
#' 
#' @param data data frame containing the values of a response variable defined in a formula.
#' 
response.formula <- function(object, data, ...) {
  eval(object[[2]], data)
}


response.ModelFrame <- function(object, ...) {
  response(formula(terms(object)), object)
}


response.tbl_df <- function(object, ...) {
  response(formula(object), object)
}


response.terms <- function(object, ...) {
  i <- attr(object, "response")
  all.vars(object)[i]
}


response.MLModelFit <- function(object, ...) {
  fitbit(object, "y")
}
