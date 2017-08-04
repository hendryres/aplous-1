$('#btn-filter').click(function(){
    $('#modal-filter').modal('show');
});

$('#cari-data').on('keypress', function(event){
    if (event.which == 13) {
        cari_datatables($(this).val());
    }
});

$(document).on('keypress', '.input-filter', function(event){
    if (event.which == 13) {
        $('#filter-data').click();
    }
});

$(document).on('click', '#filter-data', function(event){
    event.preventDefault();
    filter_datatables();
    $('#modal-filter').modal('hide');
});

$(document).on('click', '#reset-filter', function(event){
    event.preventDefault();
    bersihkan_filter();
    $('#modal-filter').modal('hide');
});

function cari_datatables(search_value)
{
    filter_data = {
        search_string: search_value,
    }
    if (search_value != '') {
        $tabel_data.search(JSON.stringify(filter_data)).draw();
    } else {
        $tabel_data.search(search_value).draw();
    }
    $('[data-toggle="tooltip"]').tooltip();
}

var filter_data;

function filter_datatables()
{
    filter_data = {};
    
    $('.input-filter').each(function(){
        filter_data[$(this).attr('name')] = $(this).val();
    });
    
    $tabel_data.search(JSON.stringify(filter_data)).draw();
    $('[data-toggle="tooltip"]').tooltip();
}

function bersihkan_filter()
{
    $('.input-filter').each(function(){
        $(this).val('');
    });
        
    $('select.input-filter').each(function(){
        this.selectize.clear();
    });
    
    filter_datatables();
}