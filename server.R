#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$graf <- renderPlot({
        input$boton
        # generate bins based on input$bins from ui.R
        #Generador de resultados de un dado
        dado<-function (n){
            resultados<-as.character(as.integer(runif(n,min=1,max=7)))
            datos<-data.frame(resultados)
            ggplot(datos,aes(x=resultados))+
                geom_bar(aes(fill=resultados))+
                geom_text(stat="count",aes(label =..count.., vjust = 2))
        }
        unDado<-function(m){
            if (m==1){
                x1<-c(2)
                y1<-c(2)
            }else{
                if (m==2){
                    x1<-c(1,3)
                    y1<-c(1,3)
                }else{
                    if (m==3){
                        x1<-c(1,2,3)
                        y1<-c(1,2,3)
                    }else{
                        if (m==4) {
                            x1<-c(1,1,3,3)
                            y1<-c(1,3,1,3)
                        }else{
                            if(m==5){
                                x1<-c(1,1,2,3,3)
                                y1<-c(1,3,2,1,3)
                            }else{
                                if(m==6){
                                    x1<-c(1,1,1,3,3,3)
                                    y1<-c(1,2,3,1,2,3)
                                }
                            }
                        }
                    }
                }
            }
            prueba<-data.frame(x1,y1)
            ggplot(prueba,aes(x=x1,y=y1))+
                geom_point(size=20)+
                theme(axis.title=element_blank(),axis.text = element_blank(),axis.ticks = element_blank())+
                scale_y_discrete()+
                scale_x_discrete()
            
        }
        if(input$veces>1){
            isolate(dado(input$veces))
        }
        else{
            #aqui
            if(input$veces==1){
                resultadoIndividual<-as.character(as.integer(runif(1,min=1,max=7)))
                unDado(resultadoIndividual)
            }else{
                0
            }
        }
    })
    
    
})
