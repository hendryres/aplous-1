{% extends 'template/aplous.volt' %}

{% block content %}
	<div class="top-content">
        <div class="container-fluid container-fixed-lg sm-p-l-20 sm-p-r-20">
            <ul class="breadcrumb">
                <li>
					<p>Pages</p>
                </li>
                <li>
					<a href="#" class="active">Pasien</a>
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
							<div class="col-md-4">
								<div class="form-group form-group-default required ">
									<label>No RM</label>
									<input type="text" class="form-control" name="txtrm" required>
								</div>
								<div class="form-group form-group-default required">
									<label>Nama Lengkap</label>
									<input type="text" class="form-control" name="txtnamalengkap" required>
								</div>
								<div class="form-group form-group-default form-group-default-select2 required">
									<label class="">Jenis Kelamin</label>
									<select class="full-width" data-placeholder="Pilih Jenis Kelamin" data-init-plugin="select2" name="cmbjeniskelamin" required>
										<optgroup label="Alaskan/Hawaiian Time Zone">
											<option value="">-</option>
											<option value="L">LAKI-LAKI</option>
											<option value="P">PEREMPUAN</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group form-group-default required">
									<label>Usia</label>
									<input type="text" class="form-control" name="txtusia" required>
								</div>
								<div class="form-group form-group-default required ">
									<label>Tempat Lahir</label>
									<input type="text" class="form-control" name="txttempatlahir" required>
								</div>	
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default form-group-default-select2">
									<label class="">Status Perkawinan</label>
									<select class="full-width" data-placeholder="Pilih Status" data-init-plugin="select2" name="cmbstatuskawin">
										<optgroup label="Alaskan/Hawaiian Time Zone">
											<option value="">-</option>
											<option value="K0">TIDAK KAWIN</option>
											<option value="K1">KAWIN</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group form-group-default form-group-default-select2">
									<label class="">Agama</label>
									<select class="full-width" data-placeholder="Pilih Agama" data-init-plugin="select2" name="cmbagama">
										<optgroup label="Alaskan/Hawaiian Time Zone">
											<option value="">-</option>
											<option value="ISLAM">ISLAM</option>
											<option value="HINDU">HINDU</option>
											<option value="BUDHA">BUDHA</option>
											<option value="KRISTEN">KRISTEN</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group form-group-default form-group-default-select2">
									<label class="">Tingkat pendidikan</label>
									<select class="full-width" data-placeholder="Pilih Pendidikan" data-init-plugin="select2" name="cmbpendidikan">
										<optgroup>
											<option value="">-</option>
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
								<div class="form-group form-group-default">
									<label>Gelar</label>
									<input type="text" class="form-control" name="txtgelar">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>No. KTP/SIM</label>
									<input type="text" class="form-control" name="txtidentitas">
								</div>
								<div class="form-group form-group-default">
									<label>No.Passport</label>
									<input type="text" class="form-control" name="txtpassport">
								</div>
								<div class="form-group form-group-default">
									<label>Informasi RS dari</label>
									<input type="text" class="form-control" name="txtrefferensi">
								</div>
								<div class="form-group form-group-default form-group-default-select2">
									<label class="">Golongan Darah</label>
									<select class="full-width" data-placeholder="Pilih Golongan Darah" data-init-plugin="select2" name="cmbgolongandarah">
										<optgroup label="Alaskan/Hawaiian Time Zone">
											<option value="">-</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="O">O</option>
											<option value="AB">AB</option>
										</optgroup>
									</select>
								</div>
							</div>
						</div>
					</div>
				
					<div class="panel-heading">
						<div class="panel-title">Data Alamat
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
							<div class="col-md-4">
								<div class="form-group form-group-default required">
									<label>Alamat</label>
									<textarea class="form-control" name="txtalamat" required></textarea>
								</div>
								<div class="form-group form-group-default form-group-default-select2 required">
									<label class="">Wilayah</label>
									<select class="full-width" data-placeholder="Pili Wilayah" data-init-plugin="select2" name="cmbwilayah" required>
										<optgroup>
											<option value="">-</option>
											<option value="Jawa Barat">Jawa Barat</option>
											<option value="Jawa Timur">Jawa Timur</option>
											<option value="Jawa Tengah">Jawa Tengah</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group form-group-default form-group-default-select2 required">
									<label class="">Kabupaten</label>
									<select class="full-width" data-placeholder="Pilih Kabupaten" data-init-plugin="select2" name="cmbkabupaten" required>
										<optgroup label="Jawa Barat">
											<option value="">-</option>
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
							<div class="col-md-4">
								<div class="form-group form-group-default form-group-default-select2 required">
									<label class="">Kecamatan</label>
									<select class="full-width" data-placeholder="Pilih Kecamatan" data-init-plugin="select2" name="cmbkecamatan" required>
										<optgroup label="Alaskan/Hawaiian Time Zone">
											<option value="">-</option>
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
								<div class="form-group form-group-default">
									<label>Kode Pos</label>
									<input type="text" class="form-control" name="txtkodepos">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Suku</label>
									<input type="text" class="form-control" name="txtsuku">
								</div>
								<div class="form-group form-group-default">
									<label>Kebangsaan</label>
									<input type="text" class="form-control" name="txtkebangsaan">
								</div>
							</div>
						</div>
					</div>
				
					<div class="panel-heading">
						<div class="panel-title">Data Keluarga
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
							<div class="col-md-4">
								<div class="form-group form-group-default required">
									<label>Nama Ibu</label>
									<input type="text" class="form-control" name="txtnamaibu" required>
								</div>
								<div class="form-group form-group-default required">
									<label>Nama Ayah</label>
									<input type="text" class="form-control" name="txtnamaayah" required>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Nama Suami/Istri</label>
									<input type="text" class="form-control" name="txtnamapasangan">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default required">
									<label>Nama Keluarga</label>
									<input type="text" class="form-control" name="txtnamakeluarga" required> 
								</div>
							</div>
						</div>
					</div>
				
					<div class="panel-heading">
						<div class="panel-title">Data Kontak
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
							<div class="col-md-4">
								<div class="form-group form-group-default required">
									<label>Handphone</label>
									<input type="text" class="form-control" name="txthandphone" required>
								</div>
								<div class="form-group form-group-default">
									<label>Telphone</label>
									<input type="text" class="form-control" name="txtphone">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Fax</label>
									<input type="text" class="form-control" name="txtfax">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default ">
									<label>Email</label>
									<input type="email" class="form-control" name="txtemail">
								</div>
							</div>
						</div>
					</div>	
				
					<div class="panel-heading">
						<div class="panel-title">Data Pekerjaan
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
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Pekerjaan</label>
									<input type="text" class="form-control" name="txtpekerjaan">
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Alamat bekerja</label>
									<textarea class="form-control" name="txtalamatbekerja"></textarea>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-default">
									<label>Telphone kantor</label>
									<input type="text" class="form-control" name="txtphonekantor">
								</div>
							</div>
						</div>
					</div>
					<div class="panel-heading">
						<div class="panel-title">
						</div>
						<div class="tools">
							<a class="collapse" href="javascript:;"></a>
							<a class="config" data-toggle="modal" href="#grid-config"></a>
							<a class="reload" href="javascript:;"></a>
							<a class="remove" href="javascript:;"></a>
						</div>
					</div>
				</div><!-- END PANEL -->
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
						window.location.href='http://localhost/aplous/pasien';
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
 </script>
             
{% endblock %}