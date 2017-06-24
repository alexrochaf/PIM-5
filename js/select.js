//Cidades e Estado
document.querySelector('#estado').addEventListener('change', (event) => {
    var select = event.target;

    var buscaCidades = "/Ajax/cidades?uf=" + select.options[select.selectedIndex].value

    var cidades = [];

    var selectCidades = document.querySelector("#cidade");

    var load = $('.form-control');

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            cidades = JSON.parse(this.responseText);
            var x = document.querySelector("#cidade").options
            x.length = 0

            for (var i = 0; i < cidades.length; i++) {
                var novaOpt = document.createElement("option");
                novaOpt.value = cidades[i].Id;
                novaOpt.textContent = cidades[i].Nome;
                selectCidades.appendChild(novaOpt);
            }

            load.selectpicker('refresh');
        }
    };
    xmlhttp.open("GET", buscaCidades, true);
    xmlhttp.send();
})

//