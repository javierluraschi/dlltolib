d2l_dumpbin <- function() {
  path <- "C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/bin/dumpbin.exe"

  if (!dir.exists(path)) {
    stop("Can't find 'dumpbin.exe', ",
         "download and install build tools from ",
         "https://go.microsoft.com/fwlink/?LinkId=691126",
         call. = FALSE)
  }

  path
}

d2l <- function() {
  dumbin <- d2l_dumpbin()
}
