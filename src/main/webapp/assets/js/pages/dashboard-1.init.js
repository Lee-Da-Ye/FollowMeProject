var colors=["#f1556c"],dataColors=$("#total-revenue").data("colors");dataColors&&(colors=dataColors.split(","));var options={series:[68],chart:{height:242,type:"radialBar"},plotOptions:{radialBar:{hollow:{size:"65%"}}},colors:colors,labels:["Revenue"]},chart=new ApexCharts(document.querySelector("#total-revenue"),options);chart.render();colors=["#1abc9c","#4a81d4"];(dataColors=$("#sales-analytics").data("colors"))&&(colors=dataColors.split(","));options={series:[{name:"매출액",type:"column",data:[440,505,414,671,227,413,201,352,752,320,257,160]},{name:"판매량",type:"line",data:[23,42,35,27,43,22,17,31,22,22,12,16]}],chart:{height:378,type:"line",offsetY:10},stroke:{width:[2,3]},plotOptions:{bar:{columnWidth:"50%"}},colors:colors,dataLabels:{enabled:!0,enabledOnSeries:[1]},labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],xaxis:{type:"string"},legend:{offsetY:7},grid:{padding:{bottom:20}},fill:{type:"gradient",gradient:{shade:"light",type:"horizontal",shadeIntensity:.25,gradientToColors:void 0,inverseColors:!0,opacityFrom:.75,opacityTo:.75,stops:[0,0,0]}},yaxis:[{title:{text:"매출액"}},{opposite:!0,title:{text:"판매량"}}]};(chart=new ApexCharts(document.querySelector("#sales-analytics"),options)).render(),$("#dash-daterange").flatpickr({altInput:!0,mode:"range",altFormat:"F j, y",defaultDate:"today"});