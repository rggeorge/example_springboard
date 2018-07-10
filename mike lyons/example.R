# Example names viz
library(ggplot2)

kid_names = read.csv("kid_names.csv")
ggplot(kid_names, aes(x=year, y=total_usage, group=name, col=name)) + geom_line()

all_names = read.csv("all_names.csv")
all_names$gen='parents'
all_names$gen[all_names$name=='Andrew']='kids'
all_names$gen[all_names$name=='Nathan']='kids'
all_names$gen[all_names$name=='Ryan']='kids'
all_names$gen[all_names$name=='Elizabeth']='kids'
ggplot(all_names[all_names$name!='David',], aes(x=year, y=total_usage, group=name, col=name, linetype=gen)) + geom_line()

# looking for clusters
meta = read.csv("name_metadata.csv")
ggplot(meta, aes(x=window_fn, y=pct_ratio)) + geom_point()

# finding peaks
pk = read.csv("peak_dat2.csv")
ggplot(pk, aes(x=year, y=total_usage, group=name, col=name, alpha=is_peak)) + geom_point()