const time = document.getElementById('time');
const date = document.getElementById('date');

    const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const daysNames = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];


const interval = setInterval(() => {

    const local = new Date();
    
    let day = local.getDate(),
        days = local.getDay(),
        month = local.getMonth(),
        year = local.getFullYear();
       

    time.innerHTML = local.toLocaleTimeString();
    date.innerHTML = `${daysNames[days]} ${day} de ${monthNames[month]} ${year}`;

});