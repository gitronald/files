#' Enhanced Working Directory View
#'
#' @param dir character, the directory in which to view files
#' @param hidden.files logical, include hidden files
#' @param hidden.dirs logical, include hidden directories
#' @param ... additional arguments to pass to \code{list.files} which this
#'   function is built around
#'
#' @return a data.frame of the directories and files names in presentation
#'   format
#'
#' @importFrom stats setNames
#' @export
#' @examples
#' lf()
#'
lf = function(dir = ".", hidden.files = TRUE, hidden.dirs = FALSE, ...){

  fileDetails = df(dir, all.files = hidden.files, ...)
  tFiles = row.names(fileDetails[which(!fileDetails$isdir), ])  # Top Level Files
  dirNames = row.names(fileDetails[which(fileDetails$isdir), ]) # Top Level Dirs

  if(!hidden.dirs){
    hiddenDirNames = dirNames[grepl("^\\.", dirNames)]
    dirNames = dirNames[!dirNames %in% hiddenDirNames]
  }

  dirList = list()
  dirList[[1]] = tFiles
  for(i in dirNames){
    dirList[[i]] = list.files(i)
  }

  dirList = lapply(dirList, `length<-`, max(lengths(dirList))) # Set max length and fill
  file.frame = matrix(unlist(dirList), ncol = max(lengths(dirList)), byrow = T)
  file.frame = apply(file.frame, 2, function(x) {           # Remove NAs
    x = ifelse(is.na(x), " ", x)
  })

  folderName = getwd()
  folderName = strsplit(folderName, "/")
  folderName = folderName[[1]][lengths(folderName)]

  file.frame = setNames(data.frame(t(file.frame)),
                        c(folderName, dirNames))

  cat(getwd(), "\n\n")
  return(file.frame)
}
