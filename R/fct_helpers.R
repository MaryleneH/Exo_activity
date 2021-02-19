# Fonction pour échantillonner une table

my_sample <- function(dataset,number){
  dataset %>%
    sample_n(number)
}

# Fonction pour filtrer selon le type d'activité

filtrer_activites <- function(dataset,type_activity){
  dataset %>%
    filter(`Activity Type` == type_activity)
}

# Fonction pour créer un nuage de points selon Distance / Time et Activity Type

utils::globalVariables(c("Distance", "Time", "Activity Type","Elev Gain","Date"))

graph_dist_time  <- function(dataset){
  dataset %>%
    ggplot() +
    geom_point(aes(x = Distance , y =Time, color = `Activity Type`))+
    theme_minimal()

}

# Fonction pour créer un box_plot selon Time /Distance / Activity type

graph_act_time <- function(dataset){
  dataset %>%
    ggplot(aes(x =  `Activity Type` , y =Time, color =  `Activity Type`)) +
    geom_boxplot()+
    theme_minimal()
}

# Fonction pour créer un box-plot selon Activity type / Elev Gain

graph_act_elev <-  function(dataset){
  dataset %>%
    ggplot(aes(x = `Activity Type`, y =`Elev Gain`, color = `Activity Type`) ) +
    geom_boxplot()+
    theme_minimal()


}

# Fonction pour créer un diagramme en barres selon Date / Distance et Activity Type
graph_dist_month <- function(dataset){
  dataset %>%
    ggplot() +
    aes(x = lubridate::month(Date), y = Distance, fill = `Activity Type`) +
    geom_col()+
    theme_minimal()+
    labs(x ="Month")

}



