library("PNADcIBGE")
library("survey")
library("dplyr")

# Cria o diretório, se não existir
dir.create("C:/ufpel/analises", showWarnings = FALSE, recursive = TRUE)

for(i in 2022:2024){
  if(i < 2024){
    for(j in 1:4){
      dados_PNADc <- get_pnadc(year = i, quarter = j, vars = c("VD4002", "VD4014", "V2007"),
                               design = FALSE, labels = FALSE)
      
      # Filtrando dados iguais a zero e nulos 
      dados_PNADc <- dados_PNADc %>%
        filter(across(everything(), ~ !is.na(.)))
      
      save(dados_PNADc, file = paste0("C:/ufpel/analises/pnadc_", i, "_", j, ".Rdata"))
      gc()
    }
  } else {
    dados_PNADc <- get_pnadc(year = i, quarter = 1, vars = c("VD4001", "VD4002", "V2007"),
                             design = FALSE, labels = FALSE)
    
    # Filtrando dados iguais a zero e nulos 
    dados_PNADc <- dados_PNADc %>%
      filter(across(everything(), ~ !is.na(.)))
    
    save(dados_PNADc, file = paste0("C:/ufpel/analises/pnadc_", i, "_", 1, ".Rdata"))
    gc()
  }
}


