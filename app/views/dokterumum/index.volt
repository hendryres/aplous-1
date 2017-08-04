
{% extends 'template/aplous.volt' %}

{% block content %}
    <div class="form-group">
					<label class="col-sm-2">Canvas</label>
					<div class="col-sm-9">
						<div class="panel panel-info">
	                    	<div class="panel-heading"><strong>Canvas</strong></div>
	                    	<div class="panel-body container-fix">
	                            <div id="kanvaskajumum" class="kanvaskajumum-input"></div>
	                        </div>
	                    	<div class="panel-body">
	                            <div class="col-md-4 col-sm-12 col-xs-12">
	                                <span class="slider-container">
	                                    <p>Ukuran pena / penghapus / text:</p>
	                                    <input type="range" id="kanvaskajumum-slider" min="2" max="50" step="2" value="2" />
	                                    <p class="slider-value"><strong>2</strong></p>
	                                </span>
	                            </div>
	                            <div class="col-md-8 col-sm-12 col-xs-12">
	                                <a class="btn btn-primary btn-sm" id="kanvaskajumum-brush">Pena</a>
	                                <a class="btn btn-info btn-sm" id="kanvaskajumum-text">Text</a>
	                                <div class="btn-group dropup">
	                                    <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                        <span id="kanvaskajumum-current-color" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: black; min-width: 10px; width: 10px; height: 8px"></span> Warna
	                                    </a>
	                                    <ul class="dropdown-menu">
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: red; min-width: 10px; width: 10px; height: 8px"></span> Merah</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: pink; min-width: 10px; width: 10px; height: 8px"></span> Merah Muda</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: orange; min-width: 10px; width: 10px; height: 8px"></span> Orange</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: yellow; min-width: 10px; width: 10px; height: 8px"></span> Kuning</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: lime; min-width: 10px; width: 10px; height: 8px"></span> Lime</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: green; min-width: 10px; width: 10px; height: 8px"></span> Hijau</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: cyan; min-width: 10px; width: 10px; height: 8px"></span> Cyan</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: blue; min-width: 10px; width: 10px; height: 8px"></span> Biru</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: purple; min-width: 10px; width: 10px; height: 8px"></span> Ungu</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: magenta; min-width: 10px; width: 10px; height: 8px"></span> Magenta</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: brown; min-width: 10px; width: 10px; height: 8px"></span> Cokelat</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: grey; min-width: 10px; width: 10px; height: 8px"></span> Abu-Abu</a></li>
	                                        <li><a class="kanvaskajumum-color-picker" href="#"><span class="color-picker" style="border: 1px solid black; padding: 0 8px; margin: 4px; background-color: black; min-width: 10px; width: 10px; height: 8px"></span> Hitam</a></li>
	                                    </ul>
	                                </div>
	                                <a class="btn btn-warning btn-sm" id="kanvaskajumum-eraser">Hapus</a>
	                                <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-clear-kanvaskajumum">Hapus Semua</a>
	                            </div>
	                        </div>
	                        <div class="modal" id="modal-clear-kanvaskajumum" tabindex="-1" role="dialog">
	                            <div class="modal-dialog modal-sm" role="document">
	                                <div class="modal-content">
	                                    <div class="modal-header">
	                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                                        <h4 class="modal-title">Konfirmasi Hapus</h4>
	                                    </div>
	                                    <div class="modal-body">
	                                        <p>Hapus semua gambar obgyn?</p>
	                                    </div>
	                                    <div class="modal-footer">
	                                        <button type="button" class="btn btn-primary" id="kanvaskajumum-clear">Ya</button>
	                                        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</div>
				</div>
		  <script>
$(document).ready(function(){
	var $kanvaskajumum = $('#kanvaskajumum.kanvaskajumum-input').szBlankCanvas({
	    responsive: true,
	    canDraw: true,
	});

	/* Slider */
	$('#kanvaskajumum-slider').change(function(){
	    var pointSize = $	(this).val();
	    var valueLabel = $(this).parents('.slider-container').find('.slider-value strong').html(pointSize);
	    
	    $kanvaskajumum.szBlankCanvas('setPointSize', pointSize);
	});

	/* Brush */
	$('#kanvaskajumum-brush').click(function(){
	    $kanvaskajumum.szBlankCanvas('setMode', 'brush');
	});

	/* Text */

	$('#kanvaskajumum-text').click(function(){
	    $kanvaskajumum.szBlankCanvas('setMode', 'text');
	});

	/* Eraser */
	$('#kanvaskajumum-eraser').click(function(){
	    $kanvaskajumum.szBlankCanvas('setMode', 'eraser');
	});

	/* Color Picker */
	$('.kanvaskajumum-color-picker').click(function(e){
	    e.preventDefault();
	    var color = $(this).find('.color-picker').css('background-color');
	    $kanvaskajumum.szBlankCanvas('setColor', color);
	    $('#kanvaskajumum-current-color').css('background-color', color);
	});

	/* Clear */
	$('#kanvaskajumum-clear').click(function(){
	    $kanvaskajumum.szBlankCanvas('clearCanvas');
	    $(this).parents('.modal').modal('hide');
	});
});
</script>
{% endblock %}