
{% extends 'template/aplous.volt' %}

{% block content %}
    <div class="top-content">
        <div class="container-fluid container-fixed-lg sm-p-l-20 sm-p-r-20">
            <ul class="breadcrumb">
                <li>
					<p>Home</p>
                </li>
                <li>
					<a href="#" class="active">RANAP</a>
                </li>
            </ul>
        </div>
	</div>
    <!-- START JUMBOTRON -->
    <div class="jumbotron" >
        <div class="sm-p-l-20 sm-p-r-20 m-b-50">

        </div>
    </div>
    <!-- END JUMBOTRON -->
	 <!-- Modal -->
         <div class="modal fade fill-in" style="background-color: rgba(255, 255, 255, 1);" id="modalFillIn" tabindex="-1" role="dialog" aria-hidden="true">
            <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              <i class="pg-close"></i>
            </button>-->
            <div class="modal-dialog bg-white" style="width:100%; height:100%;">
			
              <div class="modal-content">
                <div class="modal-header">
					<div class="panel panel-transparent">
						<div class="panel-heading">
							<div class="panel-title">Data Penanggung Jawab
							</div>
						</div>
					</div>
                </div>
                <div class="modal-body">
					
                </div>
                <div class="modal-footer">
                </div>
              </div>
              <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
          </div>
          <!-- Modal -->
	<form name="frmpendaftaran" id="frmpendaftaran" method="post" class="frmpendaftaran" onsubmit="simpan();return false;" enctype="multipart/form-data">
        <div class="panel panel-transparent"><!-- START PANEL -->
			<div class="panel-heading">
				<div class="panel-title">Data Pasien
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Cara Masuk</label>
							<select class="full-width" data-placeholder="Pilih Cara Masuk" data-init-plugin="select2" name="cmbcaramasuk">
								<optgroup>
									<option value=""></option>
									<option value="TK">TK</option>
									<option value="SD">SD</option>
									<option value="SLTP">SLTP</option>
									<option value="SLTA">SLTA</option>
									<option value="HI">D1</option>
									<option value="HI">D2</option>
									<option value="D3">D3</option>
									<option value="S1">S1/D4</option>
									<option value="S2">S2</option>
									<option value="S3">S3</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group form-group-default required ">
							<label>No RM</label>
							<input type="text" class="form-control" name="txtrm" id="txtrm" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required">
							<label>Nama Pasien</label>
							<input type="text" class="form-control" name="txtnamalengkap" required>
						</div>
						<div class="form-group form-group-default input-group">
							<label>Tanggal Lahir</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal" name="dtptanggallahir" id="dtptanggallahir">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Penanggung Jawab</label>
							<input type="text" class="form-control" name="txtpenanggungjawab" />
							<span class="input-group-btn">
								<button type="button" class="btn btn-default btn-sm" data-target="#modalFillIn" data-toggle="modal" id="btnFillSizeToggler" onclick="kirimmodal();return false;">
									<span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<span class="ace-icon fa fa-pencil icon-on-right bigger-110"></span>
								</button>
							</span>
						</div>
						<div class="form-group form-group-default required">
							<label>Handphone</label>
							<input type="text" class="form-control" name="txthandphone" required>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-heading">
				<div class="panel-title">Data RANAP
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Gedung</label>
							<select class="full-width" data-placeholder="Pilih Gedung" data-init-plugin="select2" name="cmbcaramasuk">
								<optgroup>
									<option value=""></option>
									<option value="TK">TK</option>
									<option value="SD">SD</option>
									<option value="SLTP">SLTP</option>
									<option value="SLTA">SLTA</option>
									<option value="HI">D1</option>
									<option value="HI">D2</option>
									<option value="D3">D3</option>
									<option value="S1">S1/D4</option>
									<option value="S2">S2</option>
									<option value="S3">S3</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Kelas</label>
							<select class="full-width" data-placeholder="Pilih Kelas" data-init-plugin="select2" name="cmbcaramasuk">
								<optgroup>
									<option value=""></option>
									<option value="TK">TK</option>
									<option value="SD">SD</option>
									<option value="SLTP">SLTP</option>
									<option value="SLTA">SLTA</option>
									<option value="HI">D1</option>
									<option value="HI">D2</option>
									<option value="D3">D3</option>
									<option value="S1">S1/D4</option>
									<option value="S2">S2</option>
									<option value="S3">S3</option>
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Ruang Rawat</label>
							<input type="email" class="form-control" name="txtpenanggungjawab">
							<span class="input-group-addon">
								<i class="fa fa-search"></i>
							</span>
						</div>
						<div class="form-group form-group-default required">
							<label>Kamar</label>
							<input type="text" class="form-control" name="txtdiagnosa" required>
						</div>
						
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required">
							<label>Diagnosa</label>
							<input type="text" class="form-control" name="txtdiagnosa" required>
						</div>
						<div class="form-group ">
							<label><b>BPJS Bermasalah</b></label>
							<div class="radio radio-primary">
								<input type="radio" checked="checked" value="A" name="rdigoldarah" id="A">
								<label for="A">Ya</label>
								<input type="radio" value="B" name="rdigoldarah" id="B">
								<label for="B">Tidak</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-heading">
				<div class="panel-title">Metode Pembayaran
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Jenis Pembayaran</label>
							<select class="full-width" data-placeholder="Pilih Pembayaran" data-init-plugin="select2" name="cmbmetodepembayaran">
								<optgroup>
									<option value=""></option>
									<option value="TK">TK</option>
									<option value="SD">SD</option>
									<option value="SLTP">SLTP</option>
									<option value="SLTA">SLTA</option>
									<option value="HI">D1</option>
									<option value="HI">D2</option>
									<option value="D3">D3</option>
									<option value="S1">S1/D4</option>
									<option value="S2">S2</option>
									<option value="S3">S3</option>
								</optgroup>
							</select>
						</div>	
					</div>
				</div>
			</div>
			<div class="panel-heading">
				<div class="panel-title">Dokter Penanggung Jawab
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default required">
							<label>DPJP 1</label>
							<input type="text" class="form-control" name="txtdpjp1" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required">
							<label>DPJP 2</label>
							<input type="text" class="form-control" name="txtdpjp2" required>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<div class="input-group">
		<button class="btn-save btn btn-primary btn-lg visible-lg"  type="submit" name="btnregister" id="btnregister"> Tambah</button>
		<button class="btn-rst btn btn-info btn-lg visible-lg" type="reset" name="reset">Reset</button>
		</div>
		<!-- START COMPOSE BUTTON FOR TABS -->
        <div class="compose-wrapper visible-xs">
            <button class="compose-email text-info pull-right m-r-10 m-t-10" type="submit" name="btnregister" id="btnregister"><i class="fa fa-pencil-square-o"></i></button>
			<button class="compose-email text-info pull-right m-r-10 m-t-10" type="reset" name="btnreset" id="btnreset"><i class="fa fa-refresh"></i></button>
        </div>
        <!-- END COMPOSE BUTTON -->
	</form>
 <script type="text/javascript">
 function simpan()
 {
			var data = $('#frmpendaftaran').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Pasien/simpan') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
					}
					else
					{
						sweetAlert("Transaksi gagal!", "", "error");
					}
                },
				error:function()
				{
					sweetAlert("Error!", "", "error");
				}
            });
 }
 
 function kirimmodal()
 {
			var txtrm = $("input[name='txtrm']").val();
			$.ajax({
                type:"POST",
                url:"{{ url('ranap/modal') }}",
                data:{txtrm:txtrm},
                success:function(response)
				{
					 $('.modal-body').html(response);
                },
				error:function()
				{
					sweetAlert("Error!", "", "error");
				}
            });
 }
 </script>

{% endblock %}