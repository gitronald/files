#' Describe Files
#'
#' @param dir the directory containing the files to describe
#'
#' @return A data.frame containing file information for all files in \code{dir}
#'
#' @importFrom stats setNames
#' @export
#' @examples
#' df()
#'
df = function(dir = "."){
  files = list.files(dir)
  files = file.info(files)
  return(files)
}
