#' Describe Files
#'
#' @param dir the directory containing the files to describe
#' @param all.files logical, include hidden files and folders
#' @param ... additional arguments to pass to \code{list.files}
#'
#' @return A data.frame containing file information for all files in \code{dir}
#'
#' @importFrom stats setNames
#' @export
#' @examples
#' df()
#'
df = function(dir = ".", all.files = TRUE, ...){
  files = list.files(dir, all.files = all.files, no.. = TRUE, full.names = TRUE, ...)
  files = file.info(files)
  return(files)
}
