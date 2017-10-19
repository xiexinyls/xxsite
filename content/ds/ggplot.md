---
title: "ggplot2 in R"
draft: false
---

The basic grammar to call ggplot2 in R is as the following form

    ggplot(data=dfname, aes(x=varname1, y=varname2) ) +
    geom_<geom type>( aes(blabla) ) +
    theme()

The link between data and figure is established by specifying an "aethetic" (an `aes` object with some input arguments). The previous specification can be seen as base and later graphic elements will be overlapped to the base adopting or overwriteing the pevious aesthetic specification. For example, if you specify the `data` argument in the first `ggplot` function, you dont' have to specify `data` argument for `geom_<geom type>` again because of this automatic applying rule.

Unlike `matplotlib` in Python, `ggplot2` uses every data record to specify the plotting element in the figure. Therefore, it is better to use long data format for easier plotting. If the data are in wide format, use R library `reshape2` to convert the wide format to long format first. The following `reshape2` example converts the wide format dataframe into long format dataframe selecting only `var3` and `var4` variables with `var1` and `var2` as ID variables.

    longdata = melt( widedata, id.vars=c('var1','var2'), measure.vars=c('var3','var4'), 
               variable.name='var', value.name='value' )
    longdata = melt( widedata, id.vars=1:2, measure.vars=3:4,
               variable.name='var', value.name='value' )

# XY Plot

XY plot could be represented by markers, lines, bars, and etc.

# Change Text

## Title and XY Axis Label

Title and XY labels could be changed by adding

    ggplot()+blablabla+
      xlab('X')+
      ylab('Y')+
      ggtitle('My Title')

## Legend

When `color` and `fill` are specified for `geom_line` and `geom_point` aesthetic, a legend will be automatically linked to that specified variable and added to the plot to for guidance purpose. The title for the legend is automatically specified by the variable name and the legend labels are specified by the variable value by its original order. This can be modifed by adding `scale` element

    ggplot(data=df)+geom_line( aes(x=var1, y=var2, color=var3) )+
      scale_color_discrete( name='Legend Title', labels=c('val1', 'val2', 'val3') )

Similarly, fill scale element could be specified by adding `scale_fill_discrete` element.

# Output Graphics

R's graphcs could be output to many types of device. By default, the plot is output to the R windows device or R Studio graphic device shown in the window. You may direct it to other graphic device. To output PNG file, you may create a plot first, create an output device, print it.

    plt = ggplot()+blabla
    devpng = png('plot/figure.png', width=10, height=5, units='in', res=100)
    print(plt)
    dev.off()

Remeber to turn the device off with `dev.off()` after using it otherwise later printing will overwrite the previous plot because PNG file can only has one page. PDF device could be output in mutiple times so a multiple page PDF will be created. To generate antialias high quality graphics, remember to add `type='cairo'` option.

    devpng = png('plot/figure.png', width=10, height=5, units='in', res=100, type='cairo')
    print(plt)
    dev.off()

To output SVG format, use

    devsvg = svg('plot/figure.svg', width=10, height=5 )
    print(plt)
    dev.off()

To output PDF format, use

    devpdf = pdf('plot/figure.pdf', width=10, height=5 )
    print(plt1)
    print(plt2)
    dev.off()

