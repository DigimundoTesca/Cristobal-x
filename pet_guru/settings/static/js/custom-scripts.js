/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

(function ($) {
    "use strict";
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
			
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });

            /* MORRIS BAR CHART
			-----------------------------------------*/
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: 'Enero',
                    a: 100,
                    b: 90
                }, {
                    y: 'Febrero',
                    a: 75,
                    b: 65
                }, {
                    y: 'Marzo',
                    a: 50,
                    b: 40
                }, {
                    y: 'Abril',
                    a: 75,
                    b: 65
                }, {
                    y: 'Mayo',
                    a: 50,
                    b: 40
                }, {
                    y: 'Junio',
                    a: 75,
                    b: 65
                }, {
                    y: 'Julio',
                    a: 100,
                    b: 90
                }],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B'],
                hideHover: 'auto',
                resize: true
            });

            /* MORRIS DONUT CHART
			----------------------------------------*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "Casos concluidos",
                    value: 12
                }, {
                    label: "Total analizados",
                    value: 30
                }, {
                    label: "En proceso",
                    value: 20
                }],
                resize: true
            });

            /* MORRIS AREA CHART
			----------------------------------------*/

            Morris.Area({
                element: 'morris-area-chart',
                data: [{
                    period: '2010 Q1',
                    total: 2666,
                    analizado: null,
                    proceso: 2647
                }, {
                    period: '2010 Q2',
                    total: 2778,
                    analizado: 2294,
                    proceso: 2441
                }, {
                    period: '2010 Q3',
                    total: 4912,
                    analizado: 1969,
                    proceso: 2501
                }, {
                    period: '2010 Q4',
                    total: 3767,
                    analizado: 3597,
                    proceso: 5689
                }, {
                    period: '2011 Q1',
                    total: 6810,
                    analizado: 1914,
                    proceso: 2293
                }, {
                    period: '2011 Q2',
                    total: 5670,
                    analizado: 4293,
                    proceso: 1881
                }, {
                    period: '2011 Q3',
                    total: 4820,
                    analizado: 3795,
                    proceso: 1588
                }, {
                    period: '2011 Q4',
                    total: 15073,
                    analizado: 5967,
                    proceso: 5175
                }, {
                    period: '2012 Q1',
                    total: 10687,
                    analizado: 4460,
                    proceso: 2028
                }, {
                    period: '2012 Q2',
                    total: 8432,
                    analizado: 5713,
                    proceso: 1791
                }],
                xkey: 'period',
                ykeys: ['total', 'analizado', 'proceso'],
                labels: ['total', 'analizado', 'proceso'],
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });

            /* MORRIS LINE CHART
			----------------------------------------*/
            Morris.Line({
                element: 'morris-line-chart',
                data: [{
                    y: '2006',
                    a: 100,
                    b: 90
                }, {
                    y: '2007',
                    a: 75,
                    b: 65
                }, {
                    y: '2008',
                    a: 50,
                    b: 40
                }, {
                    y: '2009',
                    a: 75,
                    b: 65
                }, {
                    y: '2010',
                    a: 50,
                    b: 40
                }, {
                    y: '2011',
                    a: 75,
                    b: 65
                }, {
                    y: '2012',
                    a: 100,
                    b: 90
                }],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B'],
                hideHover: 'auto',
                resize: true
            });
           
     
        },

        initialization: function () {
            mainApp.initFunction();

        }

    }
    // Initializing ///

    $(document).ready(function () {
        mainApp.initFunction();
    });

}(jQuery));
