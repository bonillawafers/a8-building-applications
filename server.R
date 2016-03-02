

shinyServer(function(input, output) {
  someAction <- eventReactive(input$render, {
    runif(input$radio == TRUE)
    iris_tmp <- iris %>%
                filter(Species == input$radio) %>% 
                mutate("Sepal" = Sepal.Width + Sepal.Length)
    final_df <- iris_tmp[1:input$obs,]
    plot_ly(final_df,
            x = final_df$Petal.Length,
            y = final_df$Petal.Width,
            mode = "markers",
            color = Sepal) %>%
            layout(title = "Petal Width & Length in Relation to Sepal Size",
              xaxis = list(title = "Petal Length"),
              yaxis = list(title = "Petal Width")
      )
  })
  output$bubble <- renderPlotly({
    someAction()
  })
})