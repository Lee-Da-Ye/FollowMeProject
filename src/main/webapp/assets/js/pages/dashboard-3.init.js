function hexToRGB(a, e) {
    var r = parseInt(a.slice(1, 3), 16),
        t = parseInt(a.slice(3, 5), 16),
        o = parseInt(a.slice(5, 7), 16);
    return e ? "rgba(" + r + ", " + t + ", " + o + ", " + e + ")" : "rgb(" + r + ", " + t + ", " + o + ")"
}! function(i) {
    "use strict";

    function a() {
        this.$body = i("body"), this.charts = []
    }
    a.prototype.respChart = function(e, r, t, o) {
        var s = e.get(0).getContext("2d");
        Chart.defaults.global.defaultFontColor = "#8391a2", Chart.defaults.scale.gridLines.color = "#8391a2";
        var n = i(e).parent();
        return function() {
            var a;
            switch (e.attr("width", i(n).width()), r) {
                case "Line":
                    a = new Chart(s, {
                        type: "line",
                        data: t,
                        options: o
                    });
                    break;
                case "Doughnut":
                    a = new Chart(s, {
                        type: "doughnut",
                        data: t,
                        options: o
                    });
                    break;
                case "Pie":
                    a = new Chart(s, {
                        type: "pie",
                        data: t,
                        options: o
                    });
                    break;
                case "Bar":
                    a = new Chart(s, {
                        type: "bar",
                        data: t,
                        options: o
                    });
                    break;
                case "Radar":
                    a = new Chart(s, {
                        type: "radar",
                        data: t,
                        options: o
                    });
                    break;
                case "PolarArea":
                    a = new Chart(s, {
                        data: t,
                        type: "polarArea",
                        options: o
                    })
            }
            return a
        }()
    }, a.prototype.initCharts = function() {
        var a, e, r, t, o = [],
            s = ["#1abc9c", "#f1556c", "#4a81d4", "#e3eaef"];
        return 0 < i("#revenue-chart").length && (a = {
            labels: ["월", "화", "수", "목", "금", "토", "일"],
            datasets: [{
                label: "Current Week",
                backgroundColor: hexToRGB((r = (e = i("#revenue-chart").data("colors")) ? e.split(",") : s.concat())[0], .3),
                borderColor: r[0],
                data: [32, 42, 42, 62, 52, 75, 62]
            }, {
                label: "Previous Week",
                fill: !0,
                backgroundColor: "transparent",
                borderColor: r[1],
                borderDash: [5, 5],
                data: [42, 58, 66, 93, 82, 105, 92]
            }]
        }, o.push(this.respChart(i("#revenue-chart"), "Line", a, {
            maintainAspectRatio: !1,
            legend: {
                display: !1
            },
            tooltips: {
                intersect: !1
            },
            hover: {
                intersect: !0
            },
            plugins: {
                filler: {
                    propagate: !1
                }
            },
            scales: {
                xAxes: [{
                    reverse: !0,
                    gridLines: {
                        color: "rgba(0,0,0,0.05)"
                    }
                }],
                yAxes: [{
                    ticks: {
                        stepSize: 20
                    },
                    display: !0,
                    borderDash: [5, 5],
                    gridLines: {
                        color: "rgba(0,0,0,0)",
                        fontColor: "#fff"
                    }
                }]
            }
        }))), 0 < i("#projections-actuals-chart").length && (t = {
            labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            datasets: [{
                label: "입사자 수",
                backgroundColor: (r = (e = i("#projections-actuals-chart").data("colors")) ? e.split(",") : s.concat())[0],
                borderColor: r[0],
                hoverBackgroundColor: r[0],
                hoverBorderColor: r[0],
                data: [1, 5, 3, 5, 1, 0, 0, 0, 0, 0, 0, 0],
                barPercentage: .7,
                categoryPercentage: .5
            }, {
                label: "퇴사자 수",
                backgroundColor: r[1],
                borderColor: r[1],
                hoverBackgroundColor: r[1],
                hoverBorderColor: r[1],
                data: [0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0],
                barPercentage: .7,
                categoryPercentage: .5
            }]
        }, o.push(this.respChart(i("#projections-actuals-chart"), "Bar", t, {
            maintainAspectRatio: !1,
            legend: {
                display: !1
            },
            scales: {
                yAxes: [{
                    gridLines: {
                        display: !1
                    },
                    stacked: !1,
                    ticks: {
                        stepSize: 20
                    }
                }],
                xAxes: [{
                    stacked: !1,
                    gridLines: {
                        color: "rgba(0,0,0,0.01)"
                    }
                }]
            }
        }))), o
    }, a.prototype.init = function() {
        var e = this;
        Chart.defaults.global.defaultFontFamily = "Nunito,sans-serif", e.charts = this.initCharts(), i(window).on("resize", function(a) {
            i.each(e.charts, function(a, e) {
                try {
                    e.destroy()
                } catch (a) {}
            }), e.charts = e.initCharts()
        })
    }, i.ChartJs = new a, i.ChartJs.Constructor = a
}(window.jQuery),
function() {
    "use strict";
    window.jQuery.ChartJs.init()
}();