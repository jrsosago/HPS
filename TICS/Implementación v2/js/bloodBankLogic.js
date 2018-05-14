$("#dotations-table a").on('click', function(){
    $(".main-row").addClass(" hide");
    $(".details-row").removeClass("hide");
});

var myPieChart = new Chart($("#bloods-chart"),{
    type: 'pie',
    data: {
        labels: ["A+", "A-", "O+", "O-", "B-", "B+", "AB+", "AB-"],
        datasets: [
            {
                label: "Tipos de sangre",
                data: [20, 35, 40, 60, 50, 35, 44, 25],
                backgroundColor: [
                    "rgba(151,187,205,0.4)",
                    "rgba(220,220,220,0.4)",
                    "rgba(247,70,74,0.4)",
                    "rgba(70,191,189,0.4)",
                    "rgba(253,180,92,0.4)",
                    "rgba(148,159,177,0.4)",
                    "rgba(77,83,96,0.4)"
                ],
                borderWidth: [1, 1, 1, 1, 1, 1, 1, 1]
            }
        ]
    },
    options: {
        legend: {
            display: false
        }
    }
});

var myPieChart = new Chart($("#details-chart"),{
    type: 'line',
        data: {
            labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            datasets: [{ 
                data: [1,5,3,7,2,0,3,5,3,2,1,1],
                label: "Cantidad de donaciones",
                borderColor: "#3e95cd",
                fill: false}]
        },
        options: {}
});