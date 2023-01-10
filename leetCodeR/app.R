library(shiny)

ui <- fluidPage(
  
  titlePanel("LeetCode-R"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "problem_type",
                  label = "Choose the problem type:",
                  choices = c("Reverse Integer", "Roman to Integer")
      )
    ),
    
    mainPanel(
      textInput("user_input", "Enter the input:"),
      actionButton("submit", "Submit"),
      verbatimTextOutput("output")
    )
  )
)

server <- function(input, output) {
  
  output$output <- renderPrint({
    if (input$submit > 0) {
      if (input$problem_type == "Reverse Integer") {
        int <- as.integer(input$user_input)
        int <- int * sign(int)
        int <- rev(strsplit(as.character(int), "")[[1]])
        int <- paste0(int, collapse = "")
        int <- as.integer(int) * sign(input$user_input)
        return(int)
      } else if (input$problem_type == "Roman to Integer") {
        roman <- input$user_input
        res <- 0
        for (i in 1:nchar(roman)) {
          if (roman[i] == 'I' && (roman[i + 1] == 'V' || roman[i + 1] == 'X')) {
            res <- res - 1
          } else if (roman[i] == 'X' && (roman[i + 1] == 'L' || roman[i + 1] == 'C')) {
            res <- res - 10
          } else if (roman[i] == 'C' && (roman[i + 1] == 'D' || roman[i + 1] == 'M')) {
            res <- res - 100
          } else if (roman[i] == 'I') {
            res <- res + 1
          } else if (roman[i] == 'V') {
            res <- res + 5
          } else if (roman[i] == 'X') {
            res <- res + 10
          } else if (roman[i] == 'L') {
            res <- res + 50
          } else if (roman[i] == 'C') {
            res <- res + 100
          } else if (roman[i] == 'D') {
            res <- res + 500
          } else if (roman[i] == 'M') {
            res <- res + 1000
          }
        }
        return(res)
      }
    }
  })
  
}

shinyApp(ui, server)