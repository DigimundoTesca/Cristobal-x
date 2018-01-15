$(document).ready(function() {

// Forms handlers
// $(".mailitbtn").on("click", function(e) {
//   e.preventDefault();
//   swal({
//     title: "Su pregunta será enviada!",
//     text: "Espere pronto una respuesta",
//     type: "success",
//     showCancelButton: true,
//     cancelButtonText: "Cancelar",
//     cancelButtonClass: 'btn btn-danger',
//     confirmButtonText: "Entendido",
//     confirmButtonClass: 'btn btn-success'
//     }).then(function () {
//       document.vacaquest.submit();
//     });
// });


// Sinlge Question gallery
jQuery(document).ready(function(){
    jQuery("#gallery").unitegallery();
});


// Register form password validation
(function($) {
    $('#id_password1, #id_password2').keyup(function() {
        var pass1 = $('#id_password1').val();
        var pass2 = $('#id_password2').val();
        if ( pass1 == pass2) {
            $('#messagepass').html('Las contraseñas coinciden').css('color', 'green');
            if (pass1.length  > '7') {
                $('#regisbtn').prop("disabled", false);
            }
        } else 
        $('#messagepass').html('Las contraseñas no coinciden').css('color', 'red');
    });
})(jQuery);


// Add images for new question
(function($) {
    var iCnt = 0;
    var formCnt = 1;
    var container = document.getElementById('imgcontainer');


    $('#btAdd').click(function(e) {
        e.preventDefault();
        if (iCnt <= 19) {
            iCnt = iCnt + 1;
            formCnt = formCnt + 1;
            $(container).append('<p> <input type="file" name="form-'+iCnt+'-image"\
                id="id_form-'+iCnt+'-image" class="btn btn-info"><input type="hidden"\
                name="form-'+iCnt+'-id" id="id_form-'+iCnt+'-id"></p>');
            $('#id_form-TOTAL_FORMS').val(formCnt);
            $('#id_form-'+iCnt+'-image').trigger('click');
        }
        else {

            $(container).append('<br><label>Limite Alcanzado</label>');
            $('#btAdd').attr('class', 'btn.secondary');
            $('#btAdd').attr('disabled', 'disabled');

        }
    });

    $('#btRemove').click(function(e) {
        e.preventDefault();
        if (iCnt != 0) { $('#image_' + iCnt).remove(); iCnt = iCnt - 1; formCnt= formCnt -1; }

        if (iCnt == 0) { 
            $(container).empty();
            $('#btAdd').removeAttr('disabled');
            $('#btAdd').attr('class', 'btn btn-primary')
        }
    });

    $('#btRemoveAll').click(function(e) {
        e.preventDefault();
        $(container).empty();
        iCnt = 0;
        formCnt = 1;
        $('#btAdd').removeAttr('disabled');
        $('#btAdd').attr('class', 'btn btn-primary');

    });
})(jQuery);


});



// reload page on answer
function myFunction() {
    location.reload();
}