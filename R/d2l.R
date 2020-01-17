d2l_dumpbin <- function() {
  path <- "C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/bin/dumpbin.exe"

  if (!file.exists(path)) {
    stop("Can't find 'dumpbin.exe', ",
         "download and install build tools from ",
         "https://go.microsoft.com/fwlink/?LinkId=691126",
         call. = FALSE)
  }

  path
}

#' Convert DLL to LIB
#'
#' Converts a MSVC compiled DLL to MinGW compatible
#' LIB format.
#'
#' @param path The path to the dll to convert.
#'
#' @export
d2l <- function(path) {
  dumpbin <- d2l_dumpbin()

  export <- system2(dumpbin,
                    args = c("/EXPORTS", path),
                    stdout = TRUE)

  library_name <- tools::file_path_sans_ext(basename(path))
  writeLines(export,
             file.path(sirname(path), paste0(library_name, ".def")))
}
