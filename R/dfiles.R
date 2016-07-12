#' Describe Files
#'
#' @param dir the directory containing the files to describe
#'
#' @return A data.frame containing file information for all files in \code{dir}
#' @export
#'
#' @examples
#' dfiles()
#'
dfiles = function(dir = "."){
  files = list.files(dir)
  files = file.info(files)
  return(files)
}
