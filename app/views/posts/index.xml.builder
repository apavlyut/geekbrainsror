xml.instruct!                   # <?xml version="1.0" encoding="UTF-8"?>
  xml.html {                      # <html>
    xml.head {                    #   <head>
      xml.title("History")        #     <title>History</title>
    }                            #   </head>
    xml.body {                    #   <body>
      xml.comment! "HI"           #     <!-- HI -->
      xml.h1("Header")            #     <h1>Header</h1>
      xml.p("paragraph")          #     <p>paragraph</p>
    }                            #   </body>
  }
