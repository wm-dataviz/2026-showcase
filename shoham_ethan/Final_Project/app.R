#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# These are the images that will fill in my post
slides <- c("Title.png", "Text1.png", "Per_Capita.png", 
            "Text2.png", "US_FA_GE_USG.png", 
            "Text3.png", "Map2.png", "Map3.png", "Map.png",
            "Text4.png", "Democracy.png",
            "Text5.png",
            "Text6.png")

# This section creates the windows where my visuals will sit
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                    .ig-slide {
                    width: min(90vw, 420px);
                    aspect-ratio: 4/5;
                    margin: 30px auto 10px auto;
                    border: 1px solid;
                    border-radius: 18px;
                    overflow: hidden;
                    background: white;
                    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
                    }
                    .ig-slide img {
                    width: 100%;
                    height: 100%;
                    object-fit: contain;
                    display: block;
                    }
                    .slide-text {
                    width: min(90vw, 420px);
                    margin: 0 auto 16px auto;
                    padding: 12px 14px;
                    background: #f7f7f7;
                    border-radius: 12px;
                    font-size: 15p;
                    line-height: 1.4;
                    }
                    .nav-row {
                    display: flex;
                    justify-content: space-between;
                    gap: 12px;
                    }
                    "))
  ),
  
# This calls those windows
  div(class = "ig-slide",
      uiOutput("slide_image")
      ),

# This calls my text box underneath the windows
  uiOutput("slide_text"),

# This calls my navigational arrows
  div(class = "nav-row",
      actionButton("left", label = "\u2190", class = "arrow-btn"),
      textOutput("counter"),
      actionButton("right", label = "\u2192", class = "arrow-btn")
      )
)

# This is what my text box will say. To fit Instagram formatting, the text needs to be the same for every slide.
slide_notes <- c(
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship.",
  "There is something special about Georgia. Despite being poor 
  in resources and economically weak, Georgia averages more U.S. foreign 
  assistance per capita than any other post-Soviet country (besides Ukraine, 
  recently) and countries of a similar population size to itself in the 21st 
  century. This post explores the abnormality of the U.S-Georgia foreign 
  assistance relationship."
  
)

# This section defines the interactivity of the navigational arrows
server <- function(input, output, session) {
  current <- reactiveVal(1)
  
  observeEvent(input$right, {
    new_val <- current() + 1
    if (new_val > length(slides)) new_val <- length(slides)
    current(new_val)
  })
  
  observeEvent(input$left, {
    new_val <- current() - 1
    if (new_val < 1) new_val <- 1
    current(new_val)
  })

    output$slide_image <- renderUI ({
      tags$img(
        src = slides[current()], 
        alt = paste("Slide", 
                    current()
                    ))
    })
    
    output$slide_text <- renderUI({
      div(class = "slide-text", slide_notes[current()])
    })
    
    output$counter <- renderText({
      paste(current(), "/", length(slides))
    })
}

# This runs the application. Yay!
shinyApp(ui = ui, server = server)
