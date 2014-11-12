
#Time series plot in Time :D


day3 <- structure(list(Date = c("11/12/2012", "11/12/2012", "11/12/2012", 
                                "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", 
                                "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", 
                                "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", "11/12/2012", 
                                "11/12/2012", "11/12/2012"), Time = c("07:46:10", "07:46:20", 
                                                                      "07:46:30", "07:46:40", "07:46:50", "07:47:00", "07:47:10", "07:47:20", 
                                                                      "07:47:30", "07:47:40", "07:47:50", "07:48:00", "07:48:10", "07:48:20", 
                                                                      "07:48:30", "07:48:40", "07:48:50", "07:49:00", "07:49:10", "07:49:20"
                                ), Axis1 = c(59L, 651L, 59L, 0L, 22L, 50L, 0L, 0L, 114L, 899L, 
                                             129L, 33L, 21L, 9L, 224L, 135L, 266L, 16L, 59L, 126L), Steps = c(1L, 
                                                                                                              2L, 1L, 0L, 2L, 1L, 0L, 0L, 5L, 15L, 6L, 2L, 2L, 0L, 8L, 5L, 
                                                                                                              16L, 1L, 3L, 8L)), .Names = c("Date", "Time", "Axis1", "Steps"
                                                                                                              ), row.names = 52838:52857, class = "data.frame")

library(scales)
ggplot(day3, aes(x=strptime(Time, "%H:%M:%S"), y=Axis1)) + geom_line(aes(group = 1)) +
     theme_bw() +
     xlab("Time") + 
     ylab("Activity (Counts per 10 seconds)") +
     scale_x_datetime(limits=c(as.POSIXct("07:46:40",format="%H:%M:%S"),as.POSIXct("07:49:00",format="%H:%M:%S")),
                      breaks=date_breaks("1 min"), labels = date_format("%H:%M"))