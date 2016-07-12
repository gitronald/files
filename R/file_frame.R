#' Enhanced Working Directory View
#'
#' @param dir character, the directory in which to view files
#'
#' @return a data.frame of the directories and files names in presentation format
#' @export
#'
#' @examples
#' file_frame()
#'
file_frame = function(dir = "."){

  fileDetails = dfiles(dir)
  tFiles = row.names(fileDetails[which(!fileDetails$isdir), ])  # Top Level Files
  dirNames = row.names(fileDetails[which(fileDetails$isdir), ]) # Top Level Dirs

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
