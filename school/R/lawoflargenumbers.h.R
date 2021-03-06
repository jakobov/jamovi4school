
# This file is automatically generated, you probably don't want to edit this

lawOfLargeNumbersOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "lawOfLargeNumbersOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            throw = "c1",
            num = 10,
            theoMean = FALSE, ...) {

            super$initialize(
                package="School",
                name="lawOfLargeNumbers",
                requiresData=FALSE,
                ...)

            private$..throw <- jmvcore::OptionList$new(
                "throw",
                throw,
                options=list(
                    "c1",
                    "c2",
                    "d1",
                    "d2"),
                default="c1")
            private$..num <- jmvcore::OptionInteger$new(
                "num",
                num,
                default=10)
            private$..theoMean <- jmvcore::OptionBool$new(
                "theoMean",
                theoMean,
                default=FALSE)

            self$.addOption(private$..throw)
            self$.addOption(private$..num)
            self$.addOption(private$..theoMean)
        }),
    active = list(
        throw = function() private$..throw$value,
        num = function() private$..num$value,
        theoMean = function() private$..theoMean$value),
    private = list(
        ..throw = NA,
        ..num = NA,
        ..theoMean = NA)
)

lawOfLargeNumbersResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "lawOfLargeNumbersResults",
    inherit = jmvcore::Group,
    active = list(
        loln = function() private$.items[["loln"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Law of Large Numbers")
            self$add(jmvcore::Image$new(
                options=options,
                name="loln",
                title="",
                width=400,
                height=300,
                renderFun=".lawoflargenumbers"))}))

lawOfLargeNumbersBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "lawOfLargeNumbersBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "School",
                name = "lawOfLargeNumbers",
                version = c(1,0,0),
                options = options,
                results = lawOfLargeNumbersResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' Law of Large Numbers
#'
#' 
#' @param throw .
#' @param num .
#' @param theoMean .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$loln} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' @export
lawOfLargeNumbers <- function(
    throw = "c1",
    num = 10,
    theoMean = FALSE) {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("lawOfLargeNumbers requires jmvcore to be installed (restart may be required)")


    options <- lawOfLargeNumbersOptions$new(
        throw = throw,
        num = num,
        theoMean = theoMean)

    analysis <- lawOfLargeNumbersClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

