
{% extends 'template/aplous.volt' %}

{% block content %}
	<div class="top-content">
        <div class="container-fluid container-fixed-lg sm-p-l-20 sm-p-r-20">
            <ul class="breadcrumb">
                <li>
					<p>Pages</p>
                </li>
                <li>
					<a href="#" class="active">TINDAKAN IRJ</a>
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
	<div class="panel panel-transparent ">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-tabs-fillup" data-init-reponsive-tabs="dropdownfx">
            <li class="active">
                <a data-toggle="tab" href="#tab-fillup1"><span>Tindakan RS</span></a>
            </li>
            <li>
                <a data-toggle="tab" href="#tab-fillup2"><span>Diagnosa</span></a>
            </li>
            <li>
				<a data-toggle="tab" href="#tab-fillup3"><span>Equipment</span></a>
            </li>
			<li>
                <a data-toggle="tab" href="#tab-fillup4"><span>Obat Ruangan</span></a>
            </li>
			<li>
                <a data-toggle="tab" href="#tab-fillup5"><span>Rujuk</span></a>
            </li>
			<li>
                <a data-toggle="tab" href="#tab-fillup6"><span>Status Pasien</span></a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="tab-fillup1">
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>Tindakan</label>
							<input type="text" class="form-control" name="txttindakan" id="txttindakan" required>
						</div>
						<div class="form-group form-group-default required ">
							<label>Dokter</label>
							<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Tanggal</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
						<div class="form-group form-group-default required">
							<label>Harga</label>
							<input type="text" class="form-control" name="txtharga" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required">
							<label>Qty</label>
							<input type="text" class="form-control" name="txtqty" required>
						</div>
						<div class="form-group form-group-default required">
							<label>ICD 9</label>
							<input type="text" class="form-control" name="txticd9" required>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Pesan</button>
							</button>
						</div>
					</div>
				</div>
				<div class="panel panel-transparent">
					<div class="panel-heading">
						<div class="panel-title">List Tindakan
						</div>
						<div class="pull-right">
							<div class="col-xs-12">
								<input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<table class="table table-hover demo-table-search table-responsive-block" id="tableWithSearch">
							<thead>
								<tr>
									<th>Tindakan</th>
									<th>Harga</th>
									<th>Tanggal</th>
									<th>Dokter</th>
									<th>Qty</th>
									<th>User</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pull-right">
					<div class="col-xs-12">
						<button type="button" class="btn btn-primary btn-cons">Simpan</button>
						</button>
					</div>
                </div>	
            </div>
            <div class="tab-pane" id="tab-fillup2">
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>ICD 10</label>
							<input type="text" class="form-control" name="txticd10" id="txticd10" required>
						</div>
						<div class="form-group form-group-default required ">
							<label>Dokter</label>
							<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Jenis</label>
							<select class="full-width" data-placeholder="Pilih Jenis" data-init-plugin="select2" name="cmbjenis">
								<optgroup>
									<option value=""></option>
									<option value="UTAMA">UTAMA</option>
									<option value="SEKUNDER">SEKUNDER</option>
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Tanggal</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Pesan</button>
							</button>
						</div>
					</div>
				</div>
				<div class="panel panel-transparent">
					<div class="panel-heading">
						<div class="panel-title">List Tindakan
						</div>
						<div class="pull-right">
							<div class="col-xs-12">
								<input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<table class="table table-hover demo-table-search table-responsive-block" id="tableWithSearch1">
							<thead>
								<tr>
									<th>Diagnosa</th>
									<th>Jenis</th>
									<th>Tanggal</th>
									<th>Dokter</th>
									<th>User</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pull-right">
					<div class="col-xs-12">
						<button type="button" class="btn btn-primary btn-cons">Simpan</button>
						</button>
					</div>
                </div>
            </div>
            <div class="tab-pane" id="tab-fillup3">
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>Equipment</label>
							<input type="text" class="form-control" name="txtequipment" id="txtequipment" required>
						</div>
						<div class="form-group form-group-default required ">
							<label>Dokter</label>
							<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Tanggal</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
						<div class="form-group form-group-default required ">
							<label>Harga</label>
							<input type="text" class="form-control" name="txtharga" id="txtharga" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>Qty</label>
							<input type="text" class="form-control" name="txtqty" id="txtqty" required>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Pesan</button>
							</button>
						</div>
					</div>
				</div>
				<div class="panel panel-transparent">
					<div class="panel-heading">
						<div class="panel-title">List Tindakan
						</div>
						<div class="pull-right">
							<div class="col-xs-12">
								<input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<table class="table table-hover demo-table-search table-responsive-block" id="tableWithSearch3">
							<thead>
								<tr>
									<th>Tindakan</th>
									<th>Harga</th>
									<th>Tanggal</th>
									<th>Dokter</th>
									<th>Qty</th>
									<th>User</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pull-right">
					<div class="col-xs-12">
						<button type="button" class="btn btn-primary btn-cons">Simpan</button>
						</button>
					</div>
                </div>
            </div>
			<div class="tab-pane" id="tab-fillup4">
                <div class="row">
					<div class="col-sm-4">
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group form-group-default form-group-default-select2">
									<label class="">Pilih Depo</label>
									<select class="full-width" data-placeholder="Pilih Depo" data-init-plugin="select2" name="cmbdepo">
										<optgroup>
											<option value=""></option>
											<option value="UTAMA">UTAMA</option>
											<option value="SEKUNDER">SEKUNDER</option>
										</optgroup>
									</select>
								</div>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary btn-cons">Paket</button>
							</div>
						</div>
						<div class="form-group form-group-default required ">
							<label>Obat</label>
							<input type="text" class="form-control" name="txtobat" id="txtobat" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>Satuan</label>
							<input type="text" class="form-control" name="txtsatuan" id="txtsatuan" required>
						</div>
						<div class="form-group form-group-default input-group">
							<label>Tanggal</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>Dokter</label>
							<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>
						</div>
						<div class="form-group form-group-default required ">
							<label>Qty</label>
							<input type="text" class="form-control" name="txtqty" id="txtqty" required>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Pesan</button>
							</button>
						</div>
					</div>
				</div>
				<div class="panel panel-transparent">
					<div class="panel-heading">
						<div class="panel-title">List Tindakan
						</div>
						<div class="pull-right">
							<div class="col-xs-12">
								<input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<table class="table table-hover demo-table-search table-responsive-block" id="tableWithSearch4">
							<thead>
								<tr>
									<th>Obat Ruangan</th>
									<th>Satuan</th>
									<th>Qty</th>
									<th>Dokter</th>
									<th>Tanggal</th>
									<th>User</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pull-right">
					<div class="col-xs-12">
						<button type="button" class="btn btn-primary btn-cons">Simpan</button>
						</button>
					</div>
                </div>
            </div>
			<div class="tab-pane" id="tab-fillup5">
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Instalasi</label>
							<select class="full-width" data-placeholder="Pilih Instalasi" data-init-plugin="select2" name="cmbinstalasi">
								<optgroup>
									<option value=""></option>
									<option value="UTAMA">UTAMA</option>
									<option value="SEKUNDER">SEKUNDER</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Poli</label>
							<select class="full-width" data-placeholder="Pilih Poli" data-init-plugin="select2" name="cmbpoli">
								<optgroup>
									<option value=""></option>
									<option value="UTAMA">UTAMA</option>
									<option value="SEKUNDER">SEKUNDER</option>
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default required ">
							<label>No. SEP</label>
							<input type="text" class="form-control" name="txtnosep" id="txtnosep" required>
						</div>
						<div class="form-group form-group-default required ">
							<label>Dokter</label>
							<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Tanggal Rujukan</label>
							<input type="email" class="form-control" placeholder="Pilih Tanggal Rujukan" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Rujuk</button>
							</button>
						</div>
					</div>
				</div>
				<div class="panel panel-transparent">
					<div class="panel-heading">
						<div class="panel-title">Riwayat Rujuk
						</div>
						<div class="pull-right">
							<div class="col-xs-12">
								<input type="text" id="search-table" class="form-control pull-right" placeholder="Search">
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<table class="table table-hover demo-table-search table-responsive-block" id="tableWithSearch5">
							<thead>
								<tr>
									<th>Instalasi</th>
									<th>Poli</th>
									<th>Dokter</th>
									<th>Tanggal</th>
									<th>User Konsul</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
            </div>
			<div class="tab-pane" id="tab-fillup6">
                <div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default input-group">
							<label>Jam Keluar</label>
							<input type="email" class="form-control" placeholder="Pilih Jam Keluar" name="dtptanggal" id="dtptanggal">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
						</div>
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Status</label>
							<select class="full-width" data-placeholder="Pilih Status" data-init-plugin="select2" name="cmbstatus">
								<optgroup>
									<option value=""></option>
									<option value="BARU MENDAFTAR">BARU MENDAFTAR</option>
									<option value="ANTRIAN">ANTRIAN</option>
									<option value="KEMBALIKAN UANG">KEMBALIKAN UANG</option>
									<option value="KEMBALI LAGI">KEMBALI LAGI</option>
									<option value="SELESAI DOKTER">SELESAI DOKTER</option>
									<option value="KONSUL IGD">KONSUL IGD</option>
									<option value="INAP">INAP</option>
									<option value="PINDAH">PINDAH</option>
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Alasan Keluar</label>
							<select class="full-width" data-placeholder="Pilih Alasan Keluar" data-init-plugin="select2" name="cmbalasankeluar">
								<optgroup>
									<option value=""></option>
									<option value="DIRAWAT">DIRAWAT</option>
									<option value="MENINGGAL">MENINGGAL</option>
									<option value="NORMAL">NORMAL</option>
									<option value="POLI LAIN">POLI LAIN</option>
									<option value="PULANG PAKSA">PULANG PAKSA</option>
									<option value="RS LAIN">RS LAIN</option>
									<option value="TIDAK TAHU">TIDAK TAHU</option>
									<option value="RUJUK BALIK">RUJUK BALIK</option>
								</optgroup>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Keadaan Keluar</label>
							<select class="full-width" data-placeholder="Pilih Keadaan Keluar" data-init-plugin="select2" name="cmbkeadaankeluar">
								<optgroup>
									<option value=""></option>
									<option value="SEMBUH">SEMBUH</option>
									<option value="BELUM SEMBUH">BELUM SEMBUH</option>
									<option value="MEMBAIK">MEMBAIK</option>
									<option value="MEMBURUK">MEMBURUK</option>
									<option value="MENINGGAL > 48 JAM">MENINGGAL > 48 JAM</option>
									<option value="MENINGGAL < 48 JAM">MENINGGAL < 48 JAM</option>
								</optgroup>
							</select>
						</div>
					</div>
                </div>
				<div  class="row">
					<div class="pull-right">
						<div class="col-xs-12">
							<button type="button" class="btn btn-primary btn-cons">Edit</button>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
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