#Shiny Application and Reproducible Pitch - Mortgage Calculator
library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Mortgage Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      # Documentation for novice users
      h4("How to Use This Calculator:"),
      p("1. Enter the loan amount in dollars."),
      p("2. Input the annual interest rate as a percentage."),
      p("3. Specify the loan term in years."),
      p("4. Click 'Calculate' to see the results."),
      br(),
      p("The calculator will show your monthly payment, total interest paid, and an amortization schedule."),
      hr(),
      
      # Input fields
      numericInput("loan_amount", "Loan Amount ($):", 200000, min = 1000, max = 1000000),
      numericInput("interest_rate", "Annual Interest Rate (%):", 3.5, min = 0.1, max = 20),
      numericInput("loan_term", "Loan Term (years):", 30, min = 1, max = 50),
      actionButton("calculate", "Calculate")
    ),
    
    mainPanel(
      # Results
      h3("Monthly Payment:"),
      textOutput("monthly_payment"),
      h3("Total Interest Paid:"),
      textOutput("total_interest"),
      h3("Amortization Schedule:"),
      plotOutput("amortization_plot"),
      
      # Additional explanation
      hr(),
      h4("Understanding the Results:"),
      p("Monthly Payment: This is the amount you'll pay each month for the duration of your loan."),
      p("Total Interest Paid: This shows the total amount of interest you'll pay over the life of the loan."),
      p("Amortization Schedule: This graph shows how your loan balance decreases over time, and how the proportion of your payment that goes to principal vs. interest changes throughout the loan term."),
      p("- The blue line shows your remaining loan balance over time."),
      p("- The red line shows the cumulative interest paid."),
      p("- The green line shows the cumulative principal paid.")
    )
  )
)

# Define server logic  
server <- function(input, output) {
  calculate_mortgage <- function(loan_amount, annual_rate, term_years) {
    monthly_rate <- annual_rate / (12 * 100)
    num_payments <- term_years * 12
    monthly_payment <- (loan_amount * monthly_rate * (1 + monthly_rate)^num_payments) / 
      ((1 + monthly_rate)^num_payments - 1)
    total_paid <- monthly_payment * num_payments
    total_interest <- total_paid - loan_amount
    list(monthly_payment = monthly_payment, total_interest = total_interest)
  }
  
  results <- eventReactive(input$calculate, {
    calculate_mortgage(input$loan_amount, input$interest_rate, input$loan_term)
  })
  
  output$monthly_payment <- renderText({
    paste0("$", round(results()$monthly_payment, 2))
  })
  
  output$total_interest <- renderText({
    paste0("$", round(results()$total_interest, 2))
  })
  
  output$amortization_plot <- renderPlot({
    monthly_rate <- input$interest_rate / (12 * 100)
    num_payments <- input$loan_term * 12
    monthly_payment <- results()$monthly_payment
    
    balance <- numeric(num_payments)
    interest <- numeric(num_payments)
    principal <- numeric(num_payments)
    
    balance[1] <- input$loan_amount
    for (i in 1:num_payments) {
      interest[i] <- balance[i] * monthly_rate
      principal[i] <- monthly_payment - interest[i]
      if (i < num_payments) balance[i+1] <- balance[i] - principal[i]
    }
    
    df <- data.frame(
      Month = 1:num_payments,
      Balance = balance,
      Interest = interest,
      Principal = principal
    )
    
    ggplot(df, aes(x = Month)) +
      geom_line(aes(y = Balance, color = "Balance")) +
      geom_line(aes(y = cumsum(Interest), color = "Cumulative Interest")) +
      geom_line(aes(y = cumsum(Principal), color = "Cumulative Principal")) +
      labs(title = "Mortgage Amortization Schedule", y = "Amount ($)", color = "Legend") +
      theme_minimal()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)